
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
	rm -rf ./vuv/thirdparty
	mkdir -p ./vuv/thirdparty
	cd ./vuv/thirdparty && git init
	cd ./vuv/thirdparty && git remote add origin https://github.com/libuv/libuv.git
	cd ./vuv/thirdparty && git config core.sparseCheckout true
	# Specify the files and directories you want to include
	echo "include/" >> ./vuv/thirdparty/.git/info/sparse-checkout
	echo "src/" >> ./vuv/thirdparty/.git/info/sparse-checkout
	echo "LICENSE*" >> ./vuv/thirdparty/.git/info/sparse-checkout
	echo "README*" >> ./vuv/thirdparty/.git/info/sparse-checkout
	# Exclude the docs/src directory
	echo "!docs/src/" >> ./vuv/thirdparty/.git/info/sparse-checkout
	cd ./vuv/thirdparty && git pull origin master
