import 'package:flutter/material.dart';
import 'package:test_start_dkim230109/firestore_page.dart';

//class WritePage extends StatelessWidget {
//  const WritePage({Key? key}) : super(key: key);

//  @override
//  Widget build(BuildContext context) {
//    return Container(color: Colors.blue);
//  }
//}

class WritePage extends StatefulWidget {
  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
//  DataBase dataBase = new DataBase();

  String title = ' '; //제목
  String content = ' '; //내용

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bulletin Board in your Country"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: TextField(
                    onChanged: (String text) {
                      title = text;
                    },
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: '제목을 적어주세요',
                      border: OutlineInputBorder(),
                      labelText: "제목을 입력하세요.",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: TextField(
                    onChanged: (String text) {
                      content = text;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 16,
                    decoration: InputDecoration(
                      hintText: '내용을 적어주세요',
                      border: OutlineInputBorder(),
                      labelText: "내용을 입력하세요.",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: TextField(
                    onChanged: (String text) {
                      content = text; // 임시로..번역...Y 키 판단...
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: '번역어(국가)를 선택하세요...UI 진행중',
                      border: OutlineInputBorder(),
                      labelText: "[*] 번역을 원하면 'Y'를...개발중!",
                    ),
                  ),
                ),


                //               Padding(
                //                 padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
                ButtonBar(
                  children:<Widget> [
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: const EdgeInsets.all(06),
                        textStyle: const TextStyle(fontSize: 15),
                        backgroundColor: Colors.indigo,
                        primary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        print('Button pressed');
                      },
                      child: Text('등록'),
                    ),
                  ],
                ),
                //             ),
                //                  child: FlatButton(
//                    onPressed: () {
//                    DataBase dataBase = new DataBase(); )
//                    var now = DateTime.now();//네트워크상 시간 (스마트폰의 위치에 따라 시간대가 바뀜
//                    dataBase.add(title, content, '$now'); //제목 내용으로 저장
//                    Navigator.pop(context);
//                    },
//                 child: Text(
//                   '글쓰기',
//                    style: TextStyle(color: Colors.white),
//                 ),
//                    color: Colors.blue,
//                    height: 50,
//                    minWidth: 400,
//                  ),

                //              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
