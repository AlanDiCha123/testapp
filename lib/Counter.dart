import 'package:flutter/material.dart';


class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed this button this many times:'),
          Text('$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 160,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <FloatingActionButton>[
              FloatingActionButton(
                onPressed: _incrementCounter,
                backgroundColor: Colors.deepOrange,
                child: const Icon(Icons.plus_one),
              ),
              FloatingActionButton(
                onPressed: _decrementCounter,
                backgroundColor: Colors.deepOrange,
                child: const Icon(Icons.exposure_minus_1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
