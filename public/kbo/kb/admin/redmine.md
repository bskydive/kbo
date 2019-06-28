# Redmine

 * http://habrahabr.ru/post/227155/
 * Rack Mini Profiler 
 * RmPlus DevTools
 * OINK
 * Как хранить зеркало инфы в облаке?
 * структура каталогов удобна, но как ее переместить в облако?
 * автоматическая синхронизация?

## Plugins

 * http://caiiiycuk.info/redmine-jabber/
 * http://miracle.rpz.name/2011/06/27/redmine-with-jabber-notifications/
 * RSS client?
 * chat? -- history
 * mail --> server daemon --> jabber message
 * (mail+ejabberd)
 * https://github.com/peclik/clipboard_image_paste
 
```bash
You cannot specify the same gem twice with different version requirements.
You specified: capybara (~> 2.1.0) and capybara (~> 2.0)

найти и отредактировать GemFile в плагине. Вписать недостающую версию.
```

```bash
Environment:
  Redmine version                          2.3.1.stable
  Ruby version                             1.8.7 (i686-linux)
  Rails version                            3.2.13
  Environment                              production
  Database adapter                         PostgreSQL
Redmine plugins:
  clipboard_image_paste                    1.6
```

### посмотреть:

 * https://bitbucket.org/haru_iida/redmine_code_review
 * https://github.com/danmunn/redmine_dmsf
 * https://github.com/jbox-web/redmine_git_hosting
 * https://github.com/alexbevi/redmine_knowledgebase
 * https://github.com/credativUK/redmine_image_clipboard_paste - вставка напрямую в каммент
 * timesheet
 * http://theadmin.org/articles/plugin-that-adds-a-link-to-redmines-menu/

### удалить:

 * https://github.com/jgraichen/redmine_dashboard - broken lang? посмотреть другую версию
 * http://redminecrm.com/projects/zenedit/pages/1
 * https://github.com/peclik/clipboard_image_paste
 * https://github.com/undx/redmine_screenshot_paste

### installed:

 * https://github.com/redminecrm/redmine_tags
 * https://github.com/bdemirkir/sidebar_hide
 * http://redminecrm.com/projects/checklist/pages/1
 * https://github.com/peclik/clipboard_image_paste


### установка
 
 * копировать в каталог плагинов, исключая приставки версий, настроить права для ролей под новые фичи
 * chown -R redmine:redmine /opt/redmine/*
 * su - redmine -c "cd /opt/redmine/;bundle install --without development test"
 * su - redmine -c "cd /opt/redmine/;rake redmine:plugins:migrate RAILS_ENV=production"
 * /etc/init.d/nginx-redmine restart

### удаление:

 * rake db:migrate:plugin NAME=redmine_image_clipboard_paste VERSION=0 RAILS_ENV=production
 * rm -rf plugins/redmine_image_clipboard_paste
 

## redmine-2.5.1 ruby 1.9.3

http://karolgalanciak.com/blog/2013/07/19/centos-6-4-server-setup-with-ruby-on-rails-nginx-and-postgresql/
http://tecadmin.net/install-ruby-1-9-3-or-multiple-ruby-verson-on-centos-6-3-using-rvm/
https://www.digitalocean.com/community/tutorials/how-to-deploy-rails-apps-using-passenger-with-nginx-on-centos-6-5

https://gist.github.com/vjt/804654

```bash


gem install passenger 

yum install gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel pcre-devel curl-devel
yum install zlib-devel curl-devel openssl-devel apr-devel apr-util-devel patch gcc-c++ gcc make zlib-devel openssl-devel readline-devel ImageMagick-devel libpqxx-devel
curl -L get.rvm.io | bash -s stable
rvm install 1.9.3 
usermod -aG rvm redmine
gem install bundler rails --no-ri --no-rdoc

http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-centos93-9.3-1.noarch.rpm
yum install postgresql93 postgresql93-libs postgresql93-server postgresql93-test


```

## Links

wget http://bitnami.com/redirect/to/19058/bitnami-redmine-2.3.1-0-linux-installer.run
wget http://bitnami.com/redirect/to/19060/bitnami-redmine-2.3.1-0-linux-x64-installer.run

http://vault-tec.info/post/68670739052/installing-migrating-upgrading-redmine-with-ldap-on

## Install

!!! вынести создание профайлов выше
bundle install не видит pg_config

## Подготовка ОС

##yum install zlib-devel curl-devel openssl-devel apr-devel apr-util-devel patch gcc-c++ gcc make zlib-devel openssl-devel readline-devel ImageMagick-devel libpqxx-devel
yum install zip unzip libyaml-devel zlib-devel curl-devel openssl-devel httpd-devel apr-devel apr-util-devel gcc ruby-devel gcc-c++ make ImageMagick-devel sqlite-devel perl-LDAP mod_perl perl-Digest-SHA
yum install postgresql95-devel

## миграция redmine 2.5--3.2.0

сначала поставить 
yum nginx passenger git patch

для корректной миграции плагинов НЕ надо ставить две версии ruby
для rvm необходимо менять путь к passenger_ruby в nginx.conf

```bash
> gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
> curl -sSL https://get.rvm.io | bash -s stable
> rvm install 1.9.3
> rvm install 2.0.0
> rvm list
> rvm use 1.9.3-p***

```


```bash
> passenger_root /usr/local/rvm/gems/ruby-1.9.3-p547/gems/passenger-4.0.45;
passenger_ruby /usr/local/rvm/wrappers/default/ruby;

passenger_root /usr/share/ruby/vendor_ruby/phusion_passenger/locations.ini;
> passenger_ruby /usr/bin/ruby;
passenger_instance_registry_dir /var/run/passenger-instreg;


> su - redmine
cd /opt/redmine
распаковать БД и файлы, обновить плагины, проверить права для плагиновв ролях редмайна
bundle exec rake redmine:plugins NAME=redmine_checklists RAILS_ENV=production

> ln -s /distr/ruby_profile.sh /opt/profile.d/
> ln -s /distr/postgres_profile.sh /opt/profile.d/
> chown -R redmine:nginx /opt/redmine
> service nginx restart

relogin

> bundle install --without development test rmagick
export RAILS_ENV=production

> bundle exec rake generate_secret_token
> bundle exec rake redmine:plugins:migrate 
> bundle exec rake db:migrate 

#тестовый запуск:
> bundle exec rails server webrick -e production
```

## Установка ruby стэка

 * [ruby](/kbo/backend/ruby)

 * https://habrahabr.ru/post/278843/

## УСТАРЕЛО Установка ruby-enterprise (включает nginx-uwsgi) 

 * https://code.google.com/p/rubyenterpriseedition/downloads/list

```bash
wget http://rubyenterpriseedition.googlecode.com/files/ruby-enterprise-1.8.7-2012.02.tar.gz
tar -xf ruby-enterprise-1.8.7-2012.02.tar.gz 
```


solving ossl_pkey_ec.o error 1

```bash
https://bugs.ruby-lang.org/projects/ruby-trunk/repository/revisions/41808/diff
справа внизу кнопочка export to diff

cd /distr

cat >> ossl_pkey_ec.c.patch
Index: ext/openssl/ossl_pkey_ec.c
===================================================================
--- ext/openssl/ossl_pkey_ec.c  (revision 41807)
+++ ext/openssl/ossl_pkey_ec.c  (revision 41808)
@@ -762,8 +762,10 @@
                 method = EC_GFp_mont_method();
             } else if (id == s_GFp_nist) {
                 method = EC_GFp_nist_method();
+#if !defined(OPENSSL_NO_EC2M)
             } else if (id == s_GF2m_simple) {
                 method = EC_GF2m_simple_method();
+#endif
             }
 
             if (method) {
@@ -817,8 +819,10 @@
 
             if (id == s_GFp) {
                 new_curve = EC_GROUP_new_curve_GFp;
+#if !defined(OPENSSL_NO_EC2M)
             } else if (id == s_GF2m) {
                 new_curve = EC_GROUP_new_curve_GF2m;
+#endif
             } else {
                 ossl_raise(rb_eArgError, "unknown symbol, must be :GFp or :GF2m");
             }


cp ossl_pkey_ec.c.patch /distr/ruby-enterprise-1.8.7-2012.02/source/
cd /distr/ruby-enterprise-1.8.7-2012.02/source/
patch -p0 < ossl_pkey_ec.c.patch

```

```bash
cd ruby-enterprise-1.8.7-2012.02
bash installer

ln -s /opt/ruby-enterprise-1.8.7-2012.02/ /opt/ruby-enterprise

cat >> /distr/ruby.sh
##
#/bin/bash
export PATH=$PATH:/opt/ruby-enterprise/bin/
export RAILS_ENV=production
##

ln -s /distr/ruby.sh /etc/profile.d/ruby.sh

gem install rails -v 3.2.13
gem install rmagick pg ruby-openid rack-openid
gem list

*** LOCAL GEMS ***                                                                                                                                                                                         
                                                                                                                                                                                                           
actionmailer (3.2.13)                                                                                                                                                                                      
actionpack (3.2.13)                                                                                                                                                                                        
activemodel (3.2.13)                                                                                                                                                                                       
activerecord (3.2.13)                                                                                                                                                                                      
activeresource (3.2.13)                                                                                                                                                                                    
activesupport (3.2.13)                                                                                                                                                                                     
arel (3.0.2)                                                                                                                                                                                               
builder (3.0.4, 3.0.0)                                                                                                                                                                                     
bundler (1.3.5)                                                                                                                                                                                            
coderay (1.0.9)                                                                                                                                                                                            
daemon_controller (1.1.4)                                                                                                                                                                                  
erubis (2.7.0)                                                                                                                                                                                             
fastercsv (1.5.5)
hike (1.2.2)
i18n (0.6.1)
journey (1.0.4)
jquery-rails (2.0.3)
json (1.8.0, 1.7.7)
mail (2.5.4, 2.5.3)
mime-types (1.23)
multi_json (1.7.4, 1.7.2)
net-ldap (0.3.1)
passenger (4.0.4)
pg (0.15.1)
polyglot (0.3.3)
rack (1.5.2, 1.4.5)
rack-cache (1.2)
rack-openid (1.3.1)
rack-ssl (1.3.3)
rack-test (0.6.2)
rails (3.2.13)
railties (3.2.13)
rake (10.0.4)
rdoc (3.12.2)
rmagick (2.13.2)
ruby-openid (2.1.8)
sprockets (2.2.2)
thor (0.18.1)
tilt (1.4.1, 1.4.0)
treetop (1.4.12)
tzinfo (0.3.37)
```

## Установка Redmine

!!!2.4.1 - ошибка 500
```bash
wget http://rubyforge.org/frs/download.php/76933/redmine-2.3.1.tar.gz
wget http://rubyforge.org/frs/download.php/76934/redmine-2.3.1.tar.gz.md5
md5sum -c redmine-2.3.1.tar.gz.md5 
tar -xf redmine-2.3.1.tar.gz

mv /distr/redmine-$version /opt
ln -s /opt/redmine-$version /opt/redmine
```

## [nginx-passenger](/kbo/admin/nginx-passenger)


## создаем БД

```
su - postgres -c "createuser --pwprompt --encrypted --no-adduser --no-createdb --no-createrole --no-inherit USERNAME1" 
su - postgres -c "createdb --encoding=UNICODE --owner=USERNAME1 DBNAME1"
```

## Настройка БД

```bash

su - postgres -c "createuser --pwprompt --encrypted --no-adduser --no-createdb --no-createrole --no-inherit $USERNAME"
su - postgres -c "createdb --encoding=UNICODE --owner=$USERNAME $DBNAME"


cp -p /opt/redmine/config/database.yml.example /opt/redmine/config/database.yml
cat > /opt/redmine/config/database.yml
##
# PostgreSQL configuration example
production:
  adapter: postgresql
  database: redmine-db
  host: localhost
  username: redmine-user
  password: "redmine-passwd"
##


##Ошибка 500
https://github.com/backlogs/redmine_backlogs/issues/852
Manually remove the rack gem that was installed by bundler
    sudo gem uninstall rack
    Ignore the dire warnings

Manually edit the bundle manifest /usr/share/redmine/Gemfile.lock
    Remove the line that says rack (1.5.2)
    I also removed rack-test

cat > Gemfile.local << "EOF"
gem "rack", "~> 1.4.5"
EOF
##


useradd -m redmine
chown -R redmine:redmine /opt/redmine
passwd redmine
echo 'redmine ALL=(ALL) ALL' >> /etc/sudoers
su - redmine
cd /opt/redmine/
bundle install --without development test

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
mcedit /etc/sudoers
######!!!!!echo 'redmine ALL=(ALL) ALL'
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

https://bugs.ruby-lang.org/projects/ruby-trunk/repository/revisions/41808/diff
справа внизу кнопочка export to diff



rake generate_secret_token
##export RAILS_ENV=production
##test
su - postgres -c "psql -U USERNAME1 -d DBNAME1" 
redmine-db-> \l
                                    Список баз данных
    Имя     |   Владелец   | Кодировка | LC_COLLATE |  LC_CTYPE  |     Права доступа     
------------+--------------+-----------+------------+------------+-----------------------
 postgres   | postgres     | UTF8      | ru_RU.utf8 | ru_RU.utf8 | 
 redmine-db | redmine-user | UTF8      | ru_RU.utf8 | ru_RU.utf8 | 
redmine-db=> \q
##


rake db:migrate 
RAILS_ENV=production rake redmine:load_default_data


chmod g+w -R /opt/redmine/tmp/
chmod g+w -R /opt/redmine/files/
chmod g+w -R /opt/redmine/log/
chmod g+w -R /opt/redmine/public/

```

## настройка почты


```bash

yum install sendmail sendmail-cf
mcedit /etc/mail/sendmail.mc
    Configure DAEMON_OPTIONS to only allow sending from localhost/smtp: DAEMON_OPTIONS(`Port=smtp,Addr=127.0.0.1, Name=MTA')dnl
    Set the LOCAL_DOMAIN option to your hostname: LOCAL_DOMAIN(`example.com')dnl

Now, to update sendmail's configuration, enter $ sudo make -C /etc/mail, and then restart sendmail with $ sudo service sendmail restart.

You'll also want to make sure your hostname is set correctly (this will be the default from address domain); check it by entering $ hostname... if it's incorrect, you can set it explicitly in /etc/sysconfig/network as the HOSTNAME variable. You might also want to add your hostname to /etc/hosts as the first result for 127.0.0.1.

```

```bash

cp config/configuration.yml.example config/configuration.yml
mcedit config/configuration.yml

 production:
   email_delivery:
     delivery_method: :smtp
     smtp_settings:
       address: "localhost"
       port: 25
```

## Настройка пользователей

```
useradd redmine
usermod -s /sbin/nologin redmine
chown -R redmine:redmine /opt/redmine*
```

## Настройка ротации логов

```bash
cd /opt/redmine/
cp config/additional_environment.rb.example config/additional_environment.rb
cat >> config/additional_environment.rb
config.logger = Logger.new('/opt/redmine/log/main.log', 2, 1000000)
config.logger.level = Logger::INFO
```


## Проверка

```
ruby script/rails server webrick -e production
http://localhost:3000/
login: admin
password: admin
```

## Состав ПО

```bash
gem list

*** LOCAL GEMS ***

actionmailer (3.2.13)
actionpack (3.2.13)
activemodel (3.2.13)
activerecord (3.2.13)
activeresource (3.2.13)
activesupport (3.2.13)
arel (3.0.2)
builder (3.0.4, 3.0.0)
bundler (1.3.5)
coderay (1.0.9)
daemon_controller (1.1.4)
erubis (2.7.0)
fastercsv (1.5.5)
fastthread (1.0.7)
hike (1.2.2)
i18n (0.6.1)
journey (1.0.4)
jquery-rails (2.0.3)
json (1.7.7)
mail (2.5.3)
mime-types (1.23)
multi_json (1.7.2)
net-ldap (0.3.1)
passenger (3.0.19)
pg (0.15.1)
polyglot (0.3.3)
rack (1.5.2, 1.4.5)
rack-cache (1.2)
rack-openid (1.3.1)
rack-ssl (1.3.3)
rack-test (0.6.2)
rails (3.2.13)
railties (3.2.13)
rake (10.0.4)
rdoc (3.12.2)
rmagick (2.13.2)
ruby-openid (2.1.8)
sprockets (2.2.2)
thor (0.18.1)
tilt (1.4.0)
treetop (1.4.12)
tzinfo (0.3.37)


```

## git install for redmine

 * Администрирование - проекты - проектХХ - хранилища - добавить
 * `/opt/env27/skyProject/.git`

```bash

yum install git

mkdir /opt/redmine/redmine-git
cd /opt/redmine/redmine-git
touch readme
git add readme
git commit -m 'initial project version'
chown -R redmine-user:redmine-user /opt/redmine-git/

##useradd git
##usermod -s /sbin/nologin git
##chown -R git:git /opt/redmine-git/

```

## Модули


### install

```bash
Backup DB!!!
BAckup App!!!

http://www.redmine.org/plugins/clipboard_image_paste
http://www.redmine.org/plugins/redmine_attach_screenshot_2
https://bitbucket.org/StrangeWill/redmine-inline-attach-screenshot/downloads


cd /distr/modules
git clone https://github.com/peclik/clipboard_image_paste.git
cp -R /distr/modules/clipboard_image_paste /opt/redmine-2.3.1/plugins/
chown -R redmine:redmine /opt/redmine-2.3.1/plugins/clipboard_image_paste
cd /opt/redmine-2.3.1/
rake redmine:plugins:migrate RAILS_ENV=production
/etc/init.d/nginx-passenger restart
```

### Uninstall

```bash
Backup DB!!!
BAckup App!!!
cd /opt/redmine-2.3.1/
rake redmine:plugins:migrate NAME=plugin_name VERSION=0 RAILS_ENV=production
/etc/init.d/nginx-passenger restart
```

## themes

http://redminecrm.com/pages/circle-theme
https://github.com/makotokw/redmine-theme-gitmike


## redmine tips

 * шаблоны(запросы) фильтров отображения задач привязаны к пользователю
 * error 413
    * http://forum.slicehost.com/index.php?p=/discussion/1714/x
    * Just a note for future readers, if you're set up for running virtual hosts, and you have your nginx.conf split from your server conf files you can put the
``` 
 @client_max_body_size 4M;
 client_body_buffer_size 128k;@
``` 

## correct all issues load


```bash
Connecting to database specified by database.yml
Creating scope :system. Overwriting existing method Enumeration.system.
Creating scope :sorted. Overwriting existing method Group.sorted.
Creating scope :sorted. Overwriting existing method User.sorted.
Started GET "/login" for 176.124.146.173 at 2014-07-01 09:44:58 +0400
Processing by AccountController#login as HTML
  Current user: anonymous
  Rendered account/login.html.erb within layouts/base (600.1ms)
  Rendered plugins/clipboard_image_paste/app/views/clipboard_image_paste/_headers.html.erb (1.9ms)
  Rendered plugins/sidebar_hide/app/views/sidebar/_hideButton_partial.html.erb (1.6ms)
  Rendered plugins/clipboard_image_paste/app/views/clipboard_image_paste/_add_form.html.erb (6.3ms)
Completed 200 OK in 1034.0ms (Views: 833.5ms | ActiveRecord: 15.5ms)
Started POST "/login" for 176.124.146.173 at 2014-07-01 09:45:10 +0400
Processing by AccountController#login as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"AJIxyHBG2pywaoWRYcHEuwjERd/sV281RFf+tJKeyuQ=", "back_url"=>"http://82.146.32.207:3000/", "username"=>"bskydive", "password"=>"[FILTERED]", "login"=>"Вход »"}
  Current user: anonymous
Successful authentication for 'bskydive' from 176.124.146.173 at 2014-07-01 05:45:10 UTC
Redirected to http://82.146.32.207:3000/
Completed 302 Found in 16.4ms (ActiveRecord: 2.9ms)
Started GET "/" for 176.124.146.173 at 2014-07-01 09:45:10 +0400
Processing by WelcomeController#index as HTML
  Current user: bskydive (id=4)
  Rendered news/_news.html.erb (23.4ms)
  Rendered welcome/index.html.erb within layouts/base (50.5ms)
  Rendered plugins/clipboard_image_paste/app/views/clipboard_image_paste/_headers.html.erb (1.1ms)
  Rendered plugins/sidebar_hide/app/views/sidebar/_hideButton_partial.html.erb (0.7ms)
  Rendered plugins/clipboard_image_paste/app/views/clipboard_image_paste/_add_form.html.erb (3.1ms)
Completed 200 OK in 406.7ms (Views: 78.0ms | ActiveRecord: 23.2ms)
Started GET "/issues?per_page=100&query_id=6" for 176.124.146.173 at 2014-07-01 09:45:13 +0400
Processing by IssuesController#index as HTML
  Parameters: {"per_page"=>"100", "query_id"=>"6"}
  Current user: bskydive (id=4)
  Rendered queries/_filters.html.erb (20.1ms)
  Rendered queries/_columns.html.erb (3.4ms)
  Rendered issues/_list.html.erb (175.0ms)
  Rendered plugins/redmine_tags/app/views/issues/_tags_sidebar.html.erb (22.1ms)
  Rendered issues/_sidebar.html.erb (36.3ms)
  Rendered issues/index.html.erb within layouts/base (343.1ms)
  Rendered plugins/clipboard_image_paste/app/views/clipboard_image_paste/_headers.html.erb (1.3ms)
  Rendered plugins/sidebar_hide/app/views/sidebar/_hideButton_partial.html.erb (0.8ms)
  Rendered plugins/clipboard_image_paste/app/views/clipboard_image_paste/_add_form.html.erb (2.5ms)
Completed 200 OK in 993.5ms (Views: 351.6ms | ActiveRecord: 96.5ms)

``` 
