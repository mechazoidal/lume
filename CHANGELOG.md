# CHANGELOG
## Version 2.3.0
  - Changed header type used on function names in README
  - Added clearer example for `lume.array()` in README
  - Updated copyright year: 2016 -> 2017
  - Updated copyright year: 2015 -> 2016
  - Removed local reference to math.random()
  - Added `lume.vector()`, updated README and tests
  - Added `lume.isarray()` to README
  - Exposed internal `isarray()` function as `lume.isarray()`
## Version 2.2.3
  - Removed some unused iterator vars
  - Merge pull request #8 from technomancy/luacheck
## Version 2.2.2
  - Added support for NaN, inf and -inf to lume.serialize; updated tests
  - Updated README for lume.serialize changes
## Version 2.2.1
  - Fixed number printing in lume.trace for Lua5.3
  - Removed .gitignore file
  - Renaming of internal serialize func map
  - Updated README example for lume.trace()
  - Lots of tweaks to lume.serialize(); circular reference detection
  - Moved some stuff around in "test" directory
  - Changed lume.trace() to output in a nicer format, updated test
## Version 2.2.0
  - Changed lume.round() such that 0 results in 0 rather than -0
  - Missing '.' in README
  - Added `lume.pick()` to README
  - Added lume.pick() and tests
  - Fixed lume.color example in README
  - Added README section for lume.color()
  - Added function lume.color() and tests
  - Removed unused function `iternil()`
  - Removed support of `nil` in lume.ripairs(), updated tests
  - Improved description of `lume.extend()` in README
  - Missing language hint on lume.extend's README example
  - Added function `lume.extend()`, updated README and tests
  - Updated test for lume.wordwrap()
  - Changed lume.wordwrap() to better retain existing whitespace
## Version 2.1.0
  - Changed lume.reduce() to support non-array tables, updated tests
  - Changed getiter() to disallow `nil` values
  - Fixed example mistake in reject()'s README section
  - Updated `Iteratee functions` part of README for lume.reject()
  - Changed lume.filter()'s implementation to mimic lume.reject()
  - Added lume.reject(), updated tests and README.md
  - Small fix to `iteratee functions` README section
  - Added `iteratee functions` section to README
  - Changed lume.clear() to return the table, updated doc & tests
  - Fixed internal func isarray()
  - Updated lume.push()'s README section
  - Added tests for lume.remove()/lume.push() return values
  - Updated README.md with new functions
  - Added lume.clear() and tests
  - Added lume.remove() and tests
  - Added lume.push(), updated tests
  - Minor optimisations to lume.combine(), updated tests
## Version 2.0.0
  - Updated license copyright year
  - Lua 5.3 compatibility fixes
  - Fixed typo in lume.sort()'s README section
  - Added lume.ripairs() function, updated README and tests
  - Removed `retainkeys` argument from lume.set()
  - Added lume.wordwrap(); updated README.md and tests
  - Changed lume.merge() functionality, updated README and doc
  - Added lume.concat(), updated README and tests
  - Fixed nil iterator in internal getiter()
  - Fixed lume.call() section of README.md
  - Added lume.sort(), updated tests & README
  - Added lume.call(), updated tests and README
  - Changed lume.shuffle() to not operate in-place, updated doc + tests
  - Changed internal func isarray() to handle nil
  - Changed lume.count() to return length if table is array
  - Changed all applicable functions to use iter func based on table
  - Updated lume.each() to use iter func based on table type
## Version 1.5.0
  - Added explanation of calling lume() to the README
  - Added lume.first() and .last(), updated README.md and tests
  - Added lume.keys() and tests, updated docs
  - Fixed lume.invert test name
  - Made calling lume table an alias to calling lume.chain()
  - Added tests for funcitons which now use iteratee()
  - Changed all applicable functions to use iteratee() internally
  - Added identity() and iteratee() local funcs
## Version 1.4.1
  - Removed unnecessary pack & unpack from lume.array()
## Version 1.4.0
  - Made some minor formatting changes
  - Merge pull request #3 from icrawler/Dev2
  - Renamed local memoize_nilkey -> memoize_nil
  - Changed position of lume.time() function
  - Added lume.memoize(), updated README.md and tests
  - Fixed iscallable() to handle the lack of metatable properly
  - Updated README.md and tests for lume.combine()
  - Changed lume.combine() to ignore nil args
## Version 1.3.1
  - Added missing tostring() call on args in lume.trace()
  - Updated test for lume.trace()
  - Fixed lume.trace() to handle and print `nil` argument
## Version 1.3.0
  - Added another test for lume.slice()
  - Made callable tables be accepted as functions
  - Removed use of math.min and math.max in lume.slice()
  - Changed lume.uuid() to use local math_random()
  - Added missing comment for lume.uuid func in test_lua.lua
  - Added tests for lume.chain()
  - Added lume.chain(), added section to README.md
  - Added lume.uuid(), tests and README.md section
  - Added lume.count() to README.md
  - Added lume.count() function and tests
  - Added type check in lume.fn() and additional tests
  - Added lume.match() to README.md
  - Added tests for lume.match()
  - Added lume.match()
  - Moved position of lume.combine() in readme and other files
  - Added test for lume.combine() to test_lume.lua
  - Added lume.combine() to README.md
  - Added lume.combine() function
  - Removed function in lume.slice()
  - Updated test for lume.trace()
  - Changed lume.trace() to round numbers to 2 decimal places
  - table.unpack() is now used if unpack() is not available.
## Version 1.2.1
  - Moved shared code of lume.split/trim() to local func
  - Added more tests for lume.trim()
  - Fixed use of pattern special chars in lume.trim()
  - Improved lume.split()'s README.md section for clarity
  - Updated lume.split() in README.md
  - Fixed minor error in lume.set()'s README.md example
  - Added new tests and updated some others for lume.split()
  - Changed lume.split() to mimic python's str.split()
  - Fixed spelling mistake in README.md
## Version 1.2.0
  - Localised global funcs/variables
  - Added type tests for lume.random()
  - Added test for lume.lambda() caching
  - Added caching to lume.lambda()
  - Added more tests for lume.slice()
  - Fixed behaviour for negative i argument on lume.slice()
  - Added "unsupported type" error to lume.serialize()
  - Reworded description of lume.weightedchoice() in README
  - Added some tests for lume.weightedchoice()
  - Added lume.weightedchoice()
  - Added tests for lume.lambda()
  - Added tester.test.error() to tester.lua script
  - Replaced table concat with str concat in lume.lambda()
  - Added lume.lambda() to README.md
  - Added lume.lambda()
  - Added another test for lume.reduce()
## Version 1.1.2
  - Fixed empty-table test for lume.invert()
  - Moved lume.invert()'s test func to match order in lume.lua
  - Moved lume.invert() to be near lume.clone()
  - Added empty-table test for lume.set()
  - Changed lume.set() to make use of lume.invert()
  - Added tests for lume.invert()
  - Added lume.invert()
  - Added new tests for lume.reduce()
  - Made `first` argument in lume.reduce() optional
  - Increased version to 1.1.1
  - Fixed module's table not updating in lume.hotswap()
  - Improved lume.clamp()'s performance on non-JIT
  - Added better tests for lume.distance()
  - Improved lume.distance()'s performance on non-JIT
  - Increased version to 1.1.0
  - Added tester.lua script and tests in test_lume.lua
  - Added optional arg `squared` to lume.distance()
  - Updated README.md on lume.randomchoice()'s behaviour
  - Fixed lume.hotswap() to handle nonexistent modules properly
  - Added support for numerical keys to lume.format()
  - Made lume.dostring() use load() if no loadstring()
  - Changed lume.format() to abort early if `vars` is nil
  - Substituted use of var name "arg" in lume.fn()
  - Changed 'vars' arg in lume.format() to be optional
  - Fixed lume.format() where missing keys were not ignored
  - Fixed bug with negative j index in lume.slice()
  - Updated README.md for changes in lume.fn()
  - Changed lume.once()'s return fn to handle args
  - Changed lume.fn()'s returned fn to handle args
  - Fixed typos and improved for clarity in README.md
  - Added lume.each() function
  - Increased version to 1.0.9
  - Added increment rounding to lume.round()
  - Added some more examples to README.md
  - Added lume.trace() function
  - Added error handling to lume.hotswap()
  - Fixed typo in README.md on lume.angle()'s args
  - Changed lume.fn/once's returned func return, v1.0.8
  - Fixed formerly broken lume.angle(), version 1.0.7
  - Changed README.md to link to raw module, reworded
  - Added lume.hotswap() fn, updated version to 1.0.6
  - Added lume.time(), incremented version revision
  - Fixed typos and improved clarity in README.md
  - Changed args for lume.any/all(), fixed README.md
  - Changed `first` arg of lume.reduce to non-optional
  - Fixed error in lume.random()'s description
  - Removed "len" argument from lume.pingpong()
  - Fixed lume.filter() example in README.md
  - Fixed incorrect lume.merge() example in README.md
  - Updated version number
  - Fixed even more typos in README.md
  - Changed funcs to treat tables as arrays by default
  - Added `isarray` argument to lume.set
  - Fixed incorrect description of lume.round()
  - Fixed accidental use of global in lume.clone()
  - Fixed typos/errors and reworded things in README.md
  - Fixed more typos in README.md
  - Removed stray bracket in README.md
  - First commit
