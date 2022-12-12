import 'package:asincronia_flutter/service/mockapi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var val1 = 0;
  var val2 = 0;
  var val3 = 0;
  int widthPositivo = 0;
  int timePositivo = 0;
  int getPositivo = 0;
  int widthHome = 0;
  int timeHome = 0;
  int getHome = 0;
  int widthNegativo = 0;
  int timeNegativo = 0;
  int getNegativo = 0;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Ink(
                   decoration: const ShapeDecoration(
                      color: Colors.green,
                      shape: CircleBorder()
                      ),
                  child: IconButton(
                    iconSize: 80,
                    onPressed: () async {
                      setState(() {
                        widthPositivo = 300;
                        timePositivo = 1;
                      });
                      getPositivo = await MockApi().getFerrariInteger();
                      setState(() {
                        widthPositivo = 0;
                        timePositivo = 0;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
              getAnimation(
                width: widthPositivo,
                time: timePositivo,
                getData: getPositivo,
                color: Colors.green,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Ink(
                   decoration: const ShapeDecoration(
                      color: Colors.yellow,
                      shape: CircleBorder()
                      ),
                  child: IconButton(
                    iconSize: 80,
                    onPressed: () async {
                      setState(() {
                        widthHome = 300;
                        timeHome = 3;
                      });
                      getHome = await MockApi().getHyundaiInteger();
                      setState(() {
                        widthHome = 0;
                        timeHome = 0;
                      });
                    },
                    icon: const Icon(Icons.car_crash),
                  ),
                ),
              ),
              getAnimation(
                width: widthHome,
                time: timeHome,
                getData: getHome,
                color: Colors.yellow,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Ink(
                    decoration: const ShapeDecoration(
                          color: Colors.red,
                          shape: CircleBorder()
                          ),
                  child: IconButton(
                    iconSize: 80,
                    onPressed: () async {
                      setState(() {
                        widthNegativo = 300;
                        timeNegativo = 10;
                      });
                      getNegativo = await MockApi().getFisherPriceInteger();
                      setState(() {
                        widthNegativo = 0;
                        timeNegativo = 0;
                      });
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                ),
              ),
              getAnimation(
                width: widthNegativo,
                time: timeNegativo,
                getData: getNegativo,
                color: Colors.red,
              ),
            ],
          ),
        ));
  }
}

Widget getAnimation({
  required int width,
  required int time,
  required int getData,
  required Color color,
}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: AnimatedContainer(
          width: width.toDouble(),
          height: 20,
          duration: Duration(
            seconds: time,
          ),
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
      Text(getData.toString(),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ))
    ],
  );
}
