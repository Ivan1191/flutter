import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// import 'adultend.dart';
import 'kidaccount.dart';
import 'kidsinfo.dart';
// import 'place.dart';
import './main.dart';

class FourDigitValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return '請輸入出生西元年';
    }

    if (value.length != 4) {
      return '請輸入出生西元年';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return '請輸入有效年';
    }

    return null; // 验证通过
  }
}

class AdultStart extends StatefulWidget {
  @override
  _AdultStartState createState() => _AdultStartState();
}

class _AdultStartState extends State<AdultStart> {
  final _formKey = GlobalKey<FormState>();
  String? _inputValue;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 204, 128),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 147),
            Text(
              '哈囉！父母!',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 254, 130, 8)),
            ),
            SizedBox(height: 40),
            Text(
              '請輸入您的出生西元年',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 254, 130, 8)),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 88, right: 88),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: '出生西元年',
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 248, 225),
                        border: InputBorder.none,
                      ),
                      validator: FourDigitValidator.validate,
                      onSaved: (String? value) {
                        _inputValue = value;
                      },
                    ),
                    SizedBox(height: 300),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // 导航到下一个页面
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => KidsInfo()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 254, 130, 8),
                        onPrimary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        '開始規畫',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
