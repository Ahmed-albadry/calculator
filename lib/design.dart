// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  final String txt;
  final Function call;
  final Color color;
  Design(this.txt, this.call, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black,
              width: 5,
            )),
        child: ElevatedButton(
          child: Text(
            txt,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          onPressed: () => call(txt),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        ));
  }
}
