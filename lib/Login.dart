import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  void doNothing() => {

  };


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username'
              ),
            ),
          ),
          const SizedBox(height: 80,),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () { print('Hlo'); },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
