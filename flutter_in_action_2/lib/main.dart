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

// 定义 Page 类
class Page {
  final String title;
  final Widget widget;
  final bool withScaffold;

  const Page(this.title, this.widget, {this.withScaffold = true});

  void openPage(BuildContext context) {
    if (withScaffold) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: widget,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _generateItem(BuildContext context, List<Page> children) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () => page.openPage(context),
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
              Page("路由传值", const RouterTestRoute()),
              // Page("State生命周期", const StateLifecycleTest()),
              // Page("子树中获取State对象", const GetStateObjectRoute(),
              // withScaffold: false),
              // Page("Cupertino Demo", const CupertinoTestRoute(),
              // withScaffold: false),
            ]),
          ),
        ],
      ),
    );
  }
}
