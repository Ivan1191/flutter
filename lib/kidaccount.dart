import 'package:flutter/material.dart';
import 'startplan.dart';
import 'location.dart';

class KidAccount extends StatefulWidget {
  @override
  _KidAccountState createState() => _KidAccountState();
}

class _KidAccountState extends State<KidAccount> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var b = 8;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 204, 128),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 190),
            const Text(
              '你的小孩',
              style: TextStyle(
                color: Color.fromARGB(255, 254, 130, 8),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 75),
            Image.asset(
              'images/kidinfo.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 30),
            Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 255, 248, 225),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationPage()),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 254, 130, 8),
                ),
                iconSize: 30.0,
                splashRadius: 20.0,
                padding: const EdgeInsets.all(10.0),
                constraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
              ),
            ),
            const SizedBox(height: 245),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 248, 225),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartPlan()),
                      );
                    },
                    icon: const Icon(Icons.arrow_right_alt_rounded,
                        color: Color.fromARGB(255, 254, 130, 8)),
                    iconSize: 30.0,
                    splashRadius: 20.0,
                    padding: const EdgeInsets.all(10.0),
                    constraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
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
