import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/chat/search_bar.dart';
import 'package:flutter_wechat/pages/const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

PopupMenuItem<String> _buildItem(String imageAsset, String title) {
  return PopupMenuItem(child: Row(
    children: [
      Image(image: AssetImage(imageAsset), width: 20,),
      SizedBox(width: 20,),
      Text(title, style: TextStyle(color: Colors.white),),
    ],
  ));
}

List<PopupMenuItem<String>> _buildPopupMenuItem(BuildContext context) {
  return <PopupMenuItem<String>>[
    _buildItem('images/发起群聊.png', '发起群聊'),
    _buildItem('images/添加朋友.png', '添加朋友'),
    _buildItem('images/扫一扫1.png', '扫一扫'),
    _buildItem('images/收付款.png', '收付款'),
  ];
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin<ChatPage> {
  bool _cancelConnect = false;
  List<ChatModel> _datas = [];

  Function get onError => (err){
    print(err);
  };

  Function get timeout => (err){
    _cancelConnect = true;
    print('timeout:${timeout}');
  };

  @override
  void initState() {
    super.initState();
    // final chat = {
    //   'name' : 'zhangsan',
    //   'message' : 'chifanlema'
    // };

    //map转json
    // final chatJson = json.encode(chat);
    // print(chatJson);

    //json转map
    // final newChat = json.decoder.convert(chatJson);
    // print(newChat);

    getDatas().then((List<ChatModel>? datas) {
      if (!_cancelConnect){
        setState(() {
          _datas = datas!;
        });
      }
    }).catchError(onError).whenComplete(() => (){
      print('finish');
    }).timeout(Duration(seconds: 8)).catchError(timeout);
  }

  Future<List<ChatModel>?> getDatas() async {
    _cancelConnect = false;
    var url = 'http://rap2api.taobao.org/app/mock/224518/api/chat/list';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseBody = json.decoder.convert(response.body);

      //转换模型数组
      List<ChatModel> chatList = responseBody['chat_list'].map<ChatModel>(
              (item) {
            return ChatModel.fromJson(item);
          }).toList();
      return chatList;
    }
    else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }

  Widget _buildItemForRow(BuildContext context, int index) {
    if (index == 0) {
      return SearchCell(chatDatas: _datas,);
    }
      return ListTile(
        title: Text(_datas[index-1].name),
        subtitle: Container(height: 20, width: 20, child: Text(_datas[index-1].message, overflow: TextOverflow.ellipsis,),),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_datas[index-1].imageUrl),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: WechatThemeColor,
          //title放中间
          centerTitle: true,
          title: Text('微信'),
          actions: [
            Container(
              child: PopupMenuButton(
                offset: Offset(0, 50.0),
                padding: EdgeInsets.only(right: 10),
                itemBuilder: _buildPopupMenuItem,
                child: Image(image: AssetImage('images/圆加.png'), width: 30,),
              ),
              margin: EdgeInsets.only(right: 10),
            ),
          ],
        ),
        // futureBuilder
        // body: FutureBuilder(
        //   future: getDatas(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot){
        //     if (snapshot.connectionState == ConnectionState.waiting){
        //       return Center(child: Text('Loading'),);
        //     }
        //     else
        //     {
        //       return ListView(
        //         children: snapshot.data.map<Widget>(
        //             (item){
        //               return ListTile(
        //                 title: Text(item.name),
        //                 subtitle: Container(height: 20, width: 20, child: Text(item.message, overflow: TextOverflow.ellipsis,),),
        //                 leading: CircleAvatar(
        //                   backgroundImage: NetworkImage(item.imageUrl),
        //                 ),
        //               );
        //             }
        //         ).toList(),
        //       );
        //     }
        //   },
        // ) // Fur
        body: Container(
          child: _datas.length == 0 ? Center(child: Text('Loading'),) : ListView.builder(
            itemCount: _datas.length+1,
            itemBuilder: _buildItemForRow,
          ),
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
