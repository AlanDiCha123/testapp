
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String username = '';


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Text>[
          const Text('Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30
            ),
          ),
          Text(username,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 30
            ),
          ),
        ],
      ),
    );
  }
}
