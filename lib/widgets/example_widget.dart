import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 10,spreadRadius: 1,color: Colors.black.withOpacity(0.7),)],borderRadius: BorderRadius.circular(20)),
    );
  }
}
