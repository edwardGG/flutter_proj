import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/const.dart';
import 'package:flutter_wechat/pages/discover/discover_cell.dart';

class DiscoverPage extends StatefulWidget {

  @override
  State<DiscoverPage> createState() => _DiscoverPage();
}

class _DiscoverPage extends State<DiscoverPage> {
  Color _themeColor = WechatThemeColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeColor,
        centerTitle: true,
        title: const Text('发现'),
        elevation: 0.0,
      ),
      body: Container(
        color: _themeColor,
        height: 800,
        child: ListView(
          children: <Widget>[
            DiscoverCell(title: '朋友圈', imageName: 'images/朋友圈.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '扫一扫', imageName: 'images/扫一扫2.png'),
            Row(
              children: <Widget>[
                Container(color: Colors.grey,height: 1,),
              ],
            ),
            DiscoverCell(title: '摇一摇', imageName: 'images/摇一摇.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '看一看', imageName: 'images/看一看icon.png'),
            Row(
              children: <Widget>[
                Container(color: Colors.grey,height: 1,),
              ],
            ),
            DiscoverCell(title: '搜一搜', imageName: 'images/搜一搜.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '附近的人', imageName: 'images/附近的人icon.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '购物', imageName: 'images/购物.png', subTitle: '618限时特惠', subImageName: 'images/badge.png',),
            Row(
              children: <Widget>[
                Container(color: Colors.grey,height: 1,),
              ],
            ),
            DiscoverCell(title: '游戏', imageName: 'images/游戏.png'),
            SizedBox(height: 10,),
            DiscoverCell(title: '小程序', imageName: 'images/小程序.png'),

          ],
        ),
      )
    );
  }
}
