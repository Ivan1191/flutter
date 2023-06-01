import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:animations/animations.dart';
import 'main.dart';
import 'journey.dart';

class TravelDestination {
  const TravelDestination({
    required this.assetName,
    required this.title,
    required this.description,
    required this.city,
    required this.location,
  });

  final String assetName;
  final String title;
  final String description;
  final String city;
  final String location;
}

List<TravelDestination> result = [];

Future updateList() async {
  var dest = destList.join(" ");
  var tmplist = await postKeyWord("台北", dest, "-1", '-1', '玩樂', '3');
  List<dynamic> list = tmplist.item1;
  for (int i = 0; i < list.length; i++) {
    var name = await callpicture(list[i]["Name"]);
    print(name);
    result.add(TravelDestination(
        assetName: name,
        title: list[i]["Name"],
        description: list[i]["Toldescribe"],
        city: "city",
        location: "location"));
  }
}

List<TravelDestination> destinations(BuildContext context) {
  return [
    TravelDestination(
      assetName: 'images/pic1.jpg',
      title: '壽山動物園',
      description:
          '開放時間：週二至週日 09:00~17:00(最後入園時間16:30) 星期一及除夕休園，如星期一遇國定假日則照常開園',
      city: '台南',
      location: '台灣',
    ),
    TravelDestination(
      assetName: 'images/pic2.jpg',
      title: '井仔腳鹽田',
      description: '慢生活步調',
      city: '台南',
      location: '台灣',
    ),
    TravelDestination(
      assetName: 'images/pic3.jpg',
      title: '漁光島沙灘',
      description: '金黃色夕陽',
      city: '台南',
      location: '台灣',
    ),
    TravelDestination(
      assetName: 'images/pic4.jpg',
      title: '台江國家公園',
      description: "綠自然景觀",
      city: '台南',
      location: '台灣',
    ),
  ];
}

FlutterTts flutterTts = FlutterTts();

Future<void> speakText(String text) async {
  await flutterTts.setLanguage('zh-TW');
  await flutterTts.setSpeechRate(0.5);
  await flutterTts.speak(text);
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    required this.title,
    required this.path,
    required this.description,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final String title;
  final String path;
  final String description;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (context, openContainer) => _DetailsPage(
        title: title,
        path: path,
        description: description,
      ),
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({required this.openContainer, required this.path});

  final VoidCallback openContainer;
  final String path;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SizedBox(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Ink.image(
                      image: AssetImage(path),
                      fit: BoxFit.cover,
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InkWellOverlay extends StatelessWidget {
  const _InkWellOverlay({
    required this.openContainer,
    required this.height,
    required this.child,
  });

  final VoidCallback openContainer;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );
  }
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage({
    required this.title,
    required this.path,
    required this.description,
  });

  final String title;
  final String path;
  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 170,
            ),
            SizedBox(
              height: 500,
              width: 350,
              child: Card(
                color: Color.fromARGB(255, 255, 248, 225),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 10),
                      child: Text(
                        title,
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
                    Image.asset(path),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            description,
                            style: textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              height: 1.5,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              print('搜尋結果: $result');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JourneyRoute()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 254, 130, 8),
                              minimumSize: Size(120, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              elevation: 4,
                            ),
                            child: Text(
                              '我想去',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 248, 225),
                              minimumSize: Size(120, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 254, 130, 8),
                                    width: 1),
                              ),
                            ),
                            child: Text(
                              '不想去',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 254, 130, 8)),
                            ),
                          ),
                        ],
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

//use
class TappableTravelDestinationItem extends StatefulWidget {
  const TappableTravelDestinationItem({
    super.key,
    required this.destination,
    this.shape,
  });

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 210.0;
  final TravelDestination destination;
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
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            SizedBox(
              height: TappableTravelDestinationItem.height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     print(widget.destination.title.toString());
                    //     destList.add(widget.destination.title.toString());
                    //     return FoodRoute(destList: destList);
                    //   }),
                    // ).then((value) {
                    //   // navigator.pop's response
                    //   if (value != null) {
                    //     setState(() {
                    //       print(value);
                    //     });
                    //   }
                    // });
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: _OpenContainerWrapper(
                    transitionType: ContainerTransitionType.fade,
                    title: widget.destination.title,
                    path: widget.destination.assetName,
                    description: widget.destination.description,
                    closedBuilder: (context, openContainer) {
                      return _DetailsCard(
                          openContainer: openContainer,
                          path: widget.destination.assetName);
                    },
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

class ChooseRoute extends StatefulWidget {
  const ChooseRoute({super.key});

  @override
  State<ChooseRoute> createState() => _ChooseState();
}

class _ChooseState extends State<ChooseRoute> with RestorationMixin {
  int selectedIndex = 0;

  final RestorableBool _isSelected = RestorableBool(false);

  @override
  String get restorationId => '';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_isSelected, 'is_selected');
  }

  @override
  void initState() async {
    super.initState();
    print(result.length);
    await updateList();
  }

  @override
  void dispose() {
    _isSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 包裹 Column
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              '我想要去:',
              style: TextStyle(
                fontFamily: 'Arial',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                fontSize: 36,
                height: 1.13,
                color: Color.fromRGBO(254, 130, 8, 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              itemCount: result.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0), // 垂直空間間距
              itemBuilder: (context, index) {
                final destination = result[index];
                return Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: TappableTravelDestinationItem.height,
                      child: TappableTravelDestinationItem(
                        destination: destination,
                      ),
                    ),
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
                                    speakText(destination.title);
                                  },
                                  icon: Icon(Icons.volume_up_rounded),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, left: 2),
                                child: Text(
                                  destination.title,
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
