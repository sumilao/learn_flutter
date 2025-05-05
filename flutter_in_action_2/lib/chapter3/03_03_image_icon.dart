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
    var img = const AssetImage("imgs/avatar.png");
    return SingleChildScrollView(
      child: Column(
        children:
            <Image>[
              Image(image: AssetImage("imgs/avatar.png"), width: 100.0),
              Image.asset("imgs/avatar.png", width: 100.0),
              Image(
                image: NetworkImage(
                  "https://avatars.githubusercontent.com/u/14101776?v=4",
                ),
                width: 100.0,
              ),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
              ),
              Image(image: img, height: 50.0, width: 100.0, fit: BoxFit.fill),
              Image(image: img, height: 50, width: 50.0, fit: BoxFit.contain),
              Image(image: img, width: 100.0, height: 50.0, fit: BoxFit.cover),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.scaleDown,
              ),
              Image(image: img, height: 50.0, width: 100.0, fit: BoxFit.none),
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              ),
            ].map((e) {
              return Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(width: 100, child: e),
                  ),
                  Text(e.fit.toString()),
                ],
              );
            }).toList(),
      ),
    );
  }
}
