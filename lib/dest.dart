import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
// import 'main.dart';
import 'goto.dart';
// import 'choice.dart';
import 'package:fianl/main.dart';
import 'package:fianl/choice.dart';

enum CardType {
  standard,
  tappable,
  selectable,
}

class DestinationKeyword {
  const DestinationKeyword({
    required this.assetName,
    required this.title,
    required this.furtherList,
  });

  final String assetName;
  final String title;
  final List<FurtherKeyword> Function(BuildContext) furtherList;
}

class FurtherKeyword {
  const FurtherKeyword({
    required this.assetName,
    required this.title,
  });

  final String assetName;
  final String title;
}

List<DestinationKeyword> ideaList(BuildContext context) {
  return [
    DestinationKeyword(
      assetName: 'images/p1.jpg',
      title: '遊樂場',
      furtherList: playgroundList,
    ),
    DestinationKeyword(
      assetName: 'images/p2.jpg',
      title: '動物園',
      furtherList: zooList,
    ),
    DestinationKeyword(
      assetName: 'images/p3.jpg',
      title: '海洋館',
      furtherList: aquariumList,
    ),
    DestinationKeyword(
      assetName: 'images/p7.jpg',
      title: '博物館',
      furtherList: museumList,
    ),
    DestinationKeyword(
      assetName: 'images/p8.jpg',
      title: '美術館',
      furtherList: artList,
    ),
    DestinationKeyword(
      assetName: 'images/p9.jpg',
      title: '歷史古蹟',
      furtherList: landmarkList,
    ),
  ];
}

List<FurtherKeyword> zooList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '長頸鹿',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '孔雀',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '狐蒙',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '大嘴鳥',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '梅花鹿',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '大象',
    ),
  ];
}

List<FurtherKeyword> playgroundList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '雲霄飛車',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '旋轉木馬',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '摩天輪',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '水上滑梯',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '大怒神',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '海盜船',
    ),
  ];
}

List<FurtherKeyword> aquariumList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '海豚',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '企鵝',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '海獅',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '水獺',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '水母',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '海馬',
    ),
  ];
}

List<FurtherKeyword> museumList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '歷史',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '恐龍',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '木乃伊',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '藝術',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '標本',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '畫相',
    ),
  ];
}

List<FurtherKeyword> artList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '雕塑',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '油畫',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '國畫',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '速寫',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '陶瓷',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '攝影',
    ),
  ];
}

List<FurtherKeyword> landmarkList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '廟宇',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '車站',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '教堂',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '燈塔',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '官邸',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '書院',
    ),
  ];
}

FlutterTts flutterTts = FlutterTts();

Future<void> speakText(String text) async {
  await flutterTts.setLanguage('zh-TW');
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(text);
}

void showConfirmationDialog(BuildContext context, dynamic dest) {
  Widget page;
  (ideacnt < 2)
      ? page = GotoRoute(
          furtherList: dest.furtherList,
          type: "玩樂",
          level: '1',
        )
      : page = ChooseRoute();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('你的選擇正確無誤？'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  print(dest.title.toString());

                  ideacnt++;
                  destList.add(dest.title.toString());
                  print(destList);
                  /* 在串接到最後一頁之前更新 list*/
                  if (ideacnt >= 2) {
                    updateList();
                  }
                  return page;
                }),
              );
            },
            child: Text(
              '確定',
              style: TextStyle(
                fontFamily: 'Arial',
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 取消，返回原本的頁面
            },
            child: Text(
              '取消',
              style: TextStyle(
                fontFamily: 'Arial',
                fontStyle: FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}

class TappableTravelDestinationItem extends StatefulWidget {
  const TappableTravelDestinationItem({
    super.key,
    required this.destination,
    this.shape,
  });

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 165.0;
  final dynamic destination;
  final ShapeBorder? shape;

  @override
  State<TappableTravelDestinationItem> createState() =>
      _TappableTravelDestinationItemState();
}

class _TappableTravelDestinationItemState
    extends State<TappableTravelDestinationItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          children: [
            SizedBox(
              height: TappableTravelDestinationItem.height,
              width: 400,
              child: Card(
                elevation: 10.0,
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
                child: InkWell(
                  onTap: () {
                    showConfirmationDialog(context, widget.destination);
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Semantics(
                    //label: widget.destination.title,
                    child: SizedBox(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Ink.image(
                              image: NetworkImage(widget.destination.assetName),
                              fit: BoxFit.cover,
                              child: Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DestRoute extends StatefulWidget {
  List<FurtherKeyword> Function(BuildContext) furtherList;
  DestRoute({
    super.key,
    required this.furtherList,
  });

  @override
  State<DestRoute> createState() => _DestRouteState();
}

class _DestRouteState extends State<DestRoute> with RestorationMixin {
  int cnt = 0;
  final RestorableBool _isSelected = RestorableBool(false);

  @override
  String get restorationId => '';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_isSelected, 'is_selected');
  }

  @override
  void dispose() {
    _isSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List Function(BuildContext) viewList;
    (ideacnt == 1) ? (viewList = ideaList) : (viewList = widget.furtherList);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 145,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 0, left: 75),
                child: Text(
                  '選擇以下分類!',
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
                    speakText('選擇以下分類');
                  },
                  icon: Icon(Icons.volume_up_rounded),
                  color: Color.fromARGB(255, 254, 130, 8),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GridView.count(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 0,
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                for (var i = cnt; i < cnt + 3; i++)
                  Column(
                    children: [
                      SizedBox(
                          child: TappableTravelDestinationItem(
                              destination: viewList(context)[i])),
                      Semantics(
                        container: true,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: DefaultTextStyle(
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: IconButton(
                                    onPressed: () {
                                      speakText(viewList(context)[i].title);
                                    },
                                    icon: Icon(Icons.volume_up_rounded),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 11, left: 2),
                                  child: Text(
                                    viewList(context)[i].title,
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  // height: 50.0,
                  // width: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 77, left: 17, right: 17),
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 248, 225),
                      child: Transform.scale(
                        scaleX: -1,
                        child: Icon(
                          Icons.replay_circle_filled_rounded,
                          size: 50,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (cnt == 3) {
                            cnt = 0;
                          } else {
                            cnt = 3;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
