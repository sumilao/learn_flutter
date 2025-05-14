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
  final bool padding;
  final bool showLog;

  const Page(
    this.title,
    this.widget, {
    this.withScaffold = true,
    this.padding = true,
    this.showLog = true,
  });

  void openPage(BuildContext context) {
    // if (withScaffold) {
    if (true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  Scaffold(appBar: AppBar(title: Text(title)), body: widget),
        ),
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    }
  }
}

// class Page {
//   Page(
//     this.title,
//     Widget child, {
//     this.withScaffold = true,
//     this.padding = true,
//     this.showLog = true,
//   }) : builder = ((_) => child);

//   Page.builder(
//     this.title,
//     this.builder, {
//     this.withScaffold = true,
//     this.padding = true,
//     this.showLog = true,
//   });

//   String title;
//   WidgetBuilder builder;
//   bool withScaffold;
//   bool padding;
//   bool showLog;

//   Future<T?> openPage<T>(BuildContext context) {
//     return Navigator.push<T>(
//       context,
//       MaterialPageRoute(
//         builder: (context) {
//           Widget widget = builder(context);
//           if (withScaffold) {
//             widget = PageScaffold(
//               title: title,
//               padding: padding,
//               showLog: showLog,
//               body: widget,
//             );
//           } else if (showLog) {
//             widget = VerticalLogPanel(child: widget);
//           }
//           return LogListenerScope(
//             child: widget,
//             logEmitter: logEmitter,
//           );
//         },
//       ),
//     );
//   }

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
              Page("计数器", const CounterRoute(), withScaffold: false),
              Page("context", const ContextRoute()),
              Page(
                "Stateless",
                const Echo(text: "hello world", backgroundColor: Colors.blue),
              ),
              Page("State生命周期", const StateLifecycleTest()),
              Page(
                "子树中获取State对象",
                const GetStateObjectRoute(),
                withScaffold: false,
              ),
              Page(
                "Cupertino Demo",
                const CupertinoTestRoute(),
                withScaffold: false,
              ),
              Page("状态管理", const StateManageDemo()),
              Page("路由传值", const RouterTestRoute()),
            ]),
          ),
          ExpansionTile(
            title: const Text("基础组件"),
            children: _generateItem(context, [
              // PageInfo("Context测试",  ContextRoute(), withScaffold: false),
              // PageInfo("Widget树中获取State对象",  RetrieveStateRoute(), withScaffold: false),
              Page("文本、字体样式", const TextRoute()),
              Page("按钮", const ButtonRoute()),
              Page("图片伸缩", const ImageAndIconRoute()),
              Page("ICON fonts", const IconFontsRoute()),
              Page("单选开关和复选框", const SwitchAndCheckBoxRoute()),
              Page("输入框", const FocusTestRoute(), showLog: false),
              Page("Form", const FormTestRoute(), showLog: false),
              Page("进度条", const ProgressRoute()),
            ]),
          ),
        ],
      ),
    );
  }
}
