import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider_app/hello_world/provider/hello_provider.dart';
import 'package:provider/provider.dart';

class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    // obtain the hello provider
    final hello = Provider.of<HelloProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            hello.text,
            style: const TextStyle(
              fontSize: 20
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              hello.hello();
            },
            child: Text('Click Me!'),
          ),
        ],
      )),
    );
  }
}
