# Java

## блоги

 * [Шипилёв](https://bitbucket.org/clawiz/)
 * https://shipilev.net/blog/archive/settable-future/

## личные репы

 * [abdrashitovta@gmail.com](https://bitbucket.org/clawiz/org-clawiz-core-common/src)
 
## оптимизация

 * [Алексей Шипилёв об оптимизации в крупных проектах](https://habr.com/company/jugru/blog/338732/)
 
## Java-doc

http://skipy.ru/technics/serialization.html

https://dzone.com/articles/jpa-basic-projections

## установка jre

Можно использовать сборки бесплатно Corretto, Liberica, OpenJDK, Zulu см https://sdkman.io/jdks

http://stackoverflow.com/questions/10268583/downloading-java-jdk-on-linux-via-wget-is-shown-license-page-instead#10959815

```java

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jre-8u131-linux-x64.rpm

```

## собеседование JAVA

https://lab.getbase.com/cracking-java-base-coding-interview/

##  курсы

java web

https://stepic.org/course/%D0%A0%D0%B0%D0%B7%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B2%D0%B5%D0%B1-%D1%81%D0%B5%D1%80%D0%B2%D0%B8%D1%81%D0%B0-%D0%BD%D0%B0-Java-%28%D1%87%D0%B0%D1%81%D1%82%D1%8C-1%29-146/

[алгоритмы](https://www.coursera.org/learn/introduction-to-algorithms)

## Lang

## ООП

https://habrahabr.ru/post/345658/

## dependecy injection

### AOP

aspectj

https://habrahabr.ru/post/114649/

### IOC

https://habrahabr.ru/post/131993/

## Видимость переменных

 * Переменная, объявленная в методе, существует/видна с начала объявления, до конца метода.
 * Переменная, объявленная в блоке кода, существует до конца этого блока кода.
 * Переменные - аргументы метода, существуют до конца выхода из метода.
 * Переменные класса/объекта существуют все время жизни содержащего их объекта. Их видимость регулируется специальными модификаторами доступа.
 * Статические переменные классов существуют все время работы программы. Их видимость также определяется модификаторами доступа.
 * классы видимы по-умолчанию в пределах каталога

## виды конструкций

программа
пакет
класс
метод
команда

### файл

*.jar
.class
.java

может иметь только один package и несоклько import
если есть public класс - он должен совпадать с именем файла
не более одного public класса на файл

### Класс class

может быть только public,  [default], final, abstract, strictfp
только 1 public класс на файл, одно и то же имя

порядок объявления:
package
import
class

### abstract class

нельзя создать экземпляр
при наследовании необходимо переопределить все методы
у абстрактных методов нет тела
если хотя бы один метод абстрактный - весь класс абстрактный
abstract нельзя объявить final
у абстрактных классов могут быть неабстрактные методы

## interface

нет реализации(тела)
все методы public abstract
все переменные public static final

Interface Implementation (Objective 1.2)
Interfaces are contracts for what a class can do, but they say nothing about
the way in which the class must do it.
Interfaces can be implemented by any class, from any inheritance tree.
An interface is like a 100-percent abstract class, and is implicitly abstract
whether you type the abstract modifier in the declaration or not.
An interface can have only abstract methods, no concrete methods allowed.
Interface methods are by default public and abstract—explicit declaration
of these modifiers is optional.
Interfaces can have constants, which are always implicitly public,
static, and final.
Interface constant declarations of public, static, and final are optional
in any combination.

A legal nonabstract implementing class has the following properties:
It provides concrete implementations for the interface's methods.
It must follow all legal override rules for the methods it implements.
It must not declare any new checked exceptions for an
implementation method.
It must not declare any checked exceptions that are broader than
the exceptions declared in the interface method.
It may declare runtime exceptions on any interface method
implementation regardless of the interface declaration.
It must maintain the exact signature (allowing for covariant returns)
and return type of the methods it implements (but does not have to
declare the exceptions of the interface).

A class implementing an interface can itself be abstract.
An abstract implementing class does not have to implement the interface
methods (but the first concrete subclass must).
A class can extend only one class (no multiple inheritance), but it can
implement many interfaces.
Interfaces can extend one or more other interfaces.
Interfaces cannot extend a class, or implement a class or interface.
When taking the exam, verify that interface and class declarations are legal
before verifying other code logic.


## уровни/модификаторы доступа

public - можно обращаться из любого места программы
protected - из того же класса или наследника
package local/default - из того же пакета 
private - из того же класса

## другие модификаторы 

transient - запрет сериализации
volatile - при доступе работать с собственной копией(хранить).
synchronized - доступ только одной нити одновременно
native - платформозависимый код, методы без тела
strictfp - строгие требования к плавающей точке
final - делает примитивы неизменяемыми, ссылочные неизменяемыми ссылки на них.
static - применяется к нелокальным переменным, методам, блокам инициализации, классам(за исключением классов внутри методов)


## конструкторы

Характеристики конструктора:
— Имя конструктора должно совпадать с именем класса (по договоренности, первая буква — заглавная, обычно имя существительное);
— Конструктор имеется в любом классе. Даже если вы его не написали, компилятор Java сам создаст конструктор по умолчанию (default constructor), который будет пустым и не делает ничего, кроме вызова конструктора суперкласса.
— Конструктор похож на метод, но не является методом, он даже не считается членом класса. Поэтому его нельзя наследовать или переопределить в подклассе;
— Конструкторы не наследуются;
— Конструкторов может быть несколько в классе. В этом случае конструкторы называют перегруженными;
— Если в классе не описан конструктор, компилятор автоматически добавляет в код конструктор без параметров;
— Конструктор не имеет возвращаемого типа, им не может быть даже тип void, если возвращается тип void, то это уже не конструктор а метод, несмотря на совпадение с именем класса.
— В конструкторе допускается оператор return, но только пустой, без всякого возвращаемого значения;
— В конструкторе допускается применение модификаторов доступа, можно задать один из модификаторов: public , protected, private или без модификатора.
— Конструктор не может иметь модификаторов abstract, final, native, static или synchronized;
— Ключевое слово this cсылается на другой конструктор в этом же классе. Если используется, то обращение должно к нему быть первой строкой конструктора;
— Ключевое слово super вызывает конструктор родительского класса. Если используется, должно обращение к нему быть первой строкой конструктора;
— Если конструктор не делает вызов конструктора super класса-предка (с аргументами или без аргументов), компилятор автоматически добавляет код вызова конструктора класса-предка без аргументов;

## типы

### null

http://tproger.ru/articles/9-things-about-null-in-java/

### примитивные типы primitive

boolean 
byte 8
int 16
char 16
short 32
long 64
float 32
double 64

разрешённые модификаторы: public private protected [default] transient
всегда запрещён доступ без наследования (protected)

### ссылочные типы reference

### enum множества

специальный класс

enum X {a,b,c};//можно без ;
X xx;
void mm(){
xx=X.a;
}

может быть объявлен вне класса(в пакете) как public или [default]
всегда static final
конструктор всегда private
можно перегружать конструктор:

package ***;
enum X {
a(1),b(2),c(2){//анонимный внутренний класс для перегрузки конструктора
public getI(){return 22;} }
};

X (int i){//constructor
this.i=i; }

private int i;
public getI(){return this.i;} }

class one{
psvm(){
X x=X.a;
sout(x.getI);
}}

### виды переменных

local/automatic/stack локальные 
вне методов
хранятся в стэке(stack)
нет значений по-умолчанию, надо инициализировать

instance нелокальные

### массивы arrays

объявление (declare)
int[] [] a;
int a [];

- в методах, хранятся в куче(heap)

## аргументы переменной длины var-args

В списке параметров должен быть только один параметр переменной длины. 
При наличии двух параметров переменной длины компилятору невозможно определить, где заканчивается один параметр и начинается другой.
параметр только крайний справа
MyMethod(int ... x){};

##  унарные операции

· унарный минус "-" - меняет знак числа или выражения на противоположный;
· унарный плюс "+" - не выполняет никаких действий над числом или выражением;
· побитовое дополнение "~" (только для целых) - инвертирует все биты поля числа (меняет 0 на 1 и 1 на 0);
· инкремент "++" (только для целых) - увеличивает значение переменной на 1;
· декремент "--" (только для целых) - уменьшает значение переменной на 1.

## побитовые операции

 · сдвиг влево  (бит знака числа при этом не меняется) - побитовый сдвиг влево с учетом знака "<<";
· сдвиг вправо(бит знака числа при этом не меняется) - побитовый сдвиг вправо с учетом знака ">>";
· сдвиг вправо (бит знака числа при этом также сдвигается) - побитовый сдвиг вправо без учета знака ">>>".

## статические и нестатические методы static

При вызове метода в виде «объект» точка «имя метода», на самом деле вызывается метод класса, в который первым аргументом передаётся тот самый объект. Внутри метода он получает имя this. Именно с ним и его данными происходят все действия. 
При вызове статического метода, никакого объекта внутрь не передаётся. Т.е. this равен null, поэтому статический метод не имеет доступа к нестатическим переменным и методам (ему нечего передать в такие методы в качестве this).

## методы

### overriding переназначение

нельзя добавлять в переназначенный метод проверяемое(checked) исключение, если его не было в суперклассе или его охват шире
нельзя делать уровень доступа более строгим
компилятор проверяет реализацию всех исключений суперкласса, даже если в переназначенном они не задекларированы(throws)

### overloading перегрузка

перегруженный метод обязан быть с другим набором/порядком типов аргументов.

## перехват исключений

try {
 } catch (SocketException se) {//подкласс
    message("Error setting time-out.");
} catch (IOException ie) { //класс
    message("Error accepting connection.");
}

## компилятор интерпретатор

Интерпретатор Java 
Сначала проверяет переменную окружения CLASSPATH 
Начиная с этих корневых каталогов, интерпретатор берет имя пакета и заменяет точки на слеши для получения полного пути 
(таким образом, директива package foo.bar.baz преобразуется в foo\bar\baz, foo/bar/baz или что-то еще в зависимости от вашей операционной системы). 
Затем полученное имя присоединяется к различным элементам CLASSPATH. 
В указанных местах ведется поиск файлов .class, имена которых совпадают с именем создаваемого программой класса. 
(Поиск также ведется в стандартных каталогах, определяемых местонахождением интерпретатора Java.)

## javaBean

спецификация для создания компонентов IDE

это классы со скрытыми свойствами

### JavaBean naming conventions:

getter - get/is
setter - set
interface - register

public void setX(int x){};
public int getX(){};

### events

### listeners

JavaBean listener naming conventions

public void addXxListeber(Xx x ){};
public void removeXxListener(Xx x ){};

## ССЫЛКИ links

topjava kislin
https://join.skype.com/tE3eG52v6dkR

http://docs.oracle.com/javase/7/docs/

http://docs.oracle.com/javase/tutorial/extra/certification/javase-7-programmer1.html

http://javarush.ru/11.html

https://compscicenter.ru
http://lektorium.tv
http://hexlet.io
http://spring-projects.ru/projects/spring-framework/
http://javabegin.ru/products/spring-mvc/?utm_medium=affiliate&utm_source=zaidi
http://javawebinar.ru/topjava/

http://www.leveluplunch.com/java/tutorials/

к примеру - http://jconcurrent.com/
От:
Vladislav Fedotov
 посты с хабра по многопоточности:
https://habrahabr.ru/post/277669/
https://habrahabr.ru/company/luxoft/blog/157273/
https://habrahabr.ru/post/260953/
https://habrahabr.ru/post/187752/
https://habrahabr.ru/company/odnoklassniki/blog/255067/
https://habrahabr.ru/company/golovachcourses/blog/221133/ !!! супер мега стятья, читать каждый день перед сном
https://habrahabr.ru/post/143237/
https://habrahabr.ru/post/133981/
https://habrahabr.ru/post/128985/

видео:
https://stepic.org/course/%D0%A0%D0%B0%D0%B7%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%BA%D0%B0-%D0%B2%D0%B5%D0%B1-%D1%81%D0%B5%D1%80%D0%B2%D0%B8%D1%81%D0%B0-%D0%BD%D0%B0-Java-(%D1%87%D0%B0%D1%81%D1%82%D1%8C-2)-186/syllabus?module=3 - третий модуль

https://www.youtube.com/channel/UCdXqgQdGW5go6nkkBbUVSMA

книги на русском:
https://www.ozon.ru/context/detail/id/30425811/ - последнее издание
https://www.ozon.ru/context/detail/id/135464395/

доклады с конференций:
https://www.youtube.com/watch?v=3sP4KSPzNOQ
https://www.youtube.com/watch?v=arGcok_I_DY
https://www.youtube.com/watch?v=iB2N8aqwtxc
https://www.youtube.com/watch?v=t0dGLFtRR9c

### regular expressions Регулярные выражения

https://github.com/VerbalExpressions/JavaVerbalExpressions
https://regex101.com/
http://www.regexplanet.com/advanced/java/index.html
 O'Reilly — Регулярные выражения. Сборник рецептов

## интернационализация locale internationalization

http://www.avajava.com/tutorials/lessons/how-do-i-use-locales-and-resource-bundles-to-internationalize-my-application.html

драйвер СУБД, СУБД, JVM, библиотеки Java, код java, командная оболочка/настройки ОС, настройки клиента/браузера.
А ещё - умножаем всё на 2, т.к. клиент и сервер разные устройства.

учитывать в коде при обмене данными:
консоль, ФС, БД, клиент/браузер, другой сервер.

## code conventions

http://habrahabr.ru/post/112042/
http://google-styleguide.googlecode.com/svn/trunk/javaguide.html
http://www.oracle.com/technetwork/java/codeconventions-150003.pdf
http://se.cs.karelia.ru/wiki/Справочник_охотника:_Соглашения_по_оформлению_кода_Java

## MAVEN

### Maven жизненный цикл

```java
1) archetype — создание темплейта и обработка ресурсов. На этой фазе разрешаются и, при необходимости, скачиваются из интернета зависимости;
2) compile — компиляция;
3) обработка тестовых ресурсов (например — скачивается из интернета JUnit-пакет);
4) компиляция тестов (тестирующие классы не передаются конечным пользователям);
5) test — тестирование;
6) package — упаковка (обычно речь идёт о создании JAR- или WAR-файла);
7) install — инсталляция проекта в локальном Maven-репозитории (теперь он доступен как модуль для других локальных проектов);
8) deploy — инсталляция в удаленном Maven-репозитории (теперь стабильная версия проекта доступна широкому кругу разработчиков).
Maven имеет также стандартный жизненный цикл для чистки (cleaning) и для генерации его страницы (site). Если бы ‘clean ' было частью обычного жизненного цикла, проект подвергался бы чистке при каждом построении, что нежелательно.
```

## WEB-JAVA

### servlet

сервлет - это Java-класс, который наследуется обычно от класса HttpServlet и переопределяет часть методов:
• doGet - если мы хотим, чтобы сервлет реагировал на GET запрос.
• doPost - если мы хотим, чтобы сервлет реагировал на POST запрос.
• doPut, doDelete - если мы хотим, чтобы сервлет реагировал на PUT и DELETE запрос (есть и такие в HTTP). Эти методы реализуются крайне редко, т.к. сами команды тоже очень редко встречаются.
• init, destroy - для управления ресурсами в момент создания сервлета и в момент его уничтожения.

Если же необходимо перехватывать все команды, то проще переопределить метод service. Именно этот метод вызывается при приходе запроса от клиента. В HttpServlet происходит разбор запроса и в соответствии с указанной командой вызывается метод doGet, doPost и т.д.


Servlet.java
```java
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        Writer w = response.getWriter();
        String name = request.getParameter("name");
        w.write("Тест сервелет: " + name);
}      
```

WEB-INF/web.xml
```java
    <servlet>
        <servlet-name>resumeServlet</servlet-name>
        <servlet-class>ru.javawebinar.webapp.web.ResumeServlet</servlet-class>
        <load-on-startup>0</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>resumeServlet</servlet-name>
        <url-pattern>/resume</url-pattern>
    </servlet-mapping>
```

### jstl

специальные тэги для сокращения java вставок в jsp

```java
<c:ForEach ... >
...

</c:ForEach>
```

### jsp

вставка java кода

```java
<% ... %>
```

WEB-INF/web.xml
```java
    <servlet>
        <servlet-name>resumeList</servlet-name>
        <jsp-file>/WEB-INF/jsp/list.jsp</jsp-file>
    </servlet>
    <servlet-mapping>
        <servlet-name>resumeList</servlet-name>
        <url-pattern>/list</url-pattern>
    </servlet-mapping>

    <welcome-file-list>
        <welcome-file>/WEB-INF/jsp/list.jsp</welcome-file>
    </welcome-file-list>
```

### tomcat administration

старт дебаг
catalina.sh jpda start

управление развёртыванием http://127.0.0.1/manager

```java
tomcat-dir\conf\tomcat-users.xml
<user username="tomcat" password="tomcat" roles="tomcat,manager-gui,admin-gui"/>

# cat /distr/tomcat_profile.sh
#!/bin/bash
export JAVA_HOME=/usr/java/latest
export PATH=${PATH}:${JAVA_HOME}/bin:
export TOMCAT_USER="tomcat"
export CATALINA_HOME="/opt/tomcat"
export CATALINA_BASE="/opt/tomcat"
export CATALINA_PID="${CATALINA_HOME}/catalina.pid"
export CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"

```

```java

# cat /etc/init.d/tomcat.sh
case $1 in
start)
/bin/su - $TOMCAT_USER -c "$CATALINA_HOME/bin/catalina.sh jpda start"
;;
stop)
/bin/su - $TOMCAT_USER -c "$CATALINA_HOME/bin/shutdown.sh"
;;
restart)
/bin/su - $TOMCAT_USER -c "$CATALINA_HOME/bin/shutdown.sh"
/bin/su - $TOMCAT_USER -c "$CATALINA_HOME/bin/catalina.sh jpda start"
#/bin/su - $TOMCAT_USER -c "tomcat $CATALINA_HOME/bin/shutdown.sh"
#/bin/su - $TOMCAT_USER -c "t $CATALINA_HOME/bin/startup.sh"
;;
esac
exit 0
```

Netbeans default pass 

```java
<user username="ide" password="r4ma0nsa" roles="manager-script,admin"/>
```

### tomcat windows service install

переменные окружения
CATALINA_BASE=C:\Users\bskma\AppData\Roaming\NetBeans\8.1\apache-tomcat-8.0.27.0_base
CATALINA_HOME=C:\apache-tomcat-8.0.30
CATALINA_OPTS=-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false
CATALINA_TMPDIR=C:\Users\bskma\AppData\Roaming\NetBeans\8.1\apache-tomcat-8.0.27.0_base\temp
JAVA_HOME=C:\Program Files\Java\jdk1.8.0_71



установить без пробелов в названиях папок
startup.bat
shutdown.bat
service.bat install

### tomcat deploy

http://0.0.0.0:8080/tomcatwarpath/servletmapname

### jsp module dependecies scope

provided - только для отладки/компиляции, без загрузки в артифакт war.
java.servlet.jar
java.servlet.jsp.jar

## xml

jaxb serialiation
@XMLRootElement
@XMLAccessorType(XMLAccessorType.FIELD)

## programmer 1

http://education.oracle.com/pls/web_prod-plq-dad/db_pages.getpage?page_id=303&p_certName=SQ1Z0_803
http://enthuware.com/

## перевод часов timezone

```java
Так вот, это заблуждение — просто апгрейд JDK на Unix до 1.7.0_72 не годится.
Внутри JDK пакетов есть файлики таймзон (пакет tzdata), вот здесь указано, какой пакет в какой дистрибутив входит и указан контент tzdata пакетов: www.oracle.com/technetwork/java/javase/tzdata-versions-138805.html

Как видно, чтобы получить апдейт к русским таймзонам, нужен пакет как минимум tzdata2014f.
При этом в последних версиях JDK присутствует только tzdata2014c.

Предположим, что у вас уже настроено:
user@host:/home/user$ echo $JAVA_HOME
/usr/lib/jvm/java-7-oracle

Тогда вам достаточно поставить отдельно пакет tzdata-java:
user@host:/home/host$ sudo apt-get install tzdata-java

Затем указать используемой Java (например, той, которая связана с переменной JAVA_HOME) брать файлики таймзон из пакета tzdata-java. Для этого имеет смысл стереть или переименовать каталог с файликами таймзон внутри JDK и поставить символическую ссылку на /usr/share/javazi:
mv $JAVA_HOME/jre/lib/zi $JAVA_HOME/jre/lib/zi-default
ln -s /usr/share/javazi/  $JAVA_HOME/jre/lib/zi

Проверить можно следующим кодом на Java:
import java.util.*;
import java.text.DateFormat;

public class TestMSK {
    public static void main(String[] args) {

        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Europe/Moscow"));
        DateFormat df = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.FULL, Locale.US);
        df.setCalendar(c);

        c.setTimeInMillis(1413769091L * 1000L);
        if (!df.format(c.getTime()).equals("Monday, October 20, 2014 5:38:11 AM MSK")) {
            System.out.println("FAIL1 - 20 Oct is not in sync ");
            System.out.println(df.format(c.getTime()));
            System.exit(1);
        }

        c.setTimeInMillis(1414633091L * 1000L);

        if (!df.format(c.getTime()).equals("Thursday, October 30, 2014 4:38:11 AM MSK")) {
            System.out.println("FAIL2 - 30 Oct is not in sync");
            System.out.println(df.format(c.getTime()));
            System.exit(2);
        }

        System.out.println("OK");
        System.exit(0);
    }
}


Проверка:

user@host:/home/user$ javac -cp . TestMSK.java
user@host:/home/user$
user@host:/home/user$ java -cp . TestMSK
OK

Для Windows тоже нужны ручные действия.

В данном случае апдейтом занимается tzupdater tool — качаем отсюда:
www.oracle.com/technetwork/java/javase/downloads/tzupdater-download-513681.html

Запускаем из каждой версии JDK, которые хотим проапдейтить:
C:\jdk1.7.0_60\bin>.\java.exe -cp . -jar tzupdater.jar -u
```

## IDE

## IDEA

### IDEA plugins

keyPromoter
bashSupport
markdownSupport
ASMBytecode
emmet
liveEdit

http://habrahabr.ru/post/206714/
http://eax.me/intellij-idea-hotkeys/

### idea hotkeys

ctrl+shift+t   - new test
ctrl+n           - искать класс
ctrl+f12       - искать в классе
ctrl+q           - жабадок
ctrl+shift+t  - goto unittest
alt+enter   -  подсветка синтаксиса для строк в кавычках


### JR  plugin

```java
File -> Project Structure -> Modules; сделать «ошибочные» программы исключенными (Excluded).
file — invalidate caches 
в настройках Solutian (используемый по умолчанию для Run) убрал make (во фрейме before lanch). И теперь все программы запускаю методом: C-S-F9 (для каждого ф-ла), C-S-F10 

Run -> Edit Configurations… -> Defaults -> Application. Убери «Make» из Before launch.
ИЛИ (для одного раза)
Через Ctrl + Shift + F9 компилируешь нужную вкладку (один раз получишь ошибку), затем вверху рядом с кнопкой Run (зелёный треугольник) выбираешь нужный для запуска и жмешь Edit Configurations… убираешь Make. 

 всю папку d:\java\JavaRushHomeWork\src\com\javarush\test\ копирую в другое место на диске при помощи проводника, потом удаляю всю папку в исходном месте при необходимости все можно восстановить как было простым копированием папки на исходное место. И не надо ничего комментировать!!! Быстро и просто кстати IDEA работает после этого ощутимо быстрее на слабом нетбуке. 

закомментируй как сказали выше, нажимай alt+shift+f10, выбирай новый Solution (он у тебя будет под цифрой 2) и все скомпилируется. 
```

## ECLIPSE

http://stackoverflow.com/questions/5672082/eclipse-uml-plugin-with-java-code-generation
http://habrahabr.ru/post/137252/
