# Luarocks github release tags are always "v.[major].[minor].[revision]"
VERSION=$(subst v,,$(sort $(shell git describe --abbrev=0 --tags)))
# TODO Ideally this would increment based on detecting previous rockspecs
ROCKSPEC_REVISION=0
ROCKSPEC_VERSION=$(VERSION)-$(ROCKSPEC_REVISION)

SOURCES=lume.lua
TEST_PACKAGE_PATH='package.path = "./test/?.lua;./test/util/?.lua;" .. package.path'
.PHONY: all clean test coverage lint

all: release

install:
	luarocks make lume-$(ROCK_VERSION).rockspec

clean: 
	rm -f luacov.*.out
	rm -f *.rock

test: test/test.lua
	lua -e $(TEST_PACKAGE_PATH) $?

luacov.stats.out: test/test.lua
	lua -e $(TEST_PACKAGE_PATH) -lluacov $?

luacov.report.out: luacov.stats.out
	luacov

lint: lume.lua
	luacheck --std max lume.lua

coverage: luacov.report.out

doc/index.html: $(SOURCES)
	ldoc $?

docs: doc/index.html

# Quick-and-dirty changelog generation: get all first-parent commits, then format into markdown based on "Version" descriptions
CHANGELOG.md: 
	git log --pretty=%s --first-parent | awk 'BEGIN { print "# CHANGELOG"; tracked=0 } /^Version/ { tracked=1; print "## " $$0; } { if ($$0 !~ /^Version/ && tracked==1 ) { print "  - " $$0 } }' > CHANGELOG.md

rock: rockspecs/lume-$(ROCKSPEC_VERSION).rockspec
	luarocks pack $?

release: lint docs CHANGELOG.md

# Note that this target will never succeed without a Luarocks API key; it is beyond the scope of the assignment.
upload: rock
	luarocks upload rockspecs/lume-$(ROCKSPEC_VERSION).rockspec 

