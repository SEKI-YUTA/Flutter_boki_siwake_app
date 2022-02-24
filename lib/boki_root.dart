import 'dart:ffi';

import 'package:boki_siwake_app/siwake_row.dart';
import 'package:boki_siwake_app/appDataSet.dart';
import 'package:flutter/material.dart';

class BokiRoot extends StatefulWidget {
  const BokiRoot({Key? key}) : super(key: key);

  @override
  _BokiRootState createState() => _BokiRootState();
}

class _BokiRootState extends State<BokiRoot> {
  List<List<TextEditingController>> _controllerList = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ],
  ];
  bool _isAnswered = false;
  bool _isWrong = false;
  int _currentQuestionIndex = 0;

  void _answer() {
    List<String> karikataKanjou =
        DataSet.questions[_currentQuestionIndex]["siwake"]["karikataKanjou"];
    List<String> kasikataKanjou =
        DataSet.questions[_currentQuestionIndex]["siwake"]["kasikataKanjou"];
    List<int> karikataKingaku =
        DataSet.questions[_currentQuestionIndex]["siwake"]["karikataKingaku"];
    List<int> kasikataKingaku =
        DataSet.questions[_currentQuestionIndex]["siwake"]["kasikataKingaku"];
    int karikataSum = karikataKingaku.reduce((acc, element) {
      return acc + element;
    });
    int kasikataSum = kasikataKingaku.reduce((acc, element) {
      return acc + element;
    });
    print('借方合計:${karikataSum}');
    print('貸方合計:${kasikataSum}');
    if (karikataSum != kasikataSum) return; // wrong because not match sum
    for (int i = 0; i < _controllerList.length; i++) {
      karikataKanjou.remove(_controllerList[i][0].text);
      kasikataKanjou.remove(_controllerList[i][2].text);
      if (_controllerList[i][1].text != "") {
        karikataKingaku.remove(int.parse(_controllerList[i][1].text));
      }
      if (_controllerList[i][3].text != "") {
        kasikataKingaku.remove(int.parse(_controllerList[i][3].text));
      }
    }
    if (kasikataKingaku.length +
            karikataKanjou.length +
            karikataKingaku.length +
            kasikataKingaku.length ==
        0) {
      setState(() {
        _isWrong = false;
        _isAnswered = true;
      });
    } else {
      setState(() {
        _isWrong = true;
        _isAnswered = true;
      });
    }
  }

  void _prevQuestion() {
    if (_currentQuestionIndex == 0) return;
    resetInput();
    setState(() {
      _isAnswered = false;
      _isWrong = false;
      _currentQuestionIndex--;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex + 1 == DataSet.questions.length) return;
    resetInput();
    setState(() {
      _isAnswered = false;
      _isWrong = false;
      _currentQuestionIndex++;
    });
  }

  void resetInput() {
    for (int i = 0; i < _controllerList.length; i++) {
      for (int j = 0; j < _controllerList[i].length; j++) {
        _controllerList[i][j].text = "";
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('簿記学習アプリ'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '仕訳問題',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              _isAnswered
                  ? _isWrong
                      ? Text(
                          '不正解',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        )
                      : Text(
                          "正解",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              Text(
                DataSet.questions[_currentQuestionIndex]["question"],
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              // Siwake Card
              SiwakeRow.siwakeHeader,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black)),
                child: Column(
                  children: [
                    SiwakeRow(
                      controllers: _controllerList[0],
                    ),
                    SiwakeRow(
                      controllers: _controllerList[1],
                    ),
                    SiwakeRow(
                      controllers: _controllerList[2],
                    ),
                    SiwakeRow(
                      controllers: _controllerList[3],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: _isAnswered ? _prevQuestion : null,
                      child: Text('前の問題へ')),
                  ElevatedButton(
                      onPressed: _isAnswered ? null : _answer,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color?>(Colors.red),
                      ),
                      child: const Text(
                        '回答',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  ElevatedButton(
                      onPressed: _isAnswered ? _nextQuestion : null,
                      child: Text('前の問題へ')),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ExpansionTile(
                title: Text(
                  'ヒントを見る',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                          DataSet.questions[_currentQuestionIndex]["hint"]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
