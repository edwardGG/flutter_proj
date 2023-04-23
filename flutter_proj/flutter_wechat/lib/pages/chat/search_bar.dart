import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/chat/search_page.dart';
import 'package:flutter_wechat/pages/const.dart';

import 'chat_model.dart';

class SearchCell extends StatelessWidget {
  final List<ChatModel> chatDatas;

  const SearchCell({super.key, required this.chatDatas});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context)=> SearchPage(chatDatas: chatDatas,)
        ));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 44,
        color: WechatThemeColor,
        child: Stack(
          children: [
            Container(
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/放大镜b.png'), width: 15, color: Colors.grey,),
                  Text('  搜索', style: TextStyle(fontSize: 15, color: Colors.grey),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String > onChanged;
  const SearchBar({super.key, required this.onChanged});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textEditController = TextEditingController();
  bool _showClearBtn = false;
  _onChange(String text){
    widget.onChanged(text);
    if (text.length > 0) {
      _showClearBtn = true;
      setState(() {});
    }
    else
    {
      _showClearBtn = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WechatThemeColor,
      child: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            height: 44,
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: ScreenWidth(context)-40,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left:5, right:5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('images/放大镜b.png'),
                        color:Colors.grey,
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _textEditController,
                          onChanged: _onChange,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            // fillColor: Colors.red,
                            //     filled: true,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 5, bottom: 12),
                              hintText: '搜索'
                          ),
                        ),
                        flex: 1,),
                      _showClearBtn ? GestureDetector(
                        child: Icon(Icons.cancel, size: 20, color: Colors.grey) ,
                        onTap: (){
                          _textEditController.clear();
                          _onChange('');
                        },
                      ): Container(),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child:  Text('取消',),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
