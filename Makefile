# Luarocks github release tags are always "v[major].[minor].[revision]"
GIT_VERSION=$(subst v,,$(sort $(shell git describe --abbrev=0 --tags)))
# Split it again into a space-delimited string to use it as a list
VERSION_WORDS=$(subst ., ,$(GIT_VERSION))
# Split off each of the three major components
VERSION_MAJOR=$(word 1, $(VERSION_WORDS))
VERSION_MINOR=$(word 2, $(VERSION_WORDS))
VERSION_PATCH=$(word 3, $(VERSION_WORDS))
# TODO Ideally this would increment based on detecting previous rockspecs
ROCKSPEC_REVISION=0
ROCKSPEC_VERSION=$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)-$(ROCKSPEC_REVISION)

SOURCES=lume.lua
TEST_PACKAGE_PATH='package.path = "./test/?.lua;./test/util/?.lua;" .. package.path'
.PHONY: all clean test coverage lint

all: test lint

install: rockspecs/lume-$(ROCKSPEC_VERSION).rockspec
	luarocks make $? --local

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

# Generate a new rockspec by copying the previous one
# TODO 'find' may not be a stable sort between platforms
rockspecs/lume-$(ROCKSPEC_VERSION).rockspec:
	sed -E -e 's/^version.+/version = "$(ROCKSPEC_VERSION)"/' -e 's/tag = .+/tag = "$(FAKE_GIT_VERSION)"/' $$(find rockspecs -name "lume*.rockspec" | tail -n1) > $@

rock: lume-$(ROCKSPEC_VERSION).src.rock 

lume-$(ROCKSPEC_VERSION).src.rock: rockspecs/lume-$(ROCKSPEC_VERSION).rockspec 
	luarocks pack $?

release: lint docs CHANGELOG.md

upload: rock 
	luarocks upload rockspecs/lume-$(ROCKSPEC_VERSION).rockspec --api-key=$(LUAROCKS_API_KEY)

