import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_start_dkim230109/screens/screen_homepage.dart';
import 'package:test_start_dkim230109/firestore_page.dart';

//import 'package:test_bbs0_dkim221229/write.dart';



class BBSHomePage extends StatefulWidget {
//  const BBSHomePage({super.key key, required this.title});
//  const BBSHomePage({super.key, this.title});
//  final String title;

  @override
  State<BBSHomePage> createState() => _BBSHomePageState();
}

class _BBSHomePageState extends State<BBSHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bulletin Board in your Country'),
      ),

      body:
      Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.fromLTRB(20, 10, 10, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //   const Text('각 나라별로 게시판 서비스를 제공합니다...'
              //),
              Image.asset('assets/images/worldmap.png'),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 290,
                width: 350,
                padding: EdgeInsets.all(10),
                child: Text('중요 공지사항 등 활용...'),
                //      decoration: BoxDecoration(
                color: Colors.indigo.shade100,
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(
//              context, CupertinoPageRoute(builder: (context) => WritePage()));
              context, CupertinoPageRoute(builder: (context) => FireStorePage()));
        },
        //       tooltip: '메모를 추가하려면 클릭하세요',
        label: Text('시작 (Start)',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color:Colors.white)),
        icon: Icon(Icons.add),
      ),
    );
  }
}