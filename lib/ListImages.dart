import 'package:flutter/material.dart';


class ListImages extends StatefulWidget {
  const ListImages({
    super.key,
    required this.routes,
    required this.description
  });

  final List<String> routes;
  final List<String> description;

  @override
  State<ListImages> createState() => _ListImagesState();
}

class _ListImagesState extends State<ListImages> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createWidget();
  }


  List<Widget> TheWidgets = [];

  void createWidget()  {
    for (int i = 0; i < widget.routes.length; i++){
      TheWidgets.add(
          Column(
            children: [
              Image.asset(widget.routes[i]),
              Text(widget.description[i]),
            ],
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: TheWidgets,
    );
  }
}
