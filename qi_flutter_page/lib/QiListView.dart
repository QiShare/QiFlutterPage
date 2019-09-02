import 'package:flutter/material.dart';

class QiListViewPage extends StatefulWidget {
  final String nickname;
  QiListViewPage(this.nickname);
  @override
  State<StatefulWidget> createState() {
    return QiListViewState(this.nickname);
  }
}

class QiListViewState extends State<QiListViewPage> {
  final String nickname;
  QiListViewState(this.nickname);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('姓名'),
            trailing: Text(this.nickname ?? '昵称'),
          ),
          ListTile(
            title: Text('性别'),
            trailing: Text('男'),
          ),
          ListTile(
            title: Text('地区'),
            trailing: Text('河北'),
          ),
          ListTile(
            title: Text('手机'),
            trailing: Text('176********'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: '回传昵称',
        child: Text('Pop'),
        onPressed: () {
          Navigator.pop(context, 'FlutterDev');
        },
      ),
    );
  }
}
