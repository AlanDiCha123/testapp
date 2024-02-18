import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({super.key, required this.home});

  final Function home;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController textEditingController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveName() async{
    final SharedPreferences prefs = await _prefs;
    if (_prefs != Null){
      prefs.setString('name', textEditingController.text);
      setState(() {
        textEditingController.text = '';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 250,
            child: TextField(
              onSubmitted: (value){
                saveName();
                widget.home(0);
              },
              controller: textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
          ),
          const SizedBox(height: 80,),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: (){
                saveName();
                widget.home(0);
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
