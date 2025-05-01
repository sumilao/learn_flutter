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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Text("Hello world", textAlign: TextAlign.left),
          Text(
            "Hello world! I'm Jack. " * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Text("Hello world", textScaler: TextScaler.linear(1.5)),
          Text(
            "Hello world " * 6, //字符串重复六次
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello world",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: const TextStyle(color: Colors.blue),
                ),
                // recognizer: _tapRecognizer),
              ],
            ),
          ),
          DefaultTextStyle(
            //1.设置文本默认样式
            style: const TextStyle(color: Colors.red, fontSize: 20.0),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text(
                  "I am Jack",
                  style: TextStyle(
                    inherit: false, //2.不继承默认样式
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
