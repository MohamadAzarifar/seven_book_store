import 'package:flutter/material.dart';

class UIScaffold extends StatelessWidget {
  const UIScaffold({super.key, required this.body, this.appBar});

  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SafeArea(child: body),
    );
  }
}
