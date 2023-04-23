import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  State<MinePage> createState() => _MinePage();
}

class _MinePage extends State<MinePage> {
  Widget _headerWidget() {
    return Container(
      height: 200,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(
          top: 100,
        ),
        padding: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                      image: AssetImage('images/Hank.png'), fit: BoxFit.cover),
                ),
              ), // 头像
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ed',
                        style: TextStyle(fontSize: 22),
                      ),
                    ), // 微信昵称
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '微信号:123456',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Image(
                            image: AssetImage('images/icon_right.png'),
                            width: 15,
                          )
                        ],
                      ),
                    ), // 账号
                  ],
                ),
              )) // 右边部分
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(220, 220, 220, 1),
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: <Widget>[
                    _headerWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(title: '支付', imageName: 'images/微信支付.png'),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      title: '收藏',
                      imageName: 'images/微信收藏.png',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                    DiscoverCell(
                      title: '相册',
                      imageName: 'images/微信相册.png',
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                    DiscoverCell(title: '卡包', imageName: 'images/微信卡包.png'),
                    Row(
                      children: <Widget>[
                        Container(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ],
                    ),
                    DiscoverCell(
                      title: '表情',
                      imageName: 'images/微信表情.png',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DiscoverCell(
                      title: '设置',
                      imageName: 'images/微信设置.png',
                    ),
                  ],
                )),
          ), //列表
          Container(
            margin: EdgeInsets.only(top: 40, right: 10),
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // GestureDetector(
                //   onTap: () {
                Image(image: AssetImage('images/相机.png')),
                //     setState(() {
                //       print('打开相机');
                //     });
                //   },
                // )
              ],
            ),
          ), //相机
        ],
      )),
    );
  }
}
