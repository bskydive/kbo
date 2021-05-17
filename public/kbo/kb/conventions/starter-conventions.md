# Conventions starter pack

Let's put and keep things in order together.

This will make labor productivity slightly higher, and also reduce the volume of work.

## What is it for

1. Conventions supports convenience of:
	* migration. Facilitate the process of transferring code between old and new design / framework.
	* debugging. Look in debug/dev tools and understand from which file this piece of code is, and where it can be inside the file.
	* reading. Reduce the time for searching and analyzing information. Code units naming should help to immediately understand what it should do.
	* development. Use generally(framework) accepted patterns and practices.
1. Less code means less:
	* bugs
	* merge conflicts
	* reading time
1. Do not shorten unit names or line breaks:
	* Long names and line breaks reduce analysis time and bugs count.
	* Minifier will remove them anyway.

## How to make it

1. Conventions should respect team/framework abilities and limitations.
1. Conventions is always a compromise. You should learn how to do that before doing conventions.
1. Compromise is based on trust, and that's based on respect and responsibility.
1. Respect yourself and others, work results and time spent.
1. Prepare and make discussions well:
	* reduce participants count
	* make and read agenda
	* Convert feelings into facts/stories
	* talk in plain english, avoid using [abbreviations](https://blog.juliobiason.me/thoughts/things-i-learnt-the-hard-way/#design-patterns-are-used-to-describe-solutions-not-to-find-them)
	* draw graphs/trees with facts decomposition
	* write summary and apply decisions

## reviewers

1. reduce reviewers count
	* More than one can cause duplicated work and duplicated ping-pong time while one of them out of work or busy
	* Exclusion: one person for one part of the code
1. check all code at once, reduce ping-pong time
1. do:
	* switch into PR branch
	* run and touch at least one main functionality of the PR, if you can delegate testing to others
1. check:
	* unit test code coverage
	* code convention compliance
	* redundant code complexity

## reviewable

1. describe PR's scope in story to help make review and test better:
	* modules/components or domain areas was touched
	* new functionality was added and where
1. reduce PR scope. Make a new subtask/story for:
	* broken/disabled(xit/xdescribe) unit test
	* optional parts of functionality/refactoring
	* investigation and description(making notes/readmde's) of how old code works
1. run before push to repo:
	* reformat and autofix all code using prettier, eslint and stylelint rules
	* git pull && git merge origin master
	* npm run lint
	* npm run build
	* npm run test

## code quality rules

1. make functions private as much as possible
1. use camelCase
1. remove unused code
1. reduce [code complexity](https://eslint.org/docs/rules/complexity):
	* nested braces depth
	* else blocks
	* length
	* lines per function
	* params count
1. make names readable and similar like:
	* isSomethingEnabled
	* onEventHappens
	* getSomeValue
	* setSomeValue
	* parseValues
1. put notes to share your [knowledge](https://blog.juliobiason.me/thoughts/things-i-learnt-the-hard-way/#documentation-is-a-love-letter-to-your-future-self)
	* Code describes how things works, your notes describes why or what for
	* One short note can prevent hours of investigation or days of rewriting code back and forth
	* put comments in one line after the code to don't increase file lines count
	* put jsdoc in one line to don't increase file lines count. In popovers they are still readable
	* put long notes in readme files: usage examples
1. make separate unit test(it) for:
	* every input option
	* every output value
	* every possible state: init, loading, disabled, broken(reproduce exact issue), valid
1. add in unit test not only the final state, but state transition: before/after loading, before/after issue fixing
