import 'package:flutter/material.dart';
// 引入flutter_tts庫
import 'package:intl/intl.dart'; // 引入日期格式化套件
import './main.dart';

class RegistrationPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // 定義性別的選項
  final List<String> _genderOptions = ['男', '女'];

  // 設置表單控制器
  final _formKey = GlobalKey<FormState>();

  // 定義各個表單欄位的初始值
  String _gender = '男';
  DateTime? _birthday;
  RangeValues _ageRangeValues = RangeValues(0, 10); // 新增年齡範圍變數

  // 函數：顯示選擇日期的對話框
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthday = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 添加此行
      appBar: AppBar(
        title: Text('註冊'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: '姓氏',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入姓氏';
                  }
                  return '';
                },
                onSaved: (value) {
                },
              ),
              // 名字
              TextFormField(
                decoration: InputDecoration(
                  labelText: '名字',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入名字';
                  }
                  return null;
                },
                onSaved: (value) {
                },
              ),
              // 性別
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: '性別',
                ),
                value: _gender,
                items: _genderOptions.map((String genderOption) {
                  return DropdownMenuItem<String>(
                    value: genderOption,
                    child: Text(genderOption),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請選擇性別';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // 生日
              TextButton(
                onPressed: () => _selectDate(context),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 10),
                    Text(
                      _birthday == null
                          ? '選擇生日'
                          : '生日: ${DateFormat.yMd().format(_birthday!)}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // 電子郵件
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '電子郵件',
                ),
              ),
              SizedBox(height: 20),
              // 小孩數目
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '有幾位小孩',
                ),
              ),
              SizedBox(height: 20),
              // 小孩年齡
              Text(
                '小孩年齡區間',
                style: TextStyle(fontSize: 16),
              ),
              RangeSlider(
                values: _ageRangeValues,
                min: 0,
                max: 18,
                divisions: 18,
                labels: RangeLabels(
                  '${_ageRangeValues.start.round()}',
                  '${_ageRangeValues.end.round()}',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _ageRangeValues = values;
                  });
                },
              ),
              SizedBox(height: 20),
              // 密碼
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '密碼',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              // 再次輸入密碼
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '再輸入一次密碼',
                ),
                obscureText: true,
              ),
              // 完成的按鈕
              Align(
                alignment: FractionalOffset.bottomRight, // 對齊方式設為右下角
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IndexRoute()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  child: Text(
                    '完成',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _birthday ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple, // 設置主題顏色
            hintColor: Colors.purple, // 設置選中的顏色
            colorScheme: ColorScheme.light(primary: Colors.purple),
          ),
          child: child ?? SizedBox(),
        );
      },
    );
    if (selected != null && selected != _birthday) {
      setState(() {
        _birthday = selected;
      });
    }
  }
}
