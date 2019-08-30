VERSION=$(subst v,,$(sort $(shell git describe --abbrev=0 --tags)))
REVISION=0
ROCK_VERSION=$(VERSION)-$(REVISION)

SOURCES=lume.lua
TEST_PACKAGE_PATH='package.path = "./test/?.lua;./test/util/?.lua;" .. package.path'
.PHONY: clean test coverage


install:
	luarocks make lume-$(ROCK_VERSION).rockspec

rockspecs/lume-$(ROCK_VERSION).rockspec: rockspec.in
	cp $< $@
	echo "version = \"$(ROCK_VERSION)\"" >> $@


clean: 
	#rm lume-$(VERSION)-$(REVISION).rockspec
	rm luacov.*.out

test: test/test.lua
	lua -e $(TEST_PACKAGE_PATH) $?

luacov.stats.out: test/test.lua
	lua -e $(TEST_PACKAGE_PATH) -lluacov $?

luacov.report.out: luacov.stats.out
	luacov

lint: lume.lua
	luacheck lume.lua

coverage: luacov.report.out
	luacov-coveralls --dryrun

doc/index.html: $(SOURCES)
	ldoc $?

docs: doc/index.html
