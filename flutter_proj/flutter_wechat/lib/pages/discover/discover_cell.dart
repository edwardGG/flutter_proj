import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String imageName;
  final String? subImageName;

  const DiscoverCell(
      {super.key,
      required this.title,
      this.subTitle,
      required this.imageName,
      this.subImageName})
      : assert(title != null, 'title不能为空'),
        assert(imageName != null, 'imageName');



  @override
  State<StatefulWidget> createState() {
    return _DiscoverCellState();
  }
}

class _DiscoverCellState extends State<DiscoverCell> {
  Color _currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                DiscoverChildPage(title: widget.title)));

        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _currentColor = Colors.grey;
        });
      },
      onTapCancel: () {
        setState(() {
          _currentColor = Colors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),
        color: _currentColor,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Image(
                        width: 20,
                        height: 20,
                        image: AssetImage(widget.imageName)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(widget.title)
                  ],
                )),
            Container(
              child: Row(
                children: <Widget>[
                  Text(widget.subTitle ?? ''),
                  widget.subImageName != null
                      ? Container(
                          child: Image(
                            image: AssetImage(
                              widget.subImageName ?? '',
                            ),
                            width: 15,
                            height: 15,
                          ),
                          margin: EdgeInsets.only(left: 10, right: 10),
                        )
                      : Container(),
                  Image(width: 15, image: AssetImage('images/icon_right.png'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
