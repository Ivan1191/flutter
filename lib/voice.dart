<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dest.dart';

class VoiceRoute extends StatefulWidget {
  @override
  State<VoiceRoute> createState() => _VoiceRouteState();
}

class _VoiceRouteState extends State<VoiceRoute> {
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
                GestureDetector(
                  onTap: () {
                    FlutterTts().speak('你想要去哪裡？');
                  },
                  child: InkResponse(
                    splashColor: Colors.grey,
                    highlightColor: Colors.transparent,
                    child: Icon(Icons.mic),
                    onTap: () {
                      FlutterTts().speak('你想要去哪裡？');
                    },
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '你想要去哪裡？',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 100,
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      // TODO: 啟動語音辨識
                    },
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          '輸入完成',
                          style: TextStyle(color: Colors.amber[800]),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              callback();
                              return DestRoute();
                            }),
                          ).then((value) {
                            // navigator.pop's response
                            if (value != null) {
                              setState(() {
                                // TappableTravelDestinationItem
                                //     .MailArray[1].isFavorite = value;
                              });
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
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
            icon: Icon(Icons.fast_rewind),
            label: 'Back',
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
              Navigator.pop(context);
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

  void callback() async {
    var msg = {
      'location': '嘉義市',
      'keyword': '百科',
      'locationPx': '-1',
      'locationPy': '-1'
    };
    try {
      final response = await http.post(
        Uri.parse('http://140.116.245.152:22545/HaishingRec'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(msg),
      );
      print(jsonDecode(response.body));
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
=======
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dest.dart';

class VoiceRoute extends StatefulWidget {
  @override
  State<VoiceRoute> createState() => _VoiceRouteState();
}

class _VoiceRouteState extends State<VoiceRoute> {
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
                GestureDetector(
                  onTap: () {
                    FlutterTts().speak('你想要去哪裡？');
                  },
                  child: InkResponse(
                    splashColor: Colors.grey,
                    highlightColor: Colors.transparent,
                    child: Icon(Icons.mic),
                    onTap: () {
                      FlutterTts().speak('你想要去哪裡？');
                    },
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '你想要去哪裡？',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 100,
                    icon: Icon(Icons.mic),
                    onPressed: () {
                      // TODO: 啟動語音辨識
                    },
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Text(
                          '輸入完成',
                          style: TextStyle(color: Colors.amber[800]),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              callback();
                              return DestRoute();
                            }),
                          ).then((value) {
                            // navigator.pop's response
                            if (value != null) {
                              setState(() {
                                // TappableTravelDestinationItem
                                //     .MailArray[1].isFavorite = value;
                              });
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
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
            icon: Icon(Icons.fast_rewind),
            label: 'Back',
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
              Navigator.pop(context);
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

  void callback() async {
    var msg = {
      'location': '嘉義市',
      'keyword': '百科',
      'locationPx': '-1',
      'locationPy': '-1'
    };
    try {
      final response = await http.post(
        Uri.parse('http://140.116.245.152:22545/HaishingRec'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(msg),
      );
      print(jsonDecode(response.body));
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
>>>>>>> 709f29ac6a37e96b62ce765a6599ef304fdd45ab
