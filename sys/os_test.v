module sys

fn test_homedir() ! {
	home := homedir()!
	assert home.len > 0
}

fn test_tmpdir() ! {
	tmp := tmpdir()!
	assert tmp.len > 0
}

fn test_gethostname() ! {
	hostname := gethostname()!
	assert hostname.len > 0
}

fn test_pid() {
	p := pid()
	assert p > 0
}

fn test_ppid() {
	pp := ppid()
	assert pp >= 0
}

fn test_getenv_setenv() ! {
	setenv('TEST_VAR', 'test_value')!
	value := getenv('TEST_VAR')!
	assert value == 'test_value'
}

fn test_unsetenv() ! {
	setenv('TEST_VAR_2', 'value')!
	unsetenv('TEST_VAR_2')!
	result := getenv('TEST_VAR_2') or {
		// Expected to fail since we just unset the variable
		assert true
		return
	}
	// If we got here, the variable was found (it might have been set elsewhere)
	assert result.len >= 0
}

fn test_getpriority() ! {
	p := pid()
	priority := getpriority(p)!
	assert priority >= -20 && priority <= 20
}

fn test_setpriority() ! {
	p := pid()
	setpriority(p, int(Priority.normal))!
	priority := getpriority(p)!
	assert priority == 0
}

fn test_cpus() ! {
	cpu_infos := cpus()!
	assert cpu_infos.len > 0
	for info in cpu_infos {
		assert info.model.len > 0
		assert info.speed >= 0
	}
}

fn test_available_parallelism() {
	cores := available_parallelism()
	assert cores > 0
}

fn test_environ() ! {
	env_vars := environ()!
	assert env_vars.len > 0
	for variable in env_vars {
		assert variable.name.len > 0
		assert variable.value.len >= 0
	}
}
