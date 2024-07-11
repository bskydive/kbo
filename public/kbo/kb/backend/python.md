# Python


## ссылки

 * https://pogromista.blog/

## обучение

 * https://coderun.yandex.ru/catalog

## линтер python

 * [Груг против сложности. Я пролинтил все посты на Хабре про Python, и вот что я нашёл](https://habr.com/ru/companies/breakpoint/articles/686104/)


## python framework

 * что-то простое, как топор (flask)
 * что-то асинхронное и простое, как топор (aiohttp)
 * что-то напичканное полезными батарейками (FastApi/Django, чаще DRF)

 * [Окей, Джанго, у меня к тебе несколько вопросов](https://habr.com/ru/articles/594601/)

## install

 * https://docs.python.org/3/library/venv.html
 * https://www.freecodecamp.org/news/how-to-setup-virtual-environments-in-python/
```bash
#pip install virtualenv
aptitude install python3-venv
python<version> -m venv <virtual-environment-name>
cd projectA
python3.8 -m venv env
source <venv>/bin/activate
pip list

```

 * 1
	```bash

		# CentOS
		yum install libpqxx libpqxx-devel openjpeg-libs gd openjpeg openjpeg-devel freetype-devel freetype libxml2-devel python-setuptools python27-devel python27-libs python27-tools python27 python27-distribute --enablerepo=ius

		easy_install -U virtualenv

		# если проблемы с каналом связи:
		cd /distr/
		wget http://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.9.1.tar.gz
		easy_install -U ./virtualenv-1.9.1.tar.gz

		mkdir /opt/env27

		virtualenv -p /usr/bin/python2.7 --no-site-packages /opt/env27
		cd /opt/env27/
		./bin/pip install psycopg2 xlwt pillow django south qrcode chameleon reportlab pyramid waitress alembic
		./bin/pip list
		Chameleon (2.11)
		Django (1.5.1)
		Mako (0.8.0)
		MarkupSafe (0.15)
		PasteDeploy (1.5.0)
		Pillow (2.0.0)
		psycopg2 (2.5)
		pyramid (1.4.1)
		qrcode (2.7)
		reportlab (2.7)
		repoze.lru (0.6)
		South (0.7.6)
		translationstring (1.1)
		venusian (1.0a8)
		waitress (0.8.3)
		WebOb (1.2.3)
		wsgiref (0.1.2)
		xlwt (0.7.5)
		zope.deprecation (4.0.2)
		zope.interface (4.0.5)

	```

 * 2
	```bash
		# see http://docs.pylonsproject.org/projects/pyramid/en/latest/narr/install.html
		# Installing Pyramid on a UNIX System
		wget http://peak.telecommunity.com/dist/ez_setup.py
		sudo python ez_setup.py
		# Возможно потребует sudo python ez_setup.py -U setuptools

		sudo easy_install virtualenv

		virtualenv --no-site-packages env
		cd env
		bin/pip install pyramid
		bin/pcreate -s alchemy skyProject
		# see skyProject/README
		sudo apt-get install postgresql-server-dev-all
		sudo apt-get install python-dev


		bin/pip install psycopg2
		bin/pip install qrcode
		bin/pip install pillow
		bin/pip install reportlab


		# Расспаковываем приложение в skyProject

		# настраиваем приложение и инициализируем БД
		cd skyProject
		../bin/python setyp.py develop
		#создаем в БД схему skydb



		# Заливаем русские шрифты

		ln -s ../../../../../skyProject/fonts/arialbd.ttf  ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/arialbi.ttf ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/ariali.ttf ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/arial.ttf ./lib/python2.7/site-packages/reportlab/fonts

		ln -s ../../../../../skyProject/fonts/courbd.ttf ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/courbi.ttf ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/couri.ttf ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/cour.ttf ./lib/python2.7/site-packages/reportlab/fonts

		ln -s ../../../../../skyProject/fonts/timesbd.ttf ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/timesbi.ttf ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/timesi.ttf ./lib/python2.7/site-packages/reportlab/fonts
		ln -s ../../../../../skyProject/fonts/times.ttf ./lib/python2.7/site-packages/reportlab/fonts
	```

