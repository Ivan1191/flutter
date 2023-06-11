import 'package:flutter/material.dart';
import 'main.dart';
import 'voice.dart';
import 'package:fianl/dest.dart';
import 'package:fianl/food.dart';
import 'package:flutter_tts/flutter_tts.dart';

// ignore: must_be_immutable
class GotoRoute extends StatefulWidget {
  List<FurtherKeyword> Function(BuildContext) furtherList;
  final String type;
  final String level;

  GotoRoute({
    super.key,
    required this.furtherList,
    required this.type,
    required this.level,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GotoState createState() => _GotoState();
}

FlutterTts flutterTts = FlutterTts();

Future<void> speakText(String text) async {
  await flutterTts.setLanguage('zh-TW');
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(text);
}

class _GotoState extends State<GotoRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 245, 225, 1), // 背景顏色
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (destList.isNotEmpty)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          destList.last,
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                            height: 1.13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          ' 想看什麼?',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 36,
                            height: 1.13,
                            color: Color.fromRGBO(254, 130, 8, 1),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {
                            speakText(destList.last);
                            speakText('想看什麼');
                          },
                          icon: Icon(Icons.volume_up_rounded),
                          color: Color.fromARGB(255, 254, 130, 8),
                          iconSize: 30,
                        ),
                      ),
                    ],
                  )
                : Text(
                    '你想去哪裡?',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      height: 1.13,
                      color: Color.fromRGBO(254, 130, 8, 1),
                    ),
                  ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VoiceRoute(
                          furtherList: widget.furtherList,
                          type: widget.type,
                          level: widget.level)), // 替換為要跳轉的頁面
                );
              },
              child: Center(
                child: Image(image: AssetImage('images/2.1.png')),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (theme == 1)
                          ? DestRoute(furtherList: widget.furtherList)
                          : FoodRoute(
                              furtherList: widget.furtherList)), // 替換為要跳轉的頁面
                );
              },
              child: Center(
                child: Image.asset('images/2.2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
