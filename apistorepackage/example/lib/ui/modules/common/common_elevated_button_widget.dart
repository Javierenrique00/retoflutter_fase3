import 'package:flutter/material.dart';

class CommonElevatedButtonWidget extends StatefulWidget {
  final Function () onPressed;
  const CommonElevatedButtonWidget({required this.text, required this.onPressed, super.key});
  final String text;

  @override
  State<CommonElevatedButtonWidget> createState() => _CommonElevatedButtonWidgetState();
}

class _CommonElevatedButtonWidgetState extends State<CommonElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return ElevatedButton(
      style: style,
      onPressed: ()=>widget.onPressed(),
      child: Text(widget.text),
    );
  }
}