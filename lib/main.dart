// ignore_for_file: sort_child_properties_last, unnecessary_new, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 引入日期格式化套件
import 'start.dart';
import 'package:tuple/tuple.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

String address = '';
// control unit
int theme = 1;
int ideacnt = 1;
// There are two options in list
List<String> destList = <String>[];
List<String> foodList = <String>[];

void main() {
  runApp(const MyApp());
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
      return 'image/false.jpg';
    }
  } catch (e) {
    return 'Error occured: $e';
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
    var level = jsonDecode(respText)['nextlevel']; // int

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        useMaterial3: true,
        // primaryColor: Color.fromARGB(255, 255, 184, 97),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 248, 225)),
      ),
      home: StartRoute(),
      debugShowCheckedModeBanner: false,
    );
  }
}
