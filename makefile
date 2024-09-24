
.PHONY: docs fmt test run update

docs:
	echo "not implemented"

fmt:
	v fmt -w src/

test:
	v -stats test src/*_test.v

run:
	v run ./src

update:
	rm -rf ./src/thirdparty
	git clone https://github.com/libuv/libuv.git ./src/thirdparty
