# JS code quality starter pack: linters, conventions, best practices 

[dev.to article](https://dev.to/bskydive/javascript-code-conventions-starter-pack-3jff)

This article is about my view to convention building. 

It includes some basic examples including linting tools setup. 

That can be interesting for developers who like to follow coding best practices and who want to improve their own or team code quality. 

As for me, I've explained and use those concepts many times. So, putting them into article will be handy.

First of all you can look at my linting guide with the linter pack setup [here](https://github.com/bskydive/typescript-tspqwe-linters).

Also you can grab my article from git repo [here](https://gitlab.com/stepanovv/kbo/-/blob/master/public/kbo/kb/conventions/starter-conventions.md).

## What is it for

1. Put and keep things in order together.
1. To make productivity a little bit higher, and also reduce the volume of work.
1. Conventions supports convenience of:
	* migration. Facilitate the process of transferring the code between an old and new design / framework.
	* debugging. Look at debug/dev tools and understand from which file this piece of code is, and where it can be inside the file.
	* reading. Reduce the time for searching and analyzing information. The code units naming should help to immediately understand what it should do.
	* development. Use generally(framework) accepted patterns and practices.
	* communication. Reduce the length/duration of actions chains and loops(ping-pong)

## How to make it

1. Conventions should respect team's/framework's abilities and limitations.
1. Conventions is always a compromise. You should learn how to do that before doing conventions.
1. Compromise is based on the trust, and that's based on the respect and responsibility.
1. Respect yourself and others results of the work and time which has been spent.
1. Prepare and make discussions well:
	* reduce the number of participants
	* make and read agendas
	* convert feelings into real facts and stories
	* speak in plain English, avoid using [abbreviations](https://blog.juliobiason.me/thoughts/things-i-learnt-the-hard-way/#design-patterns-are-used-to-describe-solutions-not-to-find-them)
	* draw trees with facts decomposition
	* write a summary and apply the decisions

## Rules for the PR reviewer

1. reduce the number of reviewers
	* More than one can be the cause of duplicated work and time spending while one of them/you out of work or busy
	* If more than one participants is necessary, you should divide the code for each reviewer
1. check all code at once, reduce review-fix(ping-pong) time spending
1. actions:
	* switch into PR branch
	* execute and test at least one main functionality of the PR, prevent moving PR to QA engineers with silly issues like "forgot to run `git add`"
1. check the:
	* unit test code coverage
	* code convention compliance
	* code complexity

## Rules for the PR author

1. Less code means less:
	* bugs
	* merge conflicts
	* reading time
1. Do not shorten unit's names or line breaks:
	* Long names and line breaks reduce analysis time and bugs count.
	* Minifier will remove them anyway.
1. describe PR's scope in a task to help make the review and a test better:
	* modules/components or domain areas which have been modified
	* new functionalities were added and where
1. reduce the PR's scope, make a new subtask/story for:
	* broken/disabled(xit/xdescribe) unit test
	* optional parts of functionality/refactoring
	* investigation and description(making notes/readmes) of how old code is working
1. execute before the pushing into repo:
	* reformat and autofix all code using prettier, eslint and stylelint rules
	* git pull && git merge origin master
	* npm run lint
	* npm run build
	* npm run test

## Rules for code quality

1. make functions private as much as possible
1. use camelCase
1. remove an unused code
1. reduce the [code complexity](https://eslint.org/docs/rules/complexity):
	* nested braces depth
	* else blocks
	* lines length
	* lines per function
	* params count
1. make names readable like:
	* isSomethingEnabled
	* onEventHappens
	* getSomeValue
	* setSomeValue
	* parseValues
1. put notes to share your [knowledge](https://blog.juliobiason.me/thoughts/things-i-learnt-the-hard-way/#documentation-is-a-love-letter-to-your-future-self)
	* The code describes how things works, and your notes describes why or what for
	* One short note can prevent hours of investigation or days of rewriting code back and forth
	* Put comments in one line, after the code not to increase lines number
	* Put jsdoc in one line not to increase lines number. In popovers they are automatically reformatted.
	* Put long notes in readme files: usage examples
1. make separate unit test assertion for:
	* every input option
	* every output value
	* every possible state: init, loading, disabled, broken(reproduce exact issue), valid
1. add in every unit test not only the final state, but state transition: before/after loading, before/after issue fixing
