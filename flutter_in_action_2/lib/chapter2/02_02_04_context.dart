import 'package:flutter/material.dart';

class ContextRoute extends StatelessWidget {
  const ContextRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Context测试")),
      body: Container(
        child: Builder(
          builder: (context) {
            Scaffold? scaffold =
                context.findAncestorWidgetOfExactType<Scaffold>();
            return (scaffold?.appBar as AppBar?)?.title ?? SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
