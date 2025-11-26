#!/usr/bin/env -S v run

import build
import os

// Define variables that can be used to change tasks in the build script
const app_name = 'hello'
const program_args = 'World'
const build_dir = 'target'

// Make the build context
mut context := build.context(
	// Set the default task to `release` when no arguments are provided
	default: 'examples'
)

// Add a few simple tasks
// context.task(name: 'doc', run: |self| system('echo "Nothing to do"'))
// context.task(name: 'run', run: |self| system('v run . ${program_args}'))
// context.task(name: 'build', run: |self| system('v .'))
// context.task(name: 'build.prod', run: |self| system('v -prod -o ${app_name} .'))

// `_` to denote "private" tasks. Nothing stops the user from using it, but
// this tells them that the task is not meant to be used by them.
// context.task(
// 	name: '_mkdirs'
// 	// The `help` field is displayed in `--tasks` to give a short summary of what the task does.
// 	help: 'Makes the directories used by the application'
// 	run:  fn (self build.Task) ! {
// 		if !exists(build_dir) {
// 			mkdir_all(build_dir) or { panic(err) }
// 		}
// 	}
// )

// This task will only run when the `test.txt` file is outdated
// context.artifact(
// 	name: 'test.txt'
// 	help: 'Generate test.txt'
// 	run:  fn (self build.Task) ! {
// 		write_file('test.txt', time.now().str())!
// 	}
// )

context.task(
	name: 'release'
	help: 'Build the app in production mode, generates documentation, and releases the build on Git'
	// depends: ['_mkdirs', 'doc', 'test.txt']
	run: fn (self build.Task) ! {
		// system('v examples/http_server_uv.v')
		// system('cd ./thirdparty && git pull origin master')
		hash := os.execute('cd ./thirdparty && git rev-parse HEAD').output.trim_space()
		println('Latest libuv commit: ${hash}')
		// Pretend we are using Git to publish the built file as a release here.
	}
)

context.task(
	name: 'test'
	help: 'Run the tests'
	run:  fn (self build.Task) ! {
		system('v -cc gcc -stats test tests/')
	}
)

context.task(
	name: 'fmt'
	help: 'fmt the source code'
	run:  fn (self build.Task) ! {
		system('v fmt -w .')
	}
)

context.task(
	name: 'docs'
	help: 'build the documentation'
	run:  fn (self build.Task) ! {
		if exists('./docs') {
			rmdir_all('./docs') or { panic(err) }
		}
		system('v doc . -f markdown -o ./docs/markdown')
		system('v doc . -f html -o ./docs/html')
		rename('./docs/html/vlibuv.html', './docs/html/index.html')!
		// system('v -e \'import net.http.file; file.serve(folder: "./docs/html", on: ":5002")\'')
	}
)

	context.task(
	name: 'examples'
	help: 'build the examples'
	run:  fn (self build.Task) ! {
		examples := os.walk_ext('./examples', '.v')
		for ex in examples {
			cc_flag := if os.getenv('OS') == 'Windows_NT' { '-cc gcc' } else { '' }
			code := execute('v ${cc_flag} ${ex}').exit_code
			message := if code == 0 { 'Success' } else { 'failed' }
			println('Building example: ${ex} - ${message}')
		}
	}
)

context.task(
	name: 'symlink'
	help: 'Create a symlink to the libuv library'
	run:  fn (self build.Task) ! {
		cwd := os.getwd()
		modules_dir := os.vmodules_dir()
		symlink_path := '${modules_dir}/vlibuv'
		println('Creating symlink: ${symlink_path} -> ${cwd}')

		if exists(symlink_path) {
			if is_dir(symlink_path) && !is_link(symlink_path) {
				rmdir_all(symlink_path)!
			} else {
				rm(symlink_path)!
			}
			println('Removed existing path: ${symlink_path}')
		}

		if os.getenv('OS') == 'Windows_NT' {
			// On Windows, use PowerShell to create a symlink (requires admin)
			ps_cmd := 'New-Item -ItemType SymbolicLink -Path "${symlink_path}" -Target "${cwd}" -Force'
			result := os.execute('powershell -Command "${ps_cmd}"')
			if result.exit_code != 0 {
				eprintln('Failed to create symlink. You may need to run as Administrator.')
				eprintln('Error: ${result.output}')
				return error('symlink creation failed')
			}
			println('Created Windows symlink: ${symlink_path}')
		} else {
			// On Unix-like systems, create a symlink
			symlink(cwd, symlink_path)!
			println('Created Unix symlink: ${symlink_path}')
		}
	}
)

context.task(
	name: 'examples.clean'
	help: 'Clean all built examples'
	run:  fn (self build.Task) ! {
		walk_fn := fn (path string) {
			if !path.ends_with('.v') {
				println('removing: ${path}')
				rm(path) or { panic(err) }
			}
		}
		walk('./examples', walk_fn)
	}
)

context.task(
	name: 'update'
	help: 'Update libuv'
	run:  fn (self build.Task) ! {
		if exists('./thirdparty/.git') {
			println('Updating libuv: git pull origin master')
			pulled := execute('cd ./thirdparty && git pull origin master').output
			if pulled.contains('Already up to date') {
				return
			}
			hash := execute('cd ./thirdparty && git rev-parse HEAD')
			if system('v -stats test tests/') != 0 {
				println('Tests failed, reverting to previous commit')
				old_hash := os.read_file('./commit.txt')!
				system('cd ./thirdparty && git reset --hard ${old_hash.trim_space()}')
				return
			}
			write_file('./commit.txt', hash.output.trim_space())!
			return
		}
		if !exists('./thirdparty') {
			mkdir('./thirdparty') or { panic(err) }
		}

		system('cd ./thirdparty && git init')
		system('cd ./thirdparty && git remote add origin https://github.com/libuv/libuv.git')
		system('cd ./thirdparty && git config core.sparseCheckout true')
		// only include the files we need/want
		mut file := create('./thirdparty/.git/info/sparse-checkout')!
		file.writeln('include/')!
		file.writeln('src/')!
		file.writeln('LICENSE*')!
		file.writeln('README*')!
		file.writeln('*.pc*')!
		file.writeln('!docs/src/')!
		file.close()
		system('cd ./thirdparty && git pull origin v1.x')
		hash := execute('cd ./thirdparty && git rev-parse HEAD')
		write_file('./commit.txt', hash.output.trim_space())!
	}
)

// Run the build context. This will iterate over os.args and each corresponding
// task, skipping any arguments that start with a hyphen (-)
context.run()
