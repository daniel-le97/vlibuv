
.PHONY: docs fmt test run update

docs:
	v doc ./vuv -f markdown -o vuv.md

fmt:
	v fmt -w .

test:
	v -stats test src/*_test.v

run:
	v run .

update:
	rm -rf ./src/thirdparty
	mkdir -p ./src/thirdparty
	cd ./src/thirdparty && git init
	cd ./src/thirdparty && git remote add origin https://github.com/libuv/libuv.git
	cd ./src/thirdparty && git config core.sparseCheckout true
	# Specify the files and directories you want to include
	echo "include/" >> ./src/thirdparty/.git/info/sparse-checkout
	echo "src/" >> ./src/thirdparty/.git/info/sparse-checkout
	echo "LICENSE*" >> ./src/thirdparty/.git/info/sparse-checkout
	echo "README*" >> ./src/thirdparty/.git/info/sparse-checkout
	# Exclude the docs/src directory
	echo "!docs/src/" >> ./src/thirdparty/.git/info/sparse-checkout
	cd ./src/thirdparty && git pull origin master
