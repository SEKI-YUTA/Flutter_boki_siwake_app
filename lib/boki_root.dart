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
  bool _isAnswered = false;
  int _currentQuestionIndex = 0;
  void _answer() {
    setState(() {
      _isAnswered = true;
    });
  }

  void _prevQuestion() {
    if (_currentQuestionIndex == 0) return;
    setState(() {
      _isAnswered = false;
      _currentQuestionIndex--;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex + 1 == DataSet.questions.length) return;
    setState(() {
      _isAnswered = false;
      _currentQuestionIndex++;
    });
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
                    SiwakeRow(),
                    SiwakeRow(),
                    SiwakeRow(),
                    SiwakeRow(),
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
                      onPressed: _answer,
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
                  Text(DataSet.questions[_currentQuestionIndex]["hint"])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
