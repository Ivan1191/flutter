import 'package:flutter/material.dart';
import 'food.dart';

enum CardType {
  standard,
  tappable,
  selectable,
}

class TravelDestination {
  const TravelDestination({
    required this.assetName,
    required this.title,
    required this.description,
    required this.city,
    required this.location,
    this.cardType = CardType.standard,
  });

  final String assetName;
  final String title;
  final String description;
  final String city;
  final String location;
  final CardType cardType;
}

List<TravelDestination> destinations(BuildContext context) {
  return [
    TravelDestination(
      assetName: 'images/pic1.jpg',
      title: '金砂里步道',
      description: '溫暖的花季',
      city: '台南',
      location: '台灣',
      cardType: CardType.tappable,
    ),
    TravelDestination(
      assetName: 'images/pic2.jpg',
      title: '井仔腳鹽田',
      description: '慢生活步調',
      city: '台南',
      location: '台灣',
      cardType: CardType.tappable,
    ),
    TravelDestination(
      assetName: 'images/pic3.jpg',
      title: '漁光島沙灘',
      description: '金黃色夕陽',
      city: '台南',
      location: '台灣',
      cardType: CardType.tappable,
    ),
    TravelDestination(
      assetName: 'images/pic4.jpg',
      title: '台江國家公園',
      description: "綠自然景觀",
      city: '台南',
      location: '台灣',
      cardType: CardType.tappable,
    ),
  ];
}

//not use
class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem(
      {super.key, required this.destination, this.shape});

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 360.0;
  final TravelDestination destination;
  final ShapeBorder? shape;

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
              height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: Semantics(
                  //label: destination.title,
                  child: TravelDestinationContent(destination: destination),
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
  static const height = 224.0;
  final TravelDestination destination;
  final ShapeBorder? shape;

  @override
  State<TappableTravelDestinationItem> createState() =>
      _TappableTravelDestinationItemState();
}

class _TappableTravelDestinationItemState
    extends State<TappableTravelDestinationItem> {
  // record selected item
  final destList = <String>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Column(
          children: [
            SizedBox(
              height: TappableTravelDestinationItem.height,
              child: Card(
                // This ensures that the Card's children (including the ink splash) are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: widget.shape,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        print(widget.destination.title.toString());
                        destList.add(widget.destination.title.toString());
                        return FoodRoute(destList: destList);
                      }),
                    ).then((value) {
                      // navigator.pop's response
                      if (value != null) {
                        setState(() {
                          print(value);
                        });
                      }
                    });
                  },
                  // Generally, material cards use onSurface with 12% opacity for the pressed state.
                  splashColor:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                  // Generally, material cards do not have a highlight overlay.
                  highlightColor: Colors.transparent,
                  child: Semantics(
                    //label: widget.destination.title,
                    child: TravelDestinationContent(
                        destination: widget.destination),
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

// class SectionTitle extends StatelessWidget {
//   const SectionTitle({
//     super.key,
//     required this.title,
//   });

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(title, style: Theme.of(context).textTheme.titleMedium),
//       ),
//     );
//   }
// }

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({super.key, required this.destination});

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final titleStyle = theme.textTheme.headlineSmall!.copyWith(
    //   color: Colors.white,
    // );
    final descriptionStyle = theme.textTheme.titleMedium!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160,
          child: Stack(
            children: [
              Positioned.fill(
                child: Ink.image(
                  image: AssetImage(destination.assetName),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
        Semantics(
          container: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
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
                    padding: const EdgeInsets.only(bottom: 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.volume_up_rounded),
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: Text(
                      destination.description,
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
        if (destination.cardType == CardType.standard)
          Padding(
            padding: const EdgeInsets.all(6),
            child: OverflowBar(
              alignment: MainAxisAlignment.start,
              spacing: 6,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('123'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('1223'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class DestRoute extends StatefulWidget {
  const DestRoute({super.key});

  @override
  State<DestRoute> createState() => _DestRouteState();
}

class _DestRouteState extends State<DestRoute> with RestorationMixin {
  int selectedIndex = 0;
  final RestorableBool _isSelected = RestorableBool(false);

  @override
  String get restorationId => 'cards_demo';

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
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 70) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 255, 184, 97),
      //   title: Text(''),
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: Icon(Icons.menu),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         tooltip: '',
      //       );
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.arrow_drop_down_circle,
      //       ),
      //       color: Color.fromRGBO(0, 0, 0, 0.749),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 114,
          ),
          Text(
            '好多想法...',
            style: TextStyle(
              fontFamily: 'Arial',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 36,
              height: 1.13,
              color: Color.fromRGBO(254, 130, 8, 1),
            ),
          ),
          GridView.count(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              mainAxisSpacing: 0,
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                for (final destination in destinations(context))
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: (destination.cardType == CardType.standard)
                          ? TravelDestinationItem(destination: destination)
                          : TappableTravelDestinationItem(
                              destination: destination)),
              ]),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.fmd_good),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.fast_rewind),
      //       label: 'Back',
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(Icons.group),
      //     //   label: 'Group',
      //     // ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(Icons.videocam),
      //     //   label: 'Meet',
      //     // ),
      //   ],
      //   currentIndex: selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.749),
      //   onTap: (int index) {
      //     switch (index) {
      //       case 0:
      //         break;
      //       case 1:
      //         Navigator.pop(context);
      //         break;
      //     }
      //     setState(
      //       () {
      //         selectedIndex = index;
      //       },
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() => {}),
      //   shape: CircleBorder(),
      //   isExtended: false,
      //   child: const Icon(Icons.replay_circle_filled),
      // ),
    );
  }
}
