import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:test_screen_test/models/question.dart';
import 'package:http/http.dart' as http;

// screen chinh
class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  void fetchQuestion() async {
    final response = await http
        .get(Uri.parse('https://6257832474007111adf84367.mockapi.io/cauhoi/1'));
    if (response.statusCode == 200) {
      setState(() {
        question = Question.fromJson(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load question');
    }
  }

  String answer = '';
  final isCheckbox = false;
  Question? question;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchQuestion();
  }

  void changeRadioAnswer(String value) {
    setState(() {
      answer = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Bài 20: Đề thi cuối khóa',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) {
                    return QuestionsList();
                  });
            },
            icon: const ImageIcon(
              AssetImage('assets/icons/List.png'),
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        color: Color.fromRGBO(242, 243, 247, 1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const LinearProgressIndicator(
            value: 0.3,
            backgroundColor: Color.fromRGBO(222, 240, 254, 1),
          ),
          Container(
            color: Colors.white,
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Đã hoàn thành: 3/10',
                    style:
                        TextStyle(fontFamily: 'SF Pro Display', fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 12,
                        child: ImageIcon(AssetImage('assets/icons/Clock.png'))),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Text(
                        '00:59:00',
                        style: TextStyle(
                            fontSize: 12, fontFamily: 'SF Pro Display'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Câu hỏi 5',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              question != null
                  ? Text(
                      question!.question,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Display', fontSize: 14),
                    )
                  : const Center(
                      child: Text('Loading question...'),
                    ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 32),
            child: question != null
                ? Column(
                    children: isCheckbox
                        ? [
                            CheckboxTile(
                                answer:
                                    'Run the Delegation of Control Wizard on the Domain 1'),
                            CheckboxTile(
                                answer:
                                    'Run the Delegation of Control Wizard on the Domain 2'),
                            CheckboxTile(
                                answer:
                                    'Run the Delegation of Control Wizard on the Domain 3'),
                            CheckboxTile(
                                answer:
                                    'Run the Delegation of Control Wizard on the Domain 4'),
                          ]
                        : [
                            RadioTile(
                                answer: answer,
                                onChange: changeRadioAnswer,
                                answerValue: question!.answers[0]),
                            RadioTile(
                                answer: answer,
                                onChange: changeRadioAnswer,
                                answerValue: question!.answers[1]),
                            RadioTile(
                                answer: answer,
                                onChange: changeRadioAnswer,
                                answerValue: question!.answers[2]),
                            RadioTile(
                                answer: answer,
                                onChange: changeRadioAnswer,
                                answerValue: question!.answers[3]),
                          ],
                  )
                : Center(
                    child: Text('Loading question...'),
                  ),
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            height: 44,
            margin: const EdgeInsets.symmetric(vertical: 12.5),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Câu trước',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(244, 243, 244, 1)),
            ),
          ),
          Container(
            height: 44,
            margin: const EdgeInsets.symmetric(vertical: 12.5),
            child: ElevatedButton(
                onPressed: () {},
                child: const Text('Xem lại sau'),
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(240, 161, 0, 1))),
          ),
          Container(
            height: 44,
            margin: const EdgeInsets.symmetric(vertical: 12.5),
            child: ElevatedButton(
                onPressed: () {},
                child: const Text('Câu tiếp theo'),
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(34, 153, 248, 1))),
          ),
        ]),
      ),
    );
  }
}

// 1 o tra loi dang radio
class RadioTile extends StatelessWidget {
  RadioTile(
      {Key? key,
      required this.answer,
      required this.answerValue,
      required this.onChange})
      : super(key: key);
  String answer;
  final answerValue;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: Colors.white,
      child: ListTile(
        title: Transform.translate(
            offset: const Offset(-30, 0),
            child: Text(
              answerValue,
              style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )),
        leading: Transform.translate(
          offset: const Offset(-16, 0),
          child: Radio<String>(
            value: answerValue,
            groupValue: answer,
            onChanged: (value) => onChange(value),
          ),
        ),
      ),
    );
  }
}

// 1 o tra loi dang checkbox
class CheckboxTile extends StatefulWidget {
  const CheckboxTile({Key? key, required this.answer}) : super(key: key);
  final answer;

  @override
  State<CheckboxTile> createState() => _CheckboxTileState();
}

class _CheckboxTileState extends State<CheckboxTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: Colors.white,
      child: ListTile(
        title: Transform.translate(
            offset: const Offset(-30, 0),
            child: Text(
              widget.answer,
              style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )),
        leading: Transform.translate(
          offset: const Offset(-16, 0),
          child: Checkbox(
            value: isChecked,
            onChanged: (value) => setState(() {
              isChecked = value!;
            }),
          ),
        ),
      ),
    );
  }
}

// cai modal sheet khi ma minh bam vao cai drawer o goc phai
class QuestionsList extends StatefulWidget {
  const QuestionsList({Key? key}) : super(key: key);

  @override
  State<QuestionsList> createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  final Color background = const Color.fromRGBO(31, 30, 46, 1);
  final questionList = <Widget>[];

  @override
  void initState() {
    Color background;
    Color textColor;
    // TODO: implement initState
    for (int i = 0; i < 28; i++) {
      background = Colors.white12;
      textColor = Colors.white;
      if (i % 4 == 0) {
        background = Colors.blue;
      } else if (i == 6) {
        background = Colors.white;
        textColor = Colors.black;
      } else if (i % 5 == 0) {
        background = Colors.orange;
      }
      questionList.add(
        Container(
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                'Câu ${i + 1}',
                style: TextStyle(color: textColor),
              ),
            )),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          Container(
            height: 52,
            decoration: BoxDecoration(
                color: background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: Row(children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const ImageIcon(
                    AssetImage('assets/icons/X.png'),
                    color: Colors.white,
                  )),
              Expanded(
                child: Container(
                  child: const Text(
                    'Bảng câu hỏi và trả lời',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF Pro Display'),
                  ),
                ),
              ),
            ]),
          ),
          const Divider(
            height: 1,
          ),
          Container(
            height: 605,
            color: background,
            child: Column(children: [
              Container(
                height: 480,
                margin: const EdgeInsets.all(16),
                child: GridView.count(
                  childAspectRatio: 103.67 / 44,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 3,
                  children: questionList,
                ),
              ),
              Container(
                height: 52,
                margin: const EdgeInsets.only(top: 25, left: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Legend(
                          //     background: Colors.white12,
                          //     value: 'Câu chưa trả lời'),
                          // Legend(
                          //   background: Colors.blue,
                          //   value: 'Câu đã trả lời',
                          // ),
                          Legend(
                              background: Colors.white,
                              value: 'Câu đang trả lời'),
                          Legend(
                              background: Colors.blue,
                              value: 'Câu đã trả lời (7)'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Legend(
                              background: Colors.white12,
                              value: 'Câu chưa trả lời (16)'),
                          Legend(
                              background: Colors.orange,
                              value: 'Câu xem lại sau (4)'),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ]),
              )
            ]),
          ),
          const Divider(
            height: 1,
          ),
          Container(
            height: 68,
            color: background,
            child: Container(
              height: 44,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage('assets/icons/PaperPlaneTilt.png'),
                        color: Colors.white,
                      ),
                      Text(
                        'Nộp bài',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// cai chu thich o duoi danh sach cau hoi
class Legend extends StatelessWidget {
  const Legend({Key? key, required this.background, required this.value})
      : super(key: key);
  final Color background;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: background),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          value,
          style: TextStyle(color: Colors.white),
        )
      ]),
    );
  }
}
