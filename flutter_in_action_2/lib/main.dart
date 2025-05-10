import 'package:flutter/material.dart';
import 'routes.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
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
  List<Widget> _generateItem(BuildContext context, List<Page<Object?>> children) {
    return children.map<Widget>((page) {
      return ListTile(
        // title: Text(page.title),
        trailing: const Icon(Icons.keyboard_arrow_right),
        // onTap: () => page.openPage(context),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter实战'),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: const Text("第一个Flutter应用"),
            children: _generateItem(context, [
              // Page("计数器", const CounterRoute(), withScaffold: false),
        MaterialPage<void>(
          key: const ValueKey<String>('路由传值'),
          child: const RouterTestRoute(),
        ),
              // MaterialPage<void>("路由传值", const RouterTestRoute()),
              // Page("State生命周期", const StateLifecycleTest()),
              // Page(
              //   "子树中获取State对象",
              //   const GetStateObjectRoute(),
              //   withScaffold: false,
              // ),
              // Page(
              //   "Cupertino Demo",
              //   const CupertinoTestRoute(),
              //   withScaffold: false,
              // ),
            ]),
          ),
        ],
      ),
    );
  }
}
