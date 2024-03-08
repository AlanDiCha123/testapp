import 'package:flutter/material.dart';


class ClickableImage extends StatefulWidget {
  const ClickableImage({
    super.key,
    required this.width,
    required this.height,
    required this.source,
    required this.function,
  });

  final double width;
  final double height;
  final String source;
  final void Function() function;

  @override
  State<ClickableImage> createState() => _ClickableImageState();
}

class _ClickableImageState extends State<ClickableImage> {

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () { widget.function(); },
      minWidth: widget.width,
      height: widget.height,
      child: widget.source.startsWith('http') ? Image.network(widget.source) : Image.asset(widget.source),
    );
  }
}
