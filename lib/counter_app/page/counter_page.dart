import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // obtain the provider
    final counter = Provider.of<CounterProvider>(context);

    // getting the value from the provider instance
    final count = counter.count;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App Provider'),
      ),
      body: Center(
        child: Text(
          'Count is $count',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
