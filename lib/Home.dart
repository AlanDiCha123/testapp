import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String username = '';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> getName() async{
    final SharedPreferences preferences = await _prefs;
    if (preferences != Null){
      setState(() {
        username = (preferences.getString('name') ?? '');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getName();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
