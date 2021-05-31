# Battle cards


## Documentation is harmfull/useless or not

| cons |  pros|
| --- | --- |
| documentation became obsolete fast | that's not the documentation, that's the one line note; Obsolete comment brings no harm; That can reduce a lot of dev time; |
| Comments are necessary only for public libraries because of lot of code and lot of developers | framework has a lot of comments, that's the best practice; Our codebase are huge too |
| We spent a lot of time to reduce codebase and make code readable | if note make code less readable, we can reduce it; we can place comments behind code lines: |
|	|	`code; // comment line` |
|	|	``` |
|	|	/** comment hint */ |
|	|	code; |
|	|	``` |
| jsdoc is useless because it's too small. Good documentation should include examples | jsdoc allow hints that pops over the variables in IDE; Examples can be moved into separate files |
| Separate doc files became obsolete fast and waste files structure | it's only one doc file in folder; obsolete documentation brings no harm; usage examples changes very rarely because it requires deep refactoring |
| unit tests can replace the documentation | good unit tests are much bigger that good doc file. In size and in reading time |
|	|	|
