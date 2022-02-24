import 'package:flutter/material.dart';

class SiwakeRow extends StatelessWidget {
  SiwakeRow({
    Key? key,
  }) : super(key: key);

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
              child: TextField(),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.black12),
                  )),
            )),
            Flexible(
                child: Container(
              child: TextField(),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.black12),
                  )),
            )),
            Flexible(
                child: Container(
              child: TextField(),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.black12),
                  )),
            )),
            Flexible(
                child: Container(
              child: TextField(),
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
