# code quality

## WTF strategy

My Angular Thing works not as expected.

 * search another, more simplest Thing solving your task
 * search the same Things in your project, that works as expected
 * reduce complexity of your Thing
 * register and run your Thing in the new route(URL) on blank page with button "run Thing". Here you exclude most of the parent/nesting related issues
 * cut external Things, that can influent your Thing behavior. In case of Angular:
    * modules
    * [change detection](https://blog.angular-university.io/onpush-change-detection-how-it-works/)
    * pipes
    * interceptors
    * cookies/local/session storage, relogin, run browser in incognito mode
    * browser and OS version
    * libs version
    * component interaction: setters/getters, services, @Input/@Output, RxJs
    * routes and route guards
 * read the manuals in project KB, in the vendor KB/blog(angular.io, material.angular.io), Mozilla MDN, devdocs.io
 * Check API contracts with external tool like Postman/wget/curl
 * check data/object format using typescript interfaces in models/classes
 * reprodeuce your Thing without any project related data in the [cloud IDE tool](stackblitz.io) and show to your collegs or community. Even if your thing works fine, somebody can find another issues in your code or give a good catch/advice.
 * run linters: eslint, tslint(yes, it still not useless), stylelint, cspell, sonarlint(sonar cube), lighthouse, etc.
 * 

 