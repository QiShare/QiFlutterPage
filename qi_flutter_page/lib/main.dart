import 'package:flutter/material.dart';
import 'QiListView.dart';

// 应用程序执行入口
void main(List<String> args) {
  // 初始化指定的Widget，并把Widget渲染效果绘制到屏幕上
  // runApp(MaterialApp(
  //   title: '安卓切换任务管理时任务名',
  //   home: QiStatelessApp(),
  // ));

  runApp(MaterialApp(
    title: '安卓切换任务管理时任务名',
    home: QiStatefulApp(),
  ));
}

class QiStatefulApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QiState();
  }
}

class QiState extends State<QiStatefulApp> {
  double _listViewWidth;
  double _listViewHeight;
  String _centerString = 'Hello World';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _listViewWidth = MediaQuery.of(context).size.width;
    _listViewHeight = MediaQuery.of(context).size.height * 0.4;
    // Scaffold：脚手架 用于展示基础框架结构，如appBar、body、bottomNavigationBar
    return Scaffold(
      // AppBar：相当于iOS 的导航栏
      appBar: AppBar(
        // 导航栏上的显示内容
        title: Text('App Bar 展示内容'),
      ),
      // body：AppBar及BottomNavigationBar之间展示的内容
      body: Column(
        children: <Widget>[
          Text(_centerString),
          Image.network(
              'https://upload.jianshu.io/collections/images/1673367/8.png?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
          FlatButton(
            child: Text(
              'FlatButton',
              style: TextStyle(
                backgroundColor: Colors.yellow,
              ),
            ),
            onPressed: () {
              print('press FlatButton');
              setState(() {
                _centerString = 'Change Self';
              });
            },
          ),
          GestureDetector(
            child: Text(
              'GestureDetector',
              style:
                  TextStyle(color: Colors.red, backgroundColor: Colors.yellow),
            ),
            onTap: () {
              print('GestureDetector');
            },
          ),
          Container(
            color: Colors.black12,
            width: _listViewWidth,
            height: _listViewHeight,
            child: ListView(
              children: <Widget>[
                // 列表条目
                ListTile(
                  // 标题
                  title: Text('ListTile1'),
                  // 子标题
                  subtitle: Text('subtile1'),
                  // 标题左侧的Widget
                  leading: Icon(Icons.security),
                  // 标题右侧的Widget
                  trailing: Icon(Icons.share),
                  onTap: () {
                    print('ListTile1');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('ListTile2'),
                  subtitle: Text('subtile2'),
                  leading: Icon(Icons.photo),
                  trailing: Icon(Icons.share),
                  onTap: () {
                    print('ListTile2');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('ListTile3'),
                  subtitle: Text('subtile3'),
                  leading: Icon(Icons.phone_iphone),
                  trailing: Icon(Icons.share),
                  onTap: () {
                    print('ListTile3');
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('跳转到个人信息'),
                  leading: Icon(Icons.phone_android),
                  trailing: Icon(Icons.share),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QiListViewPage('iOS Dev');
                    })).then((onValue) {
                      print('回传的数据：$onValue');
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Item1')),
          BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Item2')),
        ],
        onTap: (tappedIndex) {
          print('tappedIndex：$tappedIndex');
        },
      ),
    );
  }
}

// 创建一个继承自Stateless的Widget
class QiStatelessApp extends StatelessWidget {
  // 重写build 方法，build 方法返回值为Widget类型，返回内容为屏幕上显示内容。
  @override
  Widget build(BuildContext context) {
    // MaterialApp 控制界面风格为安卓风格
    // CupertinoApp 界面风格为iOS 风格
    // Scaffold：脚手架 用于展示基础框架结构，如appBar、body、bottomNavigationBar
    return Scaffold(
      // AppBar：相当于iOS 的导航栏
      appBar: AppBar(
        // AppBar上的显示内容
        // Text 用于展示文本内容，相当于iOS中的UILabel
        title: Text('App Bar 展示内容'),
      ),
      // body：AppBar及BottomNavigationBar之间展示的内容
      // Center 是用于把子Widget 居中的Widget
      body: Center(
        child: Text('Hello World'),
      ),
      // 相当于iOS 中的UITabBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('工作')),
          BottomNavigationBarItem(
              icon: Icon(Icons.security), title: Text('安全')),
        ],
        onTap: (tappedIndex) {
          print('tappedIndex：$tappedIndex');
        },
      ),
    );
  }
}

// // 创建一个继承自Stateless的Widget
// class QiStatelessApp extends StatelessWidget {
//   // 重写build 方法，build 方法返回值为Widget类型，返回内容为屏幕上显示内容。
//   @override
//   Widget build(BuildContext context) {
//     // MaterialApp 控制界面风格为安卓风格
//     // CupertinoApp 界面风格为iOS 风格
//     return MaterialApp(
//       title: '安卓切换任务管理时任务名',
//       // debugShowCheckedModeBanner: false,
//       // Scaffold：脚手架 用于展示基础框架结构，如appBar、body、bottomNavigationBar
//       home: Scaffold(
//         // AppBar：相当于iOS 的导航栏
//         appBar: AppBar(
//           // AppBar上的显示内容
//           // Text 用于展示文本内容，相当于iOS中的UILabel
//           title: Text('App Bar 展示内容'),
//         ),
//         // body：AppBar及BottomNavigationBar之间展示的内容
//         // Center 是用于把子Widget 居中的Widget
//         body: Center(
//           child: Text('Hello World'),
//         ),
//         // 相当于iOS 中的UITabBar
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('工作')),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.security), title: Text('安全')),
//           ],
//           onTap: (tappedIndex) {
//             print('tappedIndex：$tappedIndex');
//           },
//         ),
//       ),
//     );
//   }
// }
