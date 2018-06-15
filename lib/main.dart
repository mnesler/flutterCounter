import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SpellCounter',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'SpellCounters'),
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
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 40;

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
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
  void _resetCounter() {
    setState(() {
      _counter = 40;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.


    Widget buttonSection = new Container(
      child: new Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Expanded(
            child:  new FlatButton(
              child: new Text("-"),
              highlightColor: Colors.redAccent,
              color:  Colors.red,
              onPressed: _decrementCounter,
            ),
            flex: 3,
          ),
                new Expanded(
                  child:  new RaisedButton(
                    child: new Text("+"),
                    highlightColor: Colors.green,
                    color:  Colors.teal,
                    onPressed: _incrementCounter,
                  ),
                  flex: 3,
                ),
        ],
    )
    );
    Widget counterView = new Container(
        child: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                //  new Icon(Icons.favorite),
                  new Text(
                      '$_counter',
                      style: new TextStyle(
                          fontSize:100.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  buttonSection
                ]
            )
        )
    );

    Widget counterListView = new Container(
      margin: new EdgeInsets.symmetric(vertical: 20.0),
     // height: 200.0,
        child: new ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              counterView,
  
            ]
        )
    );


    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.white,

      ),
      body: new Center(
        child: counterListView,


      ),


      floatingActionButton: new FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reset',
        child: new Icon(Icons.refresh),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}
