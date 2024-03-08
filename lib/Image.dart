import 'package:flutter/material.dart';
import 'package:testapp/ClickableImage.dart';
import 'package:testapp/ListImages.dart';


class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {

  List<String> routes = [
    'assets/gatos/90.jpeg',
    'assets/gatos/enojado.jpg'
  ];

  List<String> description = [
    'gato1',
    'gato2',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void doSomething() {
    print("Me has tocado gilipollas");
  }

  @override
  Widget build(BuildContext context) {
    return ListImages(routes: routes, description: description);
  }
}
