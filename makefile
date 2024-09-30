
.PHONY: docs fmt test run update

docs:
	v doc ./vlibuv -f markdown -o vlibuv.md

fmt:
	v fmt -w .

test:
	v -stats test vlibuv/tests

run:
	v run .

update:
	rm -rf ./vlibuv/thirdparty
	mkdir -p ./vlibuv/thirdparty
	cd ./vlibuv/thirdparty && git init
	cd ./vlibuv/thirdparty && git remote add origin https://github.com/libuv/libuv.git
	cd ./vlibuv/thirdparty && git config core.sparseCheckout true
	# Specify the files and directories you want to include
	echo "include/" >> ./vlibuv/thirdparty/.git/info/sparse-checkout
	echo "src/" >> ./vlibuv/thirdparty/.git/info/sparse-checkout
	echo "LICENSE*" >> ./vlibuv/thirdparty/.git/info/sparse-checkout
	echo "README*" >> ./vlibuv/thirdparty/.git/info/sparse-checkout
	# Exclude the docs/src directory
	echo "!docs/src/" >> ./vlibuv/thirdparty/.git/info/sparse-checkout
	cd ./vlibuv/thirdparty && git pull origin master
	rm -rf .git
