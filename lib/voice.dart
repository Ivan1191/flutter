import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fianl/dest.dart';
import 'package:fianl/food.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fianl/main.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:path_provider/path_provider.dart';
import 'package:tuple/tuple.dart';

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
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<VoiceRoute> {
  final LongPressGestureRecognizer _longPressRecognizer =
      LongPressGestureRecognizer();
  late stt.SpeechToText _speechToText; // 語音辨識實例
  String _spokenText = ''; // 儲存辨識結果的文字
  bool _isButtonPressed = false; // 按鈕狀態

  @override
  void initState() {
    super.initState();
    _initializeSpeechToText(); // 初始化語音辨識
  }

  void _initializeSpeechToText() {
    _speechToText = stt.SpeechToText(); // 建立語音辨識實例
    _speechToText.initialize(
      onError: (error) => print('Speech recognition error: $error'), // 設定錯誤回調函數
      onStatus: (status) =>
          print('Speech recognition status: $status'), // 設定狀態回調函數
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
                // callback();
                setState(() {
                  _isButtonPressed = true; // 更新按鈕狀態為按下
                });
                _startSpeechToText(); // 開始語音辨識
              },
              onLongPressUp: () async {
                // 放開長按後執行
                setState(() {
                  _isButtonPressed = false; // 更新按鈕狀態為放開
                });
                _stopSpeechToText();
                /* 選擇要去哪裡 */
                var result = await postKeyWord("台北", _spokenText, "-1", "-1",
                    widget.type, '1'); // 這邊 level 要改
                print(result); /* 這邊 */
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (theme == 1)
                          ? DestRoute(furtherList: widget.furtherList)
                          : FoodRoute()), // 替換為要跳轉的下個頁面
                );
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
    _speechToText.listen(
      onResult: (result) {
        setState(() {
          _spokenText = result.recognizedWords; // 更新語音辨識結果的文字
        });
      },
    );
  }

  void _stopSpeechToText() {
    _speechToText.stop(); // 停止語音辨識
  }

  Future callpicture(String name) async {
    // default output[no]["Name"]
    // return the name of that image
    var msg = {'Name': name};
    try {
      final response = await http.post(
        Uri.parse('http://140.116.245.152:22545/image'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(msg),
      );
      if (response.statusCode == 200) {
        final imageBytes = response.bodyBytes;
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/$name.jpg';
        File(imagePath).writeAsBytesSync(imageBytes);
        return imagePath;
      } else {
        return "image/false.jpg";
      }
    } catch (e) {
      print('Error occured: $e');
    }
  }

  dynamic postKeyWord(String location, String keyword, String locationPx,
      String locationPy, String type, String level) async {
    /* 所有有關於頁面的call 此function 即可 
        *  回傳永遠都會是 Tuple2<dynamic,int>
        *  type = 吃飯 ／ 玩樂
        */

    var msg = {
      'location': location,
      'keyword': keyword,
      'locationPx': locationPx,
      'locationPy': locationPy,
      'type': type,
      'level': level,
    };
    try {
      final response = await http.post(
        Uri.parse('http://140.116.245.152:22545/HaishingRec'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(msg),
      );
      var respText = utf8.decode((response.bodyBytes));
      var level = jsonDecode(respText)["nextlevel"]; // int

      // print(outputList[0]["Name"]);
      // 以下 for 未來 不同type 調整用
      if (level == 1) {
        var output = jsonDecode(respText)["message"];
        print(output);
        print(level);
        return Tuple2(output, level);
      }
      if (level == 2) {
        var output = jsonDecode(respText)["message"];

        return Tuple2(output, level);
      }
      if (level == 3) {
        var outputList =
            jsonDecode(jsonDecode(respText)["message"]); //List<dynamic>
        return Tuple2(outputList, level);
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
