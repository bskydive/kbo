# Соглашения про VUE

## ДОКИ

* https://discordapp.com/channels/325477692906536972/325479107012067328
* https://vuejs.org/v2/guide/installation.html
* https://github.com/vuejs/vue/tree/dev/examples
* https://vuejs.org/v2/api/
* https://vuejs.org/v2/style-guide/

## Ограничения

1. правила переиспользуемых компонентов
   https://vuejs.org/v2/guide/components.html#Authoring-Reusable-Components
1. взаимодействие компонентов: props down, events up
    https://vuejs.org/v2/guide/components.html#Composing-Components
1. v-for на списках необходимо делать через vue.set()
     https://vuejs.org/v2/guide/list.html#Caveats
1. при использовании стрелочных функций не видны переменные из data,methods
1. Можно использовать только ограниченные способы изменения массивов
  https://vuejs.org/v2/guide/list.html#Array-Change-Detection
1. Невозможно отследить неправильное объявление переменных даже с плагином vue в браузере. При ошибках js плагин не активируется.
1. При использовании watch для массивов из data, значения newValue и oldValue будут одинаковыми
	https://vuejs.org/v2/api/#Instance-Methods-Data  
1. Внутри new Promise(()=>{}) теряется контекст, и становится невидим экземпляр vm=new Vue()
  
## Приёмы

1. Для обхода костылей рендеринга и сохранения использования PUG необходимо использовать script
  https://vuejs.org/v2/guide/components.html#X-Templates
  https://vuejs.org/v2/guide/components.html#DOM-Template-Parsing-Caveats
1. Для обхода ограничений изменения массивов необходимо оборачивать их в computed setter
     https://vuejs.org/v2/guide/list.html#Array-Change-Detection 
1. для реактивного рендеринга DOM необходимо в контроллере(root) data объявить переменные.
	переменные вне контроллера необходимо синхронизировать вручную через methods.
	реактивность НЕ будет работать при объявлении через methods,computed
	реактивность НЕ будет работать, если объявить переменную в data во время исполнения
	нельзя навесить обёртку computed на реактивную переменную data 
  https://vuejs.org/v2/guide/reactivity.html#Declaring-Reactive-Properties
  
