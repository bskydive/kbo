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

## python opensuse

```bash
pip uninstall asttokens comm contourpy cycler decorator executing fonttools ipympl ipython ipython_pygments_lexers ipywidgets jedi jupyterlab_widgets kiwisolver matplotlib matplotlib-inline numpy parso pexpect pillow prompt_toolkit ptyprocess pure_eval Pygments pyparsing stack-data traitlets wcwidth widgetsnbextension

update-alternatives --display pip
# pip - auto mode
#   link best version is /usr/bin/pip-3.12
#   link currently points to /usr/bin/pip-3.12
#   link pip is /usr/bin/pip
# /usr/bin/pip-3.12 - priority 312
# /usr/bin/pip3.6 - priority 36
update-alternatives --config pip

pip check
pip install ipykernel numpy matplotlib

/usr/bin/python3.12 -m pip install ipykernel -U --user --force-reinstall

zypper rm jupyter jupyter-ipykernel jupyter-ipyparallel jupyter-jupyter_console jupyter-nbconvert jupyter-notebook jupyter-qtconsole libqt5-qtconnectivity-tools openmpi2-config pandoc-cli python3-Genshi python3-Pygments python3-Twisted python3-gevent python3-ipykernel python3-ipyparallel python3-ipython python3-ipywidgets python3-mpi4py python3-numpy python3-paramiko python3-pexpect python3-pycares python3-pymongo python3-qt5 python3-qtwebengine-qt5 python3-service_identity python3-simplejson python3-tornado rdma-ndd
zypper rm accerciser accerciser-lang accerciser-plugin-IPython at-spi2-core at-spi2-core-lang ghc-Glob ghc-JuicyPixels ghc-OneTuple ghc-Only ghc-QuickCheck ghc-SHA ghc-StateVar ghc-aeson ghc-aeson-pretty ghc-ansi-terminal ghc-ansi-terminal-types ghc-appar ghc-array ghc-asn1-encoding ghc-asn1-parse ghc-asn1-types ghc-assoc ghc-async ghc-attoparsec ghc-base ghc-base-compat ghc-base-compat-batteries ghc-base-orphans
zypper rm  ghc-base16-bytestring ghc-base64-bytestring ghc-basement ghc-bifunctors ghc-binary ghc-bitvec ghc-blaze-builder ghc-blaze-html ghc-blaze-markup ghc-byteorder ghc-bytestring ghc-case-insensitive ghc-cassava ghc-cereal ghc-citeproc ghc-colour ghc-commonmark ghc-commonmark-extensions ghc-commonmark-pandoc ghc-comonad ghc-conduit ghc-conduit-extra ghc-containers ghc-contravariant ghc-cookie ghc-crypton ghc-crypton-connection ghc-crypton-x509 ghc-crypton-x509-store ghc-crypton-x509-system ghc-crypton-x509-validation ghc-data-array-byte ghc-data-default ghc-data-default-class ghc-data-default-instances-containers ghc-data-default-instances-dlist ghc-data-default-instances-old-locale ghc-data-fix ghc-deepseq ghc-digest ghc-digits ghc-directory ghc-distributive ghc-dlist ghc-doclayout ghc-doctemplates ghc-emojis ghc-exceptions ghc-file-embed ghc-filepath ghc-foldable1-classes-compat ghc-generically ghc-ghc-boot-th ghc-gridtables ghc-haddock-library ghc-hashable ghc-haskell-lexer ghc-hourglass ghc-http-client ghc-http-client-tls ghc-http-types ghc-indexed-traversable ghc-indexed-traversable-instances ghc-integer-logarithms ghc-iproute ghc-ipynb ghc-jira-wiki-markup ghc-libyaml ghc-memory ghc-mime-types ghc-mono-traversable ghc-mtl ghc-network ghc-network-uri ghc-old-locale ghc-old-time ghc-ordered-containers ghc-pandoc ghc-pandoc-types ghc-parsec ghc-pem ghc-pretty ghc-pretty-show ghc-prettyprinter ghc-primitive ghc-process ghc-random ghc-regex-base ghc-regex-tdfa ghc-resourcet ghc-safe ghc-scientific ghc-semialign ghc-semigroupoids ghc-skylighting ghc-skylighting-core ghc-skylighting-format-ansi ghc-skylighting-format-blaze-html ghc-skylighting-format-context ghc-skylighting-format-latex ghc-socks ghc-split ghc-splitmix ghc-stm ghc-streaming-commons ghc-strict ghc-syb ghc-tagged ghc-tagsoup ghc-template-haskell ghc-temporary ghc-texmath ghc-text ghc-text-conversions ghc-text-short ghc-th-abstraction ghc-th-compat ghc-th-lift ghc-th-lift-instances ghc-these ghc-time ghc-time-compat ghc-tls ghc-toml-parser ghc-transformers ghc-transformers-compat ghc-typed-process ghc-typst ghc-typst-symbols ghc-unicode-collation ghc-unicode-data ghc-unicode-transforms ghc-uniplate ghc-unix ghc-unix-time ghc-unliftio-core ghc-unordered-containers ghc-utf8-string ghc-uuid-types ghc-vector ghc-vector-algorithms ghc-vector-stream ghc-witherable ghc-xml ghc-xml-conduit ghc-xml-types ghc-yaml ghc-zip-archive ghc-zlib jupyter jupyter-ipykernel jupyter-ipyparallel jupyter-jupyter-client jupyter-jupyter-core jupyter-jupyter_console jupyter-jupyter_core-filesystem jupyter-nbconvert jupyter-nbformat jupyter-notebook jupyter-notebook-filesystem jupyter-qtconsole libQt5Bluetooth5 libQt5Bluetooth5-imports libQt5Designer5 libQt5Help5 libQt5Location5 libQt5Nfc5 libQt5Nfc5-imports libQt5PositioningQuick5 libQt5SerialPort5 libQt5WebSockets5 libQt5WebSockets5-imports libefa1 libfabric1 libgfortran4 libibverbs libibverbs1 libinfinipath4 libmana1 libmlx4-1 libmlx5-1 libopenblas_pthreads0 libpsm2-2 libpsm_infinipath1 libqt5-qtconnectivity-tools libquadmath0 librdmacm1 libstartup-notification-1-0 libucm0 libucp0 libucs0 libuct0 libwnck-3-0 libwnck-lang mpi-selector openmpi2 openmpi2-config openmpi2-libs pandoc-cli python3-Automat python3-Babel python3-Genshi python3-Jinja2 python3-MarkupSafe python3-PyHamcrest python3-PyNaCl python3-Pygments python3-QtPy python3-Send2Trash python3-Twisted python3-atspi python3-attrs python3-backcall python3-bcrypt python3-bleach python3-constantly python3-defusedxml python3-entrypoints python3-gevent python3-greenlet python3-h2 python3-hpack python3-html5lib python3-hyperframe python3-hyperlink python3-importlib-metadata python3-incremental python3-ipykernel python3-ipyparallel python3-ipython python3-ipython_genutils python3-ipywidgets python3-jedi python3-jsonschema python3-jupyter-client python3-jupyter-core python3-jupyter_console python3-mistune python3-more-itertools python3-mpi4py python3-nbconvert python3-nbformat python3-notebook python3-numpy python3-pandocfilters python3-paramiko python3-parso python3-pexpect python3-pickleshare python3-prometheus_client python3-prompt_toolkit python3-ptyprocess python3-pyasn1-modules python3-pycares python3-pymongo python3-pyrsistent python3-pyserial python3-python-dateutil python3-python-xlib python3-pytz python3-pyzmq python3-qt5 python3-qt5-sip python3-qtconsole python3-qtwebengine-qt5 python3-service_identity python3-simplegeneric python3-simplejson python3-terminado python3-testpath python3-tornado python3-traitlets python3-typing_extensions python3-wcwidth python3-webencodings python3-zipp python3-zope.interface rdma-core rdma-ndd typelib-1_0-Atspi-2_0 typelib-1_0-Rsvg-2_0 typelib-1_0-Wnck-3_0
```

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

