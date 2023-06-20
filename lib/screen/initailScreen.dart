import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gitman",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
