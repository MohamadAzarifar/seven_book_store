import 'package:flutter/material.dart';

class UIScaffold extends StatelessWidget {
  const UIScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body),
    );
  }
}
