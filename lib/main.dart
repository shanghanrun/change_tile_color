import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    const MaterialApp(
      home: PositionedTile(),
    ),
  );
}

class PositionedTile extends StatefulWidget {
  const PositionedTile({super.key});

  @override
  State<PositionedTile> createState() => _PositionedTileState();
}

class _PositionedTileState extends State<PositionedTile> {
  List<Widget> tiles = [
    StatefulColorfulTile(key: UniqueKey()), // 저절로 유니크 키 생성
    StatefulColorfulTile(key: UniqueKey()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tiles,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.double_arrow_rounded),
        onPressed: () {
          swapTiles();
          showToast();
        },
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0)); // 1번 인덱스에, 0번요소를 삭제하고 그걸 넣기
    });
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({super.key});

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  // late Color myColor = getRandomColor();
  @override
  Widget build(BuildContext context) {
    Color myColor = getRandomColor();
    return Container(
      color: myColor,
      // child: const Padding(padding: EdgeInsets.all(70)),
      child: const SizedBox(height: 70, width: 70),
    );
  }

  getRandomColor() {
    var r = Random();
    return Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255));
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg: 'Color has been changed',
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black, // 이상하게 이것이 안 먹힌다.
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
  );
}
