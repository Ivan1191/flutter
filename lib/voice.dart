import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dest.dart';
import 'food.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

// ignore: must_be_immutable
class VoiceRoute extends StatefulWidget {
  List<FurtherKeyword> Function(BuildContext) furtherList;
  String type;
  String level = "0";
  VoiceRoute(
      {super.key,
      required this.furtherList,
      required this.type,
      required this.level});

  @override
  // ignore: library_private_types_in_public_api
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<VoiceRoute> {
  final LongPressGestureRecognizer _longPressRecognizer =
      LongPressGestureRecognizer();
  late stt.SpeechToText _speechToText; // 語音辨識實例
  String _spokenText = ''; // 儲存辨識結果的文字
// 按鈕狀態

  @override
  void initState() {
    super.initState();
    _initializeSpeechToText(); // 初始化語音辨識
  }

  void _initializeSpeechToText() async {
    _speechToText = stt.SpeechToText(); // 建立語音辨識實例

    // 初始化語音辨識
    bool isAvailable = await _speechToText.initialize(
      onError: (error) => print('語音辨識錯誤: $error'),
      onStatus: (status) {
        print('語音辨識狀態: $status');
        setState(() {
          // 檢查語音辨識是否已初始化，並且語音辨識是否可用
          _isSpeechToTextInitialized =
              (status == stt.SpeechToText.listeningStatus ||
                  _speechToText.isAvailable);
        });
      },
    );

    if (isAvailable) {
      _startSpeechToText(); // 開始語音辨識
    }
  }

  bool _isSpeechToTextInitialized = true;

  void showConfirmationDialog(BuildContext context) {
    Widget page;
    (theme == 1)
        ? page = DestRoute(furtherList: widget.furtherList)
        : page = FoodRoute(furtherList: widget.furtherList);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('語音是否無誤？'),
          content: Text(_spokenText),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 248, 225),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return page;
                      }),
                    );
                  },
                  icon: Icon(Icons.check,
                      color: Color.fromARGB(255, 254, 130, 8)),
                  iconSize: 30.0,
                  splashRadius: 20.0,
                  padding: EdgeInsets.all(10.0),
                  constraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _longPressRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '說出你的想法!',
              style: TextStyle(
                fontFamily: 'Arial',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 36,
                height: 1.13,
                color: Color.fromRGBO(254, 130, 8, 1),
              ),
            ),
            SizedBox(height: 40),
            Image(image: AssetImage('images/3.3.png')),
            SizedBox(height: 40),
            GestureDetector(
              onLongPress: () {
                setState(() {
// 更新按鈕狀態為按下
                });
                _startSpeechToText(); // 開始語音辨識
              },
              onLongPressUp: () async {
                setState(() {
// 更新按鈕狀態為放開
                });
                _stopSpeechToText();
                /* 選擇要去哪裡 */
                var result = await postKeyWord("台北", _spokenText, "-1", "-1",
                    widget.type, '1'); // 這邊 level 要改
                print(result); /* 這邊 */
                // ignore: use_build_context_synchronously
                showConfirmationDialog(context);
              },
              child: SizedBox(
                height: 80.0,
                width: 80.0,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  backgroundColor: Color.fromRGBO(254, 130, 8, 1),
                  child: Icon(
                    Icons.mic,
                    size: 36,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '說話結果: $_spokenText', // 顯示語音辨識結果的文字
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startSpeechToText() {
    if (!_isSpeechToTextInitialized) {
      print('語音辨識未初始化');
      return;
    }

    if (_speechToText.isListening) {
      print('語音辨識已經在進行中');
      return;
    }

    _speechToText.listen(
      onResult: (result) {
        setState(() {
          _spokenText = result.recognizedWords; // 更新辨識到的文字
        });
      },
    );
  }

  void _stopSpeechToText() {
    _speechToText.stop(); // 停止語音辨識
  }

  void callback() async {
    var msg = {
      'location': '嘉義市',
      'keyword': '百科',
      'locationPx': '-1',
      'locationPy': '-1'
    };
    try {
      final response = await http.post(
        Uri.parse('http://140.116.251.174:3000/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(msg),
      );
      print(response.body);
      setState(() {
        _spokenText = response.body;
      });
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
