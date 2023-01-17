import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'firestore_page.dart';
import 'package:ntp/ntp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_start_dkim230109/write.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';






//void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.teal,
//      ),
//      home: TransPage(),
//    );
//  }
//}

class TransPage extends StatefulWidget {
  @override
  _TransPageState createState() => _TransPageState();
}

class _TransPageState extends State<TransPage> {

  CollectionReference product = FirebaseFirestore.instance.collection("bbs0");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();

  GoogleTranslator translator = GoogleTranslator();

  final input = "The Good Times are Coming..."; // 번역이 되어야 할 문자열 (테스트)

  var output1;
  var output2;

  String? dropdownValue;

  static const Map<String, String> lang = {
    "대한민국": "ko",
    "미국": "en",
    "중국": "zh-cn",
    "일본": "ja",
    "베트남": "vi",
    "우즈베키스탄": "uz",
    "인도네시아": "id",
    "미얀마": "my"
  };

  void trans1() {
    translator
        .translate(nameController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output1 = value;
      });
    });
  }

  void trans2() {
    translator
        .translate(priceController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output2 = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시판 (Bulletin Board)"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  style: TextStyle(fontSize: 24),
                  controller: nameController,
                  maxLines: 1,
                  onTap: () {
                    trans1();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '제목을 입력하십시오',
                      labelStyle: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  style: TextStyle(fontSize: 24),
                  controller: priceController,
                  maxLines: 6,
                  onTap: () {
                    trans2();
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '내용을 입력하십시오',
                      labelStyle: TextStyle(fontSize: 16)),
                ),

              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            onPressed: () async {
              print("파이어베이스 원본 등록");
              final String name = nameController.text;
              final String price = priceController.text;

              DateTime currentTime = await NTP.now();
              currentTime = currentTime.toUtc().add(Duration(hours: 9));

//                      var now = DateTime.now();
              await product.add({'name': name, 'price': price, 'daytime': '$currentTime'});
//              await product.add({'name': name, 'price': price});
              nameController.text = "";
              priceController.text = "";
              Navigator.of(context).pop();
            },
            child: Text('등록 (Registration)'),
          ),

          Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("     Select Language here =>",
                style:TextStyle(color: Colors.deepPurple),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 08,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 3                                                                                                              ,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    print(dropdownValue);
                    trans1();
                    trans2();
                    print(dropdownValue);
                  });
                },

                items: lang
                    .map((string, value) {
                  return MapEntry(
                    string,
                    DropdownMenuItem<String>(
                      value: value,
//                        child: Text(string),
                      child: Text(string),
                    ),
                  );
                })
                    .values
                    .toList(),
              ),
            ],
          ),

          SizedBox(
            height: 50,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(00, 00, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Translated Text',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    output1 == null ? " " : output1.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    output2 == null ? " " : output2.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}