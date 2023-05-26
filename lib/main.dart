// ignore_for_file: sort_child_properties_last, unnecessary_new, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // 引入flutter_tts庫
import 'package:intl/intl.dart'; // 引入日期格式化套件
import 'voice.dart';
import 'register.dart';

String address = '';

void main() {
  runApp(MyApp());
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
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 184, 97)),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  Widget page = IndexRoute();
  // final ScrollController _homeController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page,
    );
  }

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('no use'),
        actions: <IconButton>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.cancel),
          )
        ],
      ),
    );
  }
}

// search can use
class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView();
  }
}

class IndexRoute extends StatefulWidget {
  @override
  State<IndexRoute> createState() => _IndexRouteState();
}

class _IndexRouteState extends State<IndexRoute> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://i.imgur.com/O9AX9g3.jpeg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
              child: Text(
                '登入',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber[800],
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Text(
                '註冊',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber[800],
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 184, 97),
        title: Text(''),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: '',
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_circle,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.749),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '嗨!千慧',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text(
                  '開始規畫',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[800],
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'MY NAME',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 184, 97),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: AssetImage('images/user.png'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              showSearch(context: context, delegate: CustomSearchDelegate());
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

// 你所在的位置?
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _isFromHome = false; // 是否從家中出發
  bool _isOtherFrom = false; // 是否從其他出發地出發
  int _selectedIndex = 0;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 184, 97),
        title: Text(''),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: '',
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_circle,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.749),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '你現在所在的位置',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // 將child移到最後一個參數
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isFromHome = true; // 設定為從家中出發
                      _isOtherFrom = false; // 設定為非從其他出發地出發
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _isFromHome ? Colors.amber[800] : Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    '從家中出發',
                    style: TextStyle(
                      fontSize: 20,
                      color: _isFromHome ? Colors.white : Colors.amber[800],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isFromHome = false; // 設定為非從家中出發
                      _isOtherFrom = true; // 設定為從其他出發地出發
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _isOtherFrom ? Colors.amber[800] : Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    '其他出發地',
                    style: TextStyle(
                      fontSize: 20,
                      color: _isOtherFrom ? Colors.white : Colors.amber[800],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Spacer(), // Spacer 佔滿剩餘空間

          _isOtherFrom // 如果 _isOtherFrom 為 true，則顯示 TextFormField，否則顯示一個空的 Container
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20), // 設置上下左右的 padding 值
                  child: TextFormField(
                    //一個 Material Design 風格的文字輸入欄位 widget
                    controller: _textEditingController, //用於監聽文字輸入的變化
                    decoration: InputDecoration(
                      //用於設置文字輸入欄位的外觀
                      hintText: '請輸入出發地址', //設置文字輸入提示
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      address = value; //將輸入的地址存儲在全域變數中
                    },
                  ),
                )
              : Container(),

          //下一頁的按鈕
          Container(
            padding: EdgeInsets.only(bottom: 16),
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
              child: Text(
                '下一頁',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber[800],
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'MY NAME',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 184, 97),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: AssetImage('images/user.png'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              showSearch(context: context, delegate: CustomSearchDelegate());
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

// 你想要旅遊的區域?
class ThirdPage extends StatefulWidget {
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 184, 97),
        title: Text(''),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: '',
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_circle,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.749),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '你想要旅遊的區域?',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右對齊
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '上一頁',
                        style:
                            TextStyle(fontSize: 20, color: Colors.amber[800]),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // 按鈕底色是白色
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FourthPage()),
                        );
                      },
                      child: Text(
                        '下一頁',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[800],
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'MY NAME',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 184, 97),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: AssetImage('images/user.png'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              showSearch(context: context, delegate: CustomSearchDelegate());
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

// 你的出遊日期?
class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  int _selectedIndex = 0;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDate2 = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate2,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate2) {
      setState(() {
        _selectedDate2 = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 184, 97),
        title: Text(''),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: '',
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_circle,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.749),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '你的出遊日期?',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '出發日期',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectDate2(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '返程日期',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '${DateFormat('yyyy-MM-dd').format(_selectedDate2)}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                // Divider(height: 1, color: Colors.grey),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '出遊人數',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {},
                            ),
                            Text(
                              '2',
                              style: TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Divider(height: 1, color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右對齊
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '上一頁',
                        style:
                            TextStyle(fontSize: 20, color: Colors.amber[800]),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // 按鈕底色是白色
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FifthPage()),
                        );
                      },
                      child: Text(
                        '下一頁',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[800],
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'MY NAME',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 184, 97),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: AssetImage('images/user.png'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              showSearch(context: context, delegate: CustomSearchDelegate());
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

// 你的旅遊預算?
class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  int _selectedIndex = 0;
  String? _minBudget; // 加上問號，表示該變數可以為 null
  String? _maxBudget; // 加上問號，表示該變數可以為 null

  final List<String> _budgetRanges = [
    '1000元',
    '2000元',
    '3000元',
    '4000元',
    '5000元',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 184, 97),
        title: Text(''),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: '',
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_circle,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.749),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              '你的旅遊預算?',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Expanded(
              // Expanded widget 可讓Row或Column中的子元件佔滿剩餘的空間
              child: Row(
                children: [
                  Expanded(
                    // 左側欄位(最低預算)
                    child: Column(
                      children: [
                        Text(
                          '最低預算', // 標籤文字
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10), // 添加一個10像素高的間隔
                        DropdownButton<String>(
                          // 下拉式選單
                          isExpanded: true, // 設置下拉式選單為填滿父元件寬度
                          value: _minBudget, // 下拉式選單當前選取值
                          icon: const Icon(Icons.arrow_downward), // 下拉箭頭圖示
                          iconSize: 24, // 下拉箭頭圖示大小
                          elevation: 16, // 下拉式選單陰影
                          style: const TextStyle(
                              color: Colors.black), // 下拉選單選項文字的樣式
                          underline: Container(
                            // 下拉選單的底線
                            height: 2, // 底線高度
                            color: Colors.grey, // 底線顏色
                          ),
                          onChanged: (String? newValue) {
                            // 當選取值改變時的回調函數
                            setState(() {
                              _minBudget = newValue; // 更新選取值
                            });
                          },
                          items: _budgetRanges // 下拉選單選項
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value, // 選項值
                              child: Text(value), // 選項顯示的標籤文字
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50), // 添加一個20像素寬的間隔
                  Expanded(
                    // 右側欄位(最高預算)
                    child: Column(
                      children: [
                        Text(
                          '最高預算',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: _maxBudget,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: Container(
                            height: 2,
                            color: Colors.grey,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _maxBudget = newValue;
                            });
                          },
                          items: _budgetRanges
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Divider(height: 1, color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右對齊
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '上一頁',
                          style:
                              TextStyle(fontSize: 20, color: Colors.amber[800]),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SixthPage()),
                          );
                        },
                        child: Text(
                          '下一頁',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber[800],
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'MY NAME',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 184, 97),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: AssetImage('images/user.png'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              showSearch(context: context, delegate: CustomSearchDelegate());
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}

// 初步設定已完成
class SixthPage extends StatefulWidget {
  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 184, 97),
        title: Text(''),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: '',
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_drop_down_circle,
            ),
            color: Color.fromRGBO(0, 0, 0, 0.749),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  '初步設定已完成\n請交給小孩完成',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Divider(height: 1, color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右對齊
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstPage()),
                        );
                      },
                      child: Text(
                        '取消',
                        style:
                            TextStyle(fontSize: 20, color: Colors.amber[800]),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // 按鈕底色是白色
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VoiceRoute()),
                        );
                      },
                      child: Text(
                        '確認',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[800],
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'MY NAME',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 184, 97),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber[800],
                backgroundImage: AssetImage('images/user.png'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
        onTap: (int index) {
          switch (index) {
            case 0:
              break;
            case 1:
              showSearch(context: context, delegate: CustomSearchDelegate());
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
