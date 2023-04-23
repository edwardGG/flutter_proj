import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/friends/friends_page.dart';
import 'package:flutter_wechat/pages/mine_page.dart';

import 'chat/chat_page.dart';
import 'package:flutter_wechat/pages/discover/discover_page.dart';

class RootPage extends StatefulWidget {
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(
      initialPage: 0,
    );
    List<Widget> pages = [ChatPage(), FriendsPage(), DiscoverPage(), MinePage()];
    return Container(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Image(width: 20, height: 20 ,image: AssetImage('images/tabbar_chat.png')), activeIcon: Image(width: 20, height: 20 ,image: AssetImage('images/tabbar_chat_hl.png')), label: '微信'),
            BottomNavigationBarItem(icon: Image(width: 20, height: 20 ,image: AssetImage('images/tabbar_friends.png')), activeIcon: Image(width: 20, height: 20 ,image: AssetImage('images/tabbar_friends_hl.png')), label: '通讯录'),
            BottomNavigationBarItem(icon: Image(width: 20, height: 20 ,image: AssetImage('images/tabbar_discover.png')), activeIcon: Image(width: 20, height: 20 ,image: AssetImage('images/tabbar_discover_hl.png')), label: '发现'),
            BottomNavigationBarItem(icon: Image(width: 20, height: 20 ,image: AssetImage('images/tabbar_mine.png')), activeIcon: Image(width: 20, height: 20 ,image: AssetImage('images/tabbar_mine_hl.png')), label: '我')
          ],
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.green,
            currentIndex: _currentIndex,
            selectedFontSize: 12.0,
            onTap: (int index){
              _currentIndex = index;
              setState(() {});
              _pageController.jumpToPage(index);
            },),
          body: PageView(
            // onPageChanged: (int index){
            //   _currentIndex = index;
            //   setState(() {
            //
            //   });
            // },
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: pages,
          ),
        ),

    );
  }
}


