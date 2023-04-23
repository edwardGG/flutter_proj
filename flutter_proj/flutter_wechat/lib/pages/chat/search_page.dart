import 'package:flutter/material.dart';
import 'package:flutter_wechat/pages/chat/search_bar.dart';
import 'package:flutter_wechat/pages/const.dart';

import 'chat_model.dart';

class SearchPage extends StatefulWidget {
  final List<ChatModel> chatDatas;

  const SearchPage({super.key, required this.chatDatas});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ChatModel> _models = [];
  String _searchStr = '';

  void _searchData(String text){
    if (text.length == 0) {
      _models = [];
    }
    else
    {
        _models.clear();
        for (int i = 0; i < widget.chatDatas.length; i++){
          if (widget.chatDatas[i].name.contains(text)){
            _models.add(widget.chatDatas[i]);
          }
        }
    }
    _searchStr = text;
    setState(() {});
  }

  Widget _title(String name){
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black);
    TextStyle highLightStyle = TextStyle(fontSize: 16, color: Colors.green);

    List<TextSpan> spans = [];
    List<String> strs = name.split(_searchStr);
    for (int i = 0; i < strs.length; i++) {
      String str = strs[i];
      if (str == '' && i < strs.length-1) {
        spans.add(TextSpan(text: _searchStr, style: highLightStyle));
      }
      else
      {
        spans.add(TextSpan(text: str, style: normalStyle));
        if (i < strs.length-1) {
          spans.add(TextSpan(text: _searchStr, style: highLightStyle));
        }
      }
    }

    return RichText(
      text: TextSpan(
        children: spans,
      ),
    );
  }

  Widget _itemForRow(BuildContext context, int index){
    return ListTile(
      title: _title(_models[index].name),
      subtitle: Container(height: 20, width: 20, child: Text(_models[index].message, overflow: TextOverflow.ellipsis,),),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_models[index].imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SearchBar(onChanged: (String str){
              _searchData(str);
            }),
            Expanded(
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: NotificationListener(
                    onNotification: (ScrollNotification note) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        return true;
                    }, child: ListView.builder(
                    itemCount: _models.length,
                    itemBuilder: _itemForRow,
                  ),

                  )
              ),
              flex: 1,
            ),
          ],
        ),
    );
  }


}


