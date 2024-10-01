
.PHONY: docs fmt test run update

docs:
	rm -rf ./docs
	v doc ./vlibuv -f markdown -m -o ./docs/vlibuv.md
	v doc ./vlibuv -f html -inline-asssets -m -o ./docs/html

fmt:
	v fmt -w .

test:
	v -stats test vlibuv/tests

run:
	v run .

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
	rm -rf .git
