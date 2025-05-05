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
    return Column(
      children:
          <Widget>[
                ElevatedButton(
                  child: const Text("normal"),
                  onPressed: () => {},
                ),
                OutlinedButton(
                  child: const Text("normal"),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () => {},
                ),
                TextButton(child: const Text("Submit"), onPressed: () => {}),
                ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text("发送"),
                  onPressed: _onPressed,
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("添加"),
                  onPressed: _onPressed,
                ),
                TextButton.icon(
                  icon: const Icon(Icons.info),
                  label: const Text("详情"),
                  onPressed: _onPressed,
                ),
              ]
              .map(
                (e) =>
                    Padding(child: e, padding: const EdgeInsets.only(top: 20)),
              )
              .toList(),
    );
  }

  void _onPressed() {
    print("button pressed");
  }
}
