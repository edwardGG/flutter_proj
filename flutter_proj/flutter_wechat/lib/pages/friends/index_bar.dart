import 'package:flutter/material.dart';
import '../const.dart';

const INDEX_WORDS = [
  '🔍',
  '⭐️',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

class IndexBar extends StatefulWidget {
  final void Function(String str)? indexBarCallback;

  const IndexBar({super.key, this.indexBarCallback});

  @override
  State<IndexBar> createState() => _IndexBarState();
}

int getIndex(BuildContext context, Offset globalPosition) {
  RenderBox box = context.findRenderObject() as RenderBox;
  double y = box.globalToLocal(globalPosition).dy; //坐标转换，算y值
  var itemHeight = ScreenHeight(context) / 2 / INDEX_WORDS.length; //每个item的高度
  int index = (y ~/ itemHeight).clamp(0, INDEX_WORDS.length-1); // ～取整
  print('当前选中的s是： ${INDEX_WORDS[index]}');
  return index;
}


class _IndexBarState extends State<IndexBar> {

  var _selectorIndex = 0;

  Color _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;

  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indicatorHidden = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(Expanded(
        child: Text(
          INDEX_WORDS[i],
          style: TextStyle(fontSize: 10, color: _textColor),
        ),
      ));
    }

    return Positioned(
        right: 0.0,
        height: ScreenHeight(context) / 2,
        top: ScreenHeight(context) / 8,
        width: 120,
        child: Row(
          children: [
            Container(
              alignment: Alignment(0, _indicatorY),
              width: 100,
              child: _indicatorHidden ? null : Stack(
              alignment: Alignment(-0.2, 0),
              children: [
                Image(image: AssetImage('images/气泡.png'), width: 60,),
                Text(_indicatorText, style: TextStyle(
                    fontSize: 35,
                    color: Colors.white
                ),)
              ],
            ),
            ),
            GestureDetector(
              onVerticalDragUpdate: (DragUpdateDetails details) {
                int index = getIndex(context, details.globalPosition);
                if (getIndex(context, details.globalPosition) != _selectorIndex) {
                  _selectorIndex = index;
                  widget.indexBarCallback!(INDEX_WORDS[_selectorIndex]);
                  setState(() {});
                }
                // 内部气泡显示
                _indicatorText = INDEX_WORDS[index];
                _indicatorY = 2.2/(INDEX_WORDS.length-1)*index-1.1;
                _indicatorHidden = false;
                setState(() {});
              },

              onVerticalDragDown: (DragDownDetails details) {
                int index = getIndex(context, details.globalPosition);
                if (getIndex(context, details.globalPosition) != _selectorIndex) {
                  _selectorIndex = index;
                  setState(() {});
                  widget.indexBarCallback!(INDEX_WORDS[_selectorIndex]);
                }

                _bkColor = Color.fromRGBO(1, 1, 1, 0.5);
                _textColor = Colors.white;

                _indicatorText = INDEX_WORDS[index];
                _indicatorY = 2.2/(INDEX_WORDS.length-1)*index-1.1;
                _indicatorHidden = false;
                setState(() {});
              },

              onVerticalDragEnd: (DragEndDetails details) {
                _indicatorHidden = true;
                _bkColor = Color.fromRGBO(1, 1, 1, 0.0);
                _textColor = Colors.black;
                _selectorIndex = -1;
                setState(() {});
              },
              child: Container(
                color: _bkColor,
                child: Column(
                  children: words,
                ),
              ),
            )
          ],
        ) //悬浮检索控件
    );
  }
}
