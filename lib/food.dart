import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'main.dart';
import 'goto.dart';
import 'choice.dart';
import 'dest.dart';

class FoodKeyword {
  const FoodKeyword({
    required this.assetName,
    required this.title,
    required this.furtherList,
  });

  final String assetName;
  final String title;
  final List<FurtherKeyword> Function(BuildContext) furtherList;
}

List<FoodKeyword> ideaList(BuildContext context) {
  return [
    FoodKeyword(
      assetName: 'images/pic5.jpg',
      title: '肉',
      furtherList: meatList,
    ),
    FoodKeyword(
      assetName: 'images/pic6.jpg',
      title: '麵',
      furtherList: noodlesList,
    ),
    FoodKeyword(
      assetName: 'images/pic7.jpg',
      title: '蔬菜',
      furtherList: vegtList,
    ),
    FoodKeyword(
      assetName: 'images/pic8.jpg',
      title: '水果',
      furtherList: fruitList,
    ),
    FoodKeyword(
      assetName: 'images/pic8.jpg',
      title: '甜點',
      furtherList: dessertList,
    ),
    FoodKeyword(
      assetName: 'images/pic8.jpg',
      title: '海鮮',
      furtherList: seafoodList,
    ),
  ];
}

List<FurtherKeyword> meatList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '雞',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '豬',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '鴨',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '牛',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '羊',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '鵝',
    ),
  ];
}

List<FurtherKeyword> noodlesList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '義大利麵',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '湯麵',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '涼麵',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '炒麵',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '通心粉',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '意麵',
    ),
  ];
}

List<FurtherKeyword> vegtList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '苦瓜',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '番茄',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '黃瓜',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '水蓮',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '空心菜',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '高麗菜',
    ),
  ];
}

List<FurtherKeyword> fruitList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '香蕉',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '釋迦',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '蓮霧',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '榴槤',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '芭樂',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '葡萄',
    ),
  ];
}

List<FurtherKeyword> dessertList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '蛋糕',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '冰淇淋',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '布丁',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '巧克力',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '藍莓千層',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '提拉米蘇',
    ),
  ];
}

List<FurtherKeyword> seafoodList(BuildContext context) {
  return [
    FurtherKeyword(
      assetName: 'images/p4.jpg',
      title: '魚',
    ),
    FurtherKeyword(
      assetName: 'images/p5.jpg',
      title: '蝦',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '螃蟹',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '蚵仔',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '龍蝦',
    ),
    FurtherKeyword(
      assetName: 'images/p6.jpg',
      title: '蛤蜊',
    ),
  ];
}

FlutterTts flutterTts = FlutterTts();

Future<void> speakText(String text) async {
  await flutterTts.setLanguage('zh-TW');
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(text);
}

void showConfirmationDialog(BuildContext context, dynamic food) {
  Widget page;
  (ideacnt < 2)
      ? page = GotoRoute(
          furtherList: food.furtherList,
          type: "吃飯",
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
                  print(food.title.toString());

                  ideacnt++;
                  destList.add(food.title.toString());
                  print(destList);
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

class TappableTravelFoodItem extends StatefulWidget {
  const TappableTravelFoodItem({
    super.key,
    required this.food,
    this.shape,
  });

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 180.0;
  final FoodKeyword food;
  final ShapeBorder? shape;

  @override
  State<TappableTravelFoodItem> createState() => _TappableTravelFoodItemState();
}

class _TappableTravelFoodItemState extends State<TappableTravelFoodItem> {
  // record selected item
  final foodList = <String>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            SizedBox(
              height: TappableTravelFoodItem.height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: widget.shape,
                child: InkWell(
                  onTap: () {
                    showConfirmationDialog(context, widget.food);
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Semantics(
                    label: widget.food.title,
                    child: Semantics(
                      //label: widget.destination.title,
                      child: SizedBox(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Ink.image(
                                image: AssetImage(widget.food.assetName),
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
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FoodRoute extends StatefulWidget {
  List<FurtherKeyword> Function(BuildContext) furtherList;
  FoodRoute({
    super.key,
    required this.furtherList,
  });

  @override
  State<FoodRoute> createState() => _FoodRouteState();
}

class _FoodRouteState extends State<FoodRoute> with RestorationMixin {
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
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
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
                          child: TappableTravelFoodItem(
                              food: viewList(context)[i])),
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
                        top: 5, bottom: 50, left: 12, right: 12),
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
