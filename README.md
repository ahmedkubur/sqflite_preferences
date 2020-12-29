#  sqflite_preferences

sqflite preferences is an approach to simulate the sharedpreferences behaveir through sqflite library

https://github.com/ahmedkubur/dbHelper

## Usage
How to use

``` dart

//import the library first
import 'package:sqflite_preferences/sqflite_preferences.dart';
//reference to our single class that manages the database
final sqflitePreferences = DatabaseHelper.instance;

```

to initiate your database
``` dart

 initDatabase() async {
dbHelper.initDatabase('phoneNumber', 'INTEGER');
 }

```
to add new or update bool value by key and value
``` dart
setBoolValue()async{
   await dbHelper.setBool('flag',true);
}

```
to get bool value by key
``` dart

bool boolValue;
getBoolValue() async {
     boolValue = await dbHelper.getBool('flag');
}

```
to add new or update int value by key and value
``` dart

setIntValue()async{
   await dbHelper.setInt('number',1);
}

```
to get int value by key
``` dart

int intValue;
getIntValue()async{
     intValue = await dbHelper.getInt('number');
}

```
to add new or update real value by key and value
``` dart

setIntValue()async{
   await dbHelper.setReal('real',1.555);
}

```
to get real by key
``` dart

int intValue;
getIntValue()async{
     intValue = await dbHelper.getReal('real');
}

```
to add new or update blob value by key and value
``` dart

dynamic response = await get(url);
dynamic bytesFromPict = response.image.bodyBytes;
setBlobValue() async {
  await dbHelper.setBlob('pic',bytesFromPic);
}

```
to get blob value by key
``` dart

dynamic blobValue;
getBlobValue() async {
     blobValue = await dbHelper.getBlob('pic');
}
// Example : Image.memory(blobValue), 

```
to add new or update String value by key and value
``` dart

setStringValue() async {
  await dbHelper.setString('name','someone name');
}

```

to get String value by key
``` dart

String stringValue;
getStringValue() async {
     stringValue = await dbHelper.getString('name');
}

```

to get the number of raws by key
``` dart

rowCount() async {
   await dbHelper.queryRowCount('name');
}

```

to delete a saved data permenatly by key
``` dart

deleteValue() async {
   await dbHelper.delete('name');
}

```

### Example

``` dart
import 'package:dbhelper/dbHelper.dart';
import 'package:flutter/material.dart';

var dbHelper = DatabaseHelper.instance;
var value;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var textValue;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50),
              child: TextField(
                onChanged: (value) async {
                  textValue = value;
                  await dbHelper.setString('value', textValue);
                },
              ),
            ),
            RaisedButton(
              child: Text("Get Value"),
              onPressed: () async {
                value = await dbHelper.getString('value');
              },
            ),
            RaisedButton(
              child: Text("Go to next page"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext ctx) {
                        return Page2();
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text(widget.title),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(30),
              width: width,
              child: FittedBox(
                child: Text(
                  "$value",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```

## Developed and coded by Ahmed Ismail Kubur - A.I Kubur :)

### Feel free to buy me a cup of coffe BTC Wallet (1LQifVDjgqVTyjZJwixmqEaUk6RyDy7fed) .
