import 'package:flutter/material.dart';

class Receipt extends StatelessWidget {
  const Receipt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Text('Ini Receipt'),
      color: Colors.red,
    );
  }
}
