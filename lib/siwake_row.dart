import 'package:flutter/material.dart';

class SiwakeRow extends StatelessWidget {
  late List<TextEditingController> controllers;
  SiwakeRow({Key? key, required List<TextEditingController> this.controllers})
      : super(key: key);

  static Widget siwakeHeader = Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text('勘定名'),
      Text('金額'),
      Text('勘定名'),
      Text('金額'),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
                child: Container(
              child: TextField(
                controller: controllers[0],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.black12),
                  )),
            )),
            Flexible(
                child: Container(
              child: TextField(
                controller: controllers[1],
                keyboardType: TextInputType.number,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.black12),
                  )),
            )),
            Flexible(
                child: Container(
              child: TextField(
                controller: controllers[2],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.black12),
                  )),
            )),
            Flexible(
                child: Container(
              child: TextField(
                controller: controllers[3],
                keyboardType: TextInputType.number,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.black12),
                  )),
            )),
          ],
        ),
      ],
    );
  }
}
