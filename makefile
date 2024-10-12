
.PHONY: docs fmt test run update examples

docs:
	rm -rf ./docs
	v doc . -f markdown -o ./docs/markdown
	v doc . -f html -o ./docs/html

fmt:
	v fmt -w .

test:
	v -stats test vlibuv/tests

run:
	v run .

symlink:
	ln -s $(CURDIR) $(HOME)/.vmodules/vlibuv

clean-symlink:
	rm -rf $(HOME)/.vmodules/vlibuv


examples:
	v examples/http_server_uv.v
	v examples/http_server.v
	v examples/threadpool.v

update:
	rm -rf ./thirdparty
	mkdir -p ./thirdparty
	cd ./thirdparty && git init
	cd ./thirdparty && git remote add origin https://github.com/libuv/libuv.git
	cd ./thirdparty && git config core.sparseCheckout true
	# Specify the files and directories you want to include
	echo "include/" >> ./thirdparty/.git/info/sparse-checkout
	echo "src/" >> ./thirdparty/.git/info/sparse-checkout
	echo "LICENSE*" >> ./thirdparty/.git/info/sparse-checkout
	echo "README*" >> ./thirdparty/.git/info/sparse-checkout
	# Exclude the docs/src directory
	echo "!docs/src/" >> ./thirdparty/.git/info/sparse-checkout
	cd ./thirdparty && git pull origin master
	cd ./thirdparty && rm -rf .git
