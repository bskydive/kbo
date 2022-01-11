# Android

## framework

 * https://developer.android.com/jetpack/compose
 * https://developer.apple.com/xcode/swiftui/
 * https://flutter.dev/

## google AMP

https://geektimes.ru/post/263624/

## Эмуляция

http://www.hardkernel.com/main/

genymotion

## Отладка


https://developer.android.com/studio/run/device.html

нажать 7 раз на номер сборки

cat >> /etc/udev/rules.d/51-android.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="1004", MODE="0666", GROUP="plugdev"
udevadm control --reload-rules

переключить устройство в USB-charge-only вместо MTP/PTP

помнить, что андроид эмулятор не работает на AMD выше 19API

http://stackoverflow.com/questions/35937875/unsupported-major-minor-version-52-0-when-rendering-in-android-studio#35937876

```java
Unsupported major.minor version 52.0

    When a higher JDK is used for compilation it creates class file with higher version and when a lower JDK is used to run the program it found that higher version of class file not supported at JVM level and results in java.lang.UnsupportedClassVersionError.

How to fix

    Increase the JAVA version you are using to run your program

You can follow some tricks

    Call stable version classpath 'com.android.tools.build:gradle:2.1.0' // 2.3.0


```

## gradle

```java
task getHomeDir << {
    println gradle.gradleHomeDir
}

gradle getHomeDir

```

## AVD

каталоги хранения
```java
/home/.$username
/tmp/android-$username
```

https://www.genymotion.com/#!/pricing

## links

документация
android-sdk\platforms\android-17\data\res\values\styles.xml
http://www.ozon.ru/context/detail/id/28299562/

новости 2015
http://habrahabr.ru/post/262321/

## Market

http://www.computerra.ru/94359/7-polnotsennyih-i-bezopasnyih-alternativ-google-play/
http://www.amazon.com/gp/mas/get/android
http://store.yandex.ru/
https://f-droid.org/
http://slideme.org/
http://antiroid.com/


## раскрутка

http://habrahabr.ru/post/246575/

## Разметка LAYOUT

Табличная разметка
```java
        <TableLayout
            android:layout_height="wrap_content"
            android:layout_width="wrap_content"
            android:layout_gravity="center"
            android:stretchColumns="*">
            <TableRow>
                <Button
                    android:id="@+id/button1"
                    android:layout_height="wrap_content"
                    android:layout_width="match_parent"
                    android:text="Первая кнопка"/>
```

## Вывод текста

### статика

```java
EditText userEditText = (EditText) findViewById(R.id.editTextUser);
TextView infoTextView = (TextView)findViewById(R.id.textViewInfo);
infoTextView.setText(user + " , вам передали " + gift);
```

### всплывающее уведомление

```java
Toast toast = Toast.makeText(getApplicationContext(), "Пора покормить кота!", Toast.LENGTH_SHORT); 
//LENGTH_SHORT — (По умолчанию) 2 сек
//LENGTH_LONG — 3 сек

toast.show(); 
```


```java
стандартная константа для размещения объекта в пределах большего контейнера (например, GRAVITY.CENTER, GRAVITY.TOP и др.);
смещение по оси X;
смещение по оси Y.

Например, если вы хотите, чтобы уведомление появилось в центре экрана, то используйте следующий код:
toast.setGravity(Gravity.CENTER, 0, 0);
```

## Notification в строке статуса

### Совместимость

```java
import android.support.v4.app.*

NotificationCompat.*
```

### Вызов с картинкой

```java
  // Идентификатор уведомления
    private static final int NOTIFY_ID = 101;

    public void onClick(View view) {
        Context context = getApplicationContext();

        Intent notificationIntent = new Intent(context, MainActivity.class);
        PendingIntent contentIntent = PendingIntent.getActivity(context,
                0, notificationIntent,
                PendingIntent.FLAG_CANCEL_CURRENT);

        Resources res = context.getResources();
        Notification.Builder builder = new Notification.Builder(context);

        builder.setContentIntent(contentIntent)
                .setSmallIcon(R.drawable.ic_launcher_cat)
                // большая картинка
                .setLargeIcon(BitmapFactory.decodeResource(res, R.drawable.hungrycat))
                //.setTicker(res.getString(R.string.warning)) // текст в строке состояния
                .setTicker("Последнее китайское предупреждение!")
                .setWhen(System.currentTimeMillis())
                .setAutoCancel(true)
                //.setContentTitle(res.getString(R.string.notifytitle)) // Заголовок уведомления
                .setContentTitle("Напоминание")
                //.setContentText(res.getString(R.string.notifytext))
                .setContentText("Пора покормить кота"); // Текст уведомленимя

        // Notification notification = builder.getNotification(); // до API 16
        Notification notification = builder.build();

        NotificationManager notificationManager = (NotificationManager) context
                .getSystemService(Context.NOTIFICATION_SERVICE);        
        notificationManager.notify(NOTIFY_ID, notification);
    }
```

### Отмена уведомления

```java
 if (notificationManager != null) notificationManager.cancel(NOTIFY_ID);
```

### Индикатор прогресса

```java
builder.setContentIntent(contentIntent)
      .setProgress(100, 50, false);
```

### Вибрация

```java
notification.defaults = Notification.DEFAULT_SOUND | Notification.DEFAULT_VIBRATE;
    Notification.DEFAULT_LIGHTS
    Notification.DEFAULT_SOUND
    Notification.DEFAULT_VIBRATE

Прежде чем использовать виброзвонок в своем приложении, необходимо получить нужные полномочия, прописав их в манифесте:
<uses-permission android:name="android.permission.VIBRATE"/>

одна секунда вибрации сменялась одной секундой паузы на протяжении пяти секунд:
long[] vibrate = new long[] { 1000, 1000, 1000, 1000, 1000 };
notification.vibrate = vibrate;
```

### Музыка

Ссылка:
```java
notification.sound = ringURI;
```

в качестве ресурса:
```java
Uri ringURI = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_NOTIFICATION);
notification.sound = ringURI;
```

С SD-карты:
```java
notification.sound = Uri.parse("file:///sdcard/cat.mp3"); // если знаем точный путь!
```


### Световая индикация

включить
```java
notification.ledARGB = Color.RED;
notification.ledOffMS = 0;
notification.ledOnMS = 1;
notification.flags = notification.flags | Notification.FLAG_SHOW_LIGHTS;
```

выключить
```java
notification.ledOffMS = 0;
notification.ledOnMS = 0;
```

## Активность ACTIVITY и намерения INTENT

### Создание

1. Разметка
2. Класс
3. Манифест
```java
setContentView(R.layout.activity_about);
```

### Заголовок активности

```java
setTitle("Popupmenu");
```

### Скрыть заголовок активности

```java
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main_activity2, menu);
        android.support.v7.app.ActionBar actionBar = getSupportActionBar();
        actionBar.hide();
        return true;
    }
```

### Активность ScrollView

```java
New | Layout resource file | Root element: ScrollView
```

### Манифест AndroidManifest.xml

```java
<activity
            android:name="ru.stepanovv.lesson7.app.AboutActivity"
            android:label="@string/title_activity_about"
            android:parentActivityName="ru.stepanovv.lesson7.app.MainActivity" >
            <meta-data
                android:name="android.support.PARENT_ACTIVITY"
                android:value="ru.stepanovv.lesson7.app.MainActivity" />
        </activity>
```

### Переключение 

```java
   Intent intent = new Intent(MainActivity.this, AboutActivity.class);
    startActivity(intent);
```

### Переключение с фильтром

```java
В манифесте добавим специальный фильтр:
<activity
    android:name=".SecondActivity"
    android:label="@string/title_activity_second" >
    <intent-filter >
        <action android:name="ru.alexanderklimov.testapplication.SecondActivity" />
        <category android:name="android.intent.category.DEFAULT" />
    </intent-filter>
</activity>

Запускаем вторую активность:
startActivity(new Intent("ru.alexanderklimov.testapplication.SecondActivity"));
```

### Передача текста намерением

```java
Intent intent = new Intent(MainActivity.this, SecondActivity.class);
intent.putExtra("username", userEditText.getText().toString());
getIntent().getExtras().getString("username");
```

### Возврат текста намерением

```java
static final private int CHOOSE_THIEF = 0; //от какого экрана. Можно -1

Intent questionIntent = new Intent(MainActivity.this, ChooseActivity.class);
startActivityForResult(questionIntent, CHOOSE_THIEF);
***
Intent answerInent = new Intent();
answerInent.putExtra(ru.alexanderklimov.sherlock.THIEF, "Сраный пёсик");
setResult(RESULT_OK, answerInent); //Activity.RESULT_CANCELED
```

### переход по ссылке

```java
new Intent(Intent.ACTION_VIEW, Uri.parse("http://developer.alexanderklimov.ru/android/"));
```

### не создавать новый экземпляр активности при запуске

```java
Intent intent = new Intent(context, MainActivity.class);
intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);

Либо вы можете прописать в манифесте для нужной активности атрибут 
android:launchMode="singleTop".
```

## Ориентация

### новая ориентация:

```java
/res/ | New | Android resource directory
Resource type: layout.
Available qualifiers: Orientation 
Screen orientation: Landscape
Теперь название папки будет layout-land.
```

### определить:

```java
getResources().getConfiguration().orientation == 
Configuration.ORIENTATION_PORTRAIT
Configuration.ORIENTATION_LANDSCAPE

activity.getWindowManager().getDefaultDisplay().getWidth();
activity.getWindowManager().getDefaultDisplay().getHeight();

int rotate = getWindowManager().getDefaultDisplay().getRotation();
	switch (rotate) {
	case Surface.ROTATION_0:
		return "Не поворачивали";
	case Surface.ROTATION_90:
		return "Повернули на 90 градусов по часовой стрелке";
	case Surface.ROTATION_180:
		return "Повернули на 180 градусов";
	case Surface.ROTATION_270:
		return "Повернули на 90 градусов по часовой стрелке";
	default:
		return "Не понятно";
	}
```


### установить: 

```java
В манифесте:
android:screenOrientation="portrait"
android:screenOrientation="landscape"

В onCreate
setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
```

### запрет onCreate при повороте

```java
android:configChanges="keyboardHidden|orientation|screenSize"
```

### смена ориентации для EditText вызывает 

```java
	edit.addTextChangedListener(new TextWatcher() {
		@Override
		public void onTextChanged(CharSequence s, int start, int before, int count) {
			// TODO Auto-generated method stub
			Toast.makeText(TestActivity.this, 
			         "onTextChanged: " + s, Toast.LENGTH_SHORT).show();
		}
```

### проверка наличия кнопки после поворота

```java
Button landscapeButton = (Button) findViewById(R.id.landscapeButton);
if (landscapeButton != null) {
    // Можно работать
}
```

### ориентация фрагментов

```java
@Override
public void onResume() {
    getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_FULL_SENSOR);
}

@Override
public void onPause() {
	getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT); 
    // ваш код
	super.onPause();
}
```

### Жизненный цикл при повороте

http://developer.android.com/reference/android/app/Activity.html#ActivityLifecycle

```java
    onPause()
    onStop()
    onDestroy()
    onCreate()
    onStart()
    onResume()
```

## Стили

### Диалоговый стиль для ScrollView

В манифесте:
```java
        <activity android:name=".AboutActivity2"
                  android:label="@string/about_title"
                    android:theme="@android:style/Theme.Dialog">
        </activity>
```

### Style.xml

```java
<resources>
    <style name="CodeFont" parent="@android:style/TextAppearance.Medium">
        <item name="android:layout_width">fill_parent</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:textColor">#00FF00</item>
        <item name="android:typeface">monospace</item>
    </style>
</resources>
```

### Наследование стилей

```java
<style name="GreenText" parent="@android:style/TextAppearance">
    <item name="android:textColor">#00FF00</item>
</style>
<style name="CodeFont.Red">
    <item name="android:textColor">#FF0000</item>
</style>
<style name="CodeFont.Red.Big">
    <item name="android:textSize">30sp</item>
</style>
```

## Темы

тема добавляется ко всему приложению или к отдельной активности через элементы <application> и <activity> в файле манифеста приложения
темы не могут быть применены к отдельным представлениям.

### тема для приложения

```java
<application android:theme="@style/CustomTheme">
```

### тема для активности

```java
<activity android:theme="@android:style/Theme.Dialog">
```

### Тема для версии API

Android 3.0 (API Level 11)
создайте альтернативный файл стилей в папке res/values-v11

### переопределение темы

добавьте тему как родительскую тему к своей теме
```java
<color name="custom_theme_color">#b0b0ff</color>
<style name="CustomTheme" parent="android:Theme.Light">
    <item name="android:windowBackground">@color/custom_theme_color</item>
    <item name="android:colorBackground">@color/custom_theme_color</item>
</style>
```

### Отдельное свойство темы

Знак ? применяется для поиска значения стиля в текущей теме, а подстрока ?android означает поиск значения стиля в системной теме Android.
```java
<EditText
    id="@+id/edit"
	android:textColor:="?android:textColorSecondary" />
```

## Меню

### Элемент меню 

/res/menu/*.xml
```java
    <item
        android:id="@+id/action_cat1"
        android:orderInCategory="100"
        app:showAsAction="never"
        android:title="@string/action_cat_male" />
```

### вызов меню

```java
@Override
public boolean onCreateOptionsMenu(Menu menu) {
    // Inflate the menu; this adds items to the action bar if it is present.
    getMenuInflater().inflate(R.menu.menu_main, menu);
    return true;
}
```

### реакция на меню через метод

```java
 @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        TextView infoTextView = (TextView) findViewById(R.id.textViewInfo);

        switch (id) {
            case R.id.action_cat1:
                infoTextView.setText("Вы выбрали кота!");
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
```

### Реакция на меню через свойства

```java
<item
    android:id="@+id/action_settings"
    android:title="@string/action_settings"
    android:orderInCategory="100"
    android:onClick="onSettingsMenuClick"
    app:showAsAction="never" />

// у атрибута пункта меню Settings установлено значение android:onClick="onSettingsMenuClick"
public void onSettingsMenuClick(MenuItem item) {
    TextView infoTextView = (TextView) findViewById(R.id.textViewInfo);
    infoTextView.setText("Вы выбрали пункт Settings, лучше бы выбрали кота");
}
```

## Всплывающее меню

### Вызов всплывающего меню

```java
    @TargetApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
    public void showPopupMenu(View v) {
        PopupMenu popupMenu = new PopupMenu(this, v);
        popupMenu.inflate(R.menu.menu_popup); // Для Android 4.0
        // для версии Android 3.0 нужно использовать длинный вариант
        // popupMenu.getMenuInflater().inflate(R.menu.popupmenu,
        // popupMenu.getMenu());

        popupMenu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {

                    @Override
                    public boolean onMenuItemClick(MenuItem item) {
                        // Toast.makeText(PopupMenuDemoActivity.this,
                        // item.toString(), Toast.LENGTH_LONG).show();
                        // return true;
                        switch (item.getItemId()) {

                            case R.id.menu1:
                                Toast.makeText(getApplicationContext(),
                                        "Вы выбрали PopupMenu 1",
                                        Toast.LENGTH_SHORT).show();
                                return true;
                            default:
                                return false;
                        }
                    }
                });

        popupMenu.setOnDismissListener(new PopupMenu.OnDismissListener() {

            @Override
            public void onDismiss(PopupMenu menu) {
                Toast.makeText(getApplicationContext(), "onDismiss",
                        Toast.LENGTH_SHORT).show();
            }
        });
        popupMenu.show();
    }
```

### Структура меню

/res/menu/menu_popup.xml
```java
<menu xmlns:android="http://schemas.android.com/apk/res/android" >
    <group android:id="@+id/menugroup1" >
        <item
                android:id="@+id/menu1"
                android:icon="@drawable/ic_launcher"
                android:title="Popup menu item 1"/>
        <item
                android:id="@+id/menu4"
                android:checkable="true"
                android:checked="true"
                android:icon="@drawable/ic_launcher"
                android:title="Popup menu item 4"
                android:enabled="false"/>
        <item
                android:id="@+id/menu3"
                android:title="Popup menu item 3">
            <menu>
                <item
                        android:id="@+id/submenu"
                        android:title="Подменю"/>
            </menu>
        </item>
    </group>
</menu>
```

## Звук

### папка для муз файлов

```java
File | New | Folder | Assets Folder
```

### Код

```java

    private SoundPool mSoundPool;
    private AssetManager mAssetManager;
    private int mSound;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mSoundPool = new SoundPool(3, AudioManager.STREAM_MUSIC, 0);
        mAssetManager = getAssets();

        // получим идентификаторы
        mSound = loadSound("vals.mp3");
    }

        @Override
        public void onClick(View v) {
            if (v.getId() == R.id.button) playSound(mSound);
        }

    private void playSound(int sound) {
        if (sound > 0)
            mSoundPool.play(sound, 1, 1, 1, 0, 1);
    }

    private int loadSound(String fileName) {
        AssetFileDescriptor afd = null;
        try {
            afd = mAssetManager.openFd(fileName);
        } catch (IOException e) {
            e.printStackTrace();
            Toast.makeText(this, "Не могу загрузить файл " + fileName,
                    Toast.LENGTH_SHORT).show();
            return -1;
        }
        return mSoundPool.load(afd, 1);
    }

```

## 2Д графика

### новый класс

```java
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.view.View;

public class Draw2D extends View{

    public Draw2D(Context context) {
        super(context);
    }

    private Paint mPaint = new Paint();
    Rect mRect = new Rect();

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);

        // стиль Заливка
        mPaint.setStyle(Paint.Style.FILL);
    }
}
```

### закрашиваем холст белым цветом

```java
        mPaint.setColor(Color.WHITE);
        canvas.drawPaint(mPaint);

```


###  Рисуем желтый круг

```java
        mPaint.setAntiAlias(true);
        mPaint.setColor(Color.YELLOW);
        canvas.drawCircle(50, 40, 30, mPaint);//x,y,radius
```

### Рисуем текст

```java
        mPaint.setColor(Color.BLUE);
        mPaint.setStyle(Paint.Style.FILL);
        mPaint.setAntiAlias(true);
        mPaint.setTextSize(32);
        canvas.drawText("Лужайка только для котов", 30, 100, mPaint);//text,x,y
```

### Текст под углом

```java
        int x = 80;
        int y = 80;

        mPaint.setColor(Color.GRAY);
        mPaint.setTextSize(27);
        String str2rotate = "Лучик солнца!";

        // Создаем ограничивающий прямоугольник для наклонного текста
        // поворачиваем холст по центру текста
        canvas.rotate(45, x + mRect.exactCenterX(), y + mRect.exactCenterY());

        // Рисуем текст
        mPaint.setStyle(Paint.Style.FILL);
        canvas.drawText(str2rotate, x, y, mPaint);

        // восстанавливаем холст
        canvas.restore();
```

### Выводим изображение

```java
       canvas.drawBitmap(mBitmap, 450, 530, mPaint);
```

### Круг

```java
sun.xml

<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:dither="true"
    android:shape="oval" >

    <gradient
        android:endColor="#ffff6600"
        android:gradientRadius="150"
        android:startColor="#ffffcc00"
        android:type="radial"
        android:useLevel="false" />

    <size
        android:height="150dp"
        android:width="150dp" />

</shape>

Activity_main.xml

    <ImageView
        android:id="@+id/sun"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_centerHorizontal="true"
        android:contentDescription="@string/sun"
        android:scaleType="fitCenter"
        android:src="@drawable/sun" />
```

### Градиент фона

```java
grass.xml

<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:dither="true"
    android:shape="rectangle" >

    <gradient
        android:angle="90"
        android:endColor="#ff003300"
        android:startColor="#ff009900" />
</shape>

activity_main.xml

    <ImageView
        android:id="@+id/grass"
        android:layout_width="fill_parent"
        android:layout_height="150dp"
        android:layout_alignParentBottom="true"
        android:contentDescription="@string/grass"
        android:src="@drawable/grass" />
```

### Анимация

```java
res/anim/sun_rise.xml

<?xml version="1.0" encoding="utf-8"?>
<set xmlns:android="http://schemas.android.com/apk/res/android"
<!--секунды-->
    android:duration="5000"
<!--останов анимации-->
    android:fillAfter="true"
<!--ускорение-->
    android:interpolator="@android:anim/accelerate_decelerate_interpolator"
    android:shareInterpolator="false" >

<!--увеличение в 1,5 раза-->
    <scale
        android:fromXScale="1.0"
        android:fromYScale="1.0"
        android:pivotX="50%"
        android:pivotY="50%"
        android:toXScale="1.5"
        android:toYScale="1.5" />

<!--вертикально вверх, от родительского элемента(р)-->
    <translate
        android:fromYDelta="80%p"
        android:toYDelta="10%p" />

<!--поворот 720 градусов по часовой-->
    <rotate
        android:fromDegrees="0"
        android:pivotX="50%"
        android:pivotY="50%"
        android:toDegrees="720" />

<!--прозрачность-->
    <alpha
        android:fromAlpha="0.3"
        android:toAlpha="1.0" />
</set>


MainActivity.java

		// Получим ссылку на солнце
		ImageView sun = (ImageView) findViewById(R.id.sun);
		// Анимация для восхода солнца
		Animation sunRise = AnimationUtils.loadAnimation(this, R.anim.sun_rise);
		// Подключаем нужную анимацию к нужному View
		sun.startAnimation(sunRise);
```

## программная клавиатура

### как сдвигать активность при появлении клавиатуры

```java

<activity
    android:name=".CatsActivity"
    android:label="@string/app_name"
    android:windowSoftInputMode="adjustPan" >
</activity>

    stateUnspecified - настройка по умолчанию. Система сама выбирает подходящее поведение клавиатуры.
    stateUnchanged - клавиатура сохраняет своё последнее состояние (видимое или невидимое), когда активность с текстовым полем получает фокус.
    stateHidden - клавиатура скрыта, когда открывается активность. Клавиатура появится при наборе текста. Если пользователь переключится на другую активность, то клавиатура будут скрыта, но при возвращении назад клавиатура останется на экране, если она была видима при закрытии активности.
    stateAlwaysHidden - клавиатура всегда скрывается, если активность получает фокус.
    stateVisible - клавиатура видима.
    stateAlwaysVisible - клавиатура становится видимой, когда пользователь открывает активность.
    adjustResize - размеры компонентов в окне активности могут изменяться, чтобы освободить место для экранной клавиатуры.
    adjustPan - окно активности и его компоненты не изменяются, а сдвигаются таким образом, чтобы текстовое поле с фокусом не было закрыто клавиатурой.
    adjustUnspecified - настройка по умолчанию. Система сама выбирает нужный режим.

```

### два способа скрыть клавиатуру для edittext

```java
    public void onButton1Click(View view){
//        InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
//        imm.hideSoftInputFromWindow(view.getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
        InputMethodManager inputMethodManager = (InputMethodManager)  getApplicationContext().getSystemService(Activity.INPUT_METHOD_SERVICE);
        inputMethodManager.hideSoftInputFromWindow(view.getWindowToken(), 0);
    }
```

### установить фокус и показать клавиатуру

```java
        View view = inflater.inflate(R.layout.fragment_edit_name, container);
        editText = (EditText) view.findViewById(R.id.txt_yourName);
 
        // Request focus and show soft keyboard automatically
        editText.requestFocus();
        getDialog().getWindow().setSoftInputMode(LayoutParams.SOFT_INPUT_STATE_VISIBLE);
```

### изменить вид кнопки ввод

```java
в файле Layout Activity_main.xml
    <EditText
        android:id="@+id/editSearch"
        android:layout_width="fill_parent"
        android:layout_height="wrap_content"
        android:imeOptions="actionSearch"
        android:singleLine="true" />
/*
    actionUnspecified: Используется по умолчанию. Система сама выбирает нужный вид кнопки (IME_NULL)
    actionGo: Выводит надпись Go. Действует как клавиша Enter при наборе адреса в адресной строке браузера (IME_ACTION_GO)
    actionSearch: Выводит значок поиска (IME_ACTION_SEARCH)
    actionSend: Выводит надпись Send (IME_ACTION_SEND)
    actionNext: Выводит надпись Next (IME_ACTION_NEXT)
    actionDone: Выводи надпись Done (IME_ACTION_DONE)
*/

public class MainActivity extends ActionBarActivity implements TextView.OnEditorActionListener{

    public EditText editSearch;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Добавляем слушателя к компонентам
        editSearch = (EditText) findViewById(R.id.editSearch);
        editSearch.setOnEditorActionListener(MainActivity.this);
    }

    @Override
    public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
        if (actionId == EditorInfo.IME_ACTION_SEARCH) {
            // обрабатываем нажатие кнопки поиска
            return true;
        }
        if (actionId == EditorInfo.IME_ACTION_GO) {
            // обрабатываем нажатие кнопки GO
            return true;
        }
        return false;
    }

```

### сменить тип клавиатуры

```java

EditText ipt = new EditText(this);
ipt.setInputType(InputType.TYPE_CLASS_PHONE);  //установит клавиатуру для ввода номера телефона
// TYPE_CLASS_DATETIME - дата и время
// TYPE_CLASS_NUMBER - цифры
// TYPE_CLASS_TEXT - буквы
```

## Нажатия клавиш

### Коды клавиш

```java
int KeyCode = 
KeyEvent.KEYCODE_MENU
KeyEvent.KEYCODE_SEARCH
KeyEvent.KEYCODE_BACK
KeyEvent.KEYCODE_VOLUME_UP
KeyEvent.KEYCODE_VOLUME_DOWN //для кнопки громкости возвращаем false, т.е. мы не переопределяем поведение кнопки, а оставляем её на усмотрение системы.
```

### Перехват произвольной клавиши

```java
@Override
public boolean onKeyDown(int keyCode, KeyEvent event) {
    // Обработайте нажатие, верните true, если обработка выполнена
    return false;
}

@Override
public boolean onKeyUp(int keyCode, KeyEvent event) {
    // Обработайте отпускание клавиши, верните true, если обработка выполнена
  return false;
}
```

### Перехват клавиши возврат

```java
    @Override
    public void onBackPressed() {
//        super.onBackPressed();
        openQuitDialog();
    }

```

### Перехват клавиши возврат для 2.0

```java
@Override  
public boolean onKeyDown(int keyCode, KeyEvent event)  
{  
    //replaces the default 'Back' button action  
    if(keyCode == KeyEvent.KEYCODE_BACK)  
    {  
        // ваш код
    }  
    return true;  
}
```

### Перехват двойного нажатия клавиши возврат

```java
private static long back_pressed;

@Override
public void onBackPressed() {
	if (back_pressed + 2000 > System.currentTimeMillis())
		super.onBackPressed();
	else
		Toast.makeText(getBaseContext(), "Press once again to exit!",
				Toast.LENGTH_SHORT).show();
	back_pressed = System.currentTimeMillis();
}
```

### Нажатие клавиши Меню

```java
//onKeyLongPress для длинного нажатия, работает через раз вместе с перехватом короткого нажатия

@Override
public boolean onKeyDown(int keyCode, KeyEvent event) {
    if (keyCode == KeyEvent.KEYCODE_MENU) {
        event.startTracking();
        etext.setText("Key Down"); //вывожу текст в текстовом поле
        return true;
    }
    return super.onKeyDown(keyCode, event);
}
```

## Диалоговые окна

### Окно подтверждения выхода

```java
    private void openQuitDialog() {
        AlertDialog.Builder quitDialog = new AlertDialog.Builder(MainActivity.this);
        quitDialog.setTitle("Выход: Вы уверены?");

        quitDialog.setPositiveButton("Таки да!", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                // TODO Auto-generated method stub
                finish();
            }
        });

        quitDialog.setNegativeButton("Нет", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                // TODO Auto-generated method stub
            }
        });

        quitDialog.show();
    }
```

## Язык и локализация

### игнорировать недостающие строки при локализации

```java
res | Strings.xml
<resources xmlns:tools="http://schemas.android.com/tools" tools:ignore="MissingTranslation">
```

## Файлы

### Чтение из файла-ресурса

```java
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_web);

        WebView webView = (WebView) findViewById(R.id.webView);

        Intent intent = getIntent();
        //получаем строку и формируем имя ресурса
        String resName = "n" + intent.getIntExtra("head", 0);
        Log.i("name", resName);
        Context context = getBaseContext(); //получаем контекст

        //читаем текстовый файл из ресурсов по имени
        String text = readRawTextFile(context, getResources().getIdentifier(resName, "raw", context.getPackageName()));

        webView.loadDataWithBaseURL(null, text, "text/html", "en_US", null);
    }

//читаем текст из raw-ресурсов
    public static String readRawTextFile(Context context, int resId)
    {
        InputStream inputStream = context.getResources().openRawResource(resId);

        InputStreamReader inputReader = new InputStreamReader(inputStream);
        BufferedReader buffReader = new BufferedReader(inputReader);
        String line;
        StringBuilder builder = new StringBuilder();

        try {
            while (( line = buffReader.readLine()) != null) {
                builder.append(line);
                builder.append("\n
");
            }
        } catch (IOException e) {
            return null;
        }
        return builder.toString();
    }
```

### новый текстовый ресурс для языка

```java
res | New | Directory | Language | values+russian

| values+ru | new | resource file | Strings.xml

<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Локализованное приложение</string>
    <string name="hello_world">Здравствуй, Мир!</string>
</resources>
```

## Камера

### Получение изображения

```java
    public final int CAMERA_RESULT = 0;
    public ImageView ivCamera;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ivCamera = (ImageView) findViewById(R.id.imageView);
    }

public void onClickCam(View view){
    Intent cameraIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
    startActivityForResult(cameraIntent, CAMERA_RESULT);
}

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == CAMERA_RESULT) {
            Bitmap thumbnail = (Bitmap) data.getExtras().get("data");
            ivCamera.setImageBitmap(thumbnail);
        }
    }

```

### проверка наличия камеры

```java
public static boolean isIntentAvailable(Context context, String action) {
    final PackageManager packageManager = context.getPackageManager();
    final Intent intent = new Intent(action);
    List<ResolveInfo> list =
            packageManager.queryIntentActivities(intent, PackageManager.MATCH_DEFAULT_ONLY);
    return list.size() > 0;
}
```

## Редактирование виджетов 9patch

http://developer.alexanderklimov.ru/android/theory/draw9patch.php
