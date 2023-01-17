import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:test_bbs0_dkim221229/write.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:ntp/ntp.dart';
import 'package:translator/translator.dart';
import 'translator_page.dart';

class FireStorePage extends StatefulWidget {
  const FireStorePage({Key? key}) : super(key: key);

  @override
  State<FireStorePage> createState() => _FireStorePageState();
}

class _FireStorePageState extends State<FireStorePage> {
  CollectionReference product = FirebaseFirestore.instance.collection("bbs0");

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();

  var output1;
  var output2;


  String? dropdownValue;

  static const Map<String, String> lang = {
    " 대한민국": "ko",
    " 미국": "en",
    " 중국": "zh-cn",
    " 일본": "ja",
    " 베트남": "vi",
    " 우즈베키스탄": "uz",
    " 인도네시아": "id",
    " 미얀마": "my"
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



  Future<void> _update(DocumentSnapshot documentSnapshot) async{
    nameController.text = documentSnapshot['name'];
    priceController.text = documentSnapshot['price'];

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: '제목'
                  ),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      labelText: '내용'
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async{
                    final String name = nameController.text;
                    final String price = priceController.text;
                    await product
                        .doc(documentSnapshot.id)
                        .update({"name": name, "price": price});
                    //                       .update({"name": name});
                    nameController.text = "";
                    priceController.text = "";
                    Navigator.of(context).pop();
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }





  Future<void> _create() async{
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: Padding(
              //                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              padding: EdgeInsets.only(
                  top: 00,
                  left: 10,
                  right: 10,
//                      bottom: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom
              ),
//                  child: SingleChildScrollView(
//                    child: Container(
//                      color:Colors.grey,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:30,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 16),
                    controller: nameController,
                    onTap: () {
                      trans1();
                    },
//                            keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '제목을 입력하세요',
                        labelStyle: TextStyle(fontSize: 12)
                    ),
                  ),
                  SizedBox(
                    height:6,
                  ),
                  TextField(
                    style: TextStyle(fontSize: 16),
                    controller: priceController,
                    onTap: () {
                      trans2();
                    },
//                            keyboardType: TextInputType.multiline,
                    maxLines:6,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '내용을 입력하세요',
                        labelStyle: TextStyle(fontSize: 12)
                    ),
                  ),

                  SizedBox(
                    height:20,
                  ),

                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Select Language here ->",
                        style:TextStyle(color: Colors.deepPurple),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 02,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2                                                                                                              ,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            print(dropdownValue);
                            trans1();
                            trans2();
                          });
                        },
                        items: lang
                            .map((string, value) {
                          return MapEntry(
                            string,
                            DropdownMenuItem<String>(
                              value: value,
                              child: Text(string),
                            ),
                          );
                        })
                            .values
                            .toList(),
                      ),
                    ],
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
              //         ),
              //                 ),
            ),
          );
        }
    );
  }












  //                          ElevatedButton(
  //                            onPressed: () async{
  //                              print("파이어베이스에 등록");
  //                              final String name = nameController.text;
  //                              final String price = priceController.text;

  //                              DateTime currentTime = await NTP.now();
  //                              currentTime = currentTime.toUtc().add(Duration(hours: 9));

//                      var now = DateTime.now();
  //                             await product.add({'name': name, 'price': price, 'daytime': '$currentTime'});
  //                              nameController.text = "";
  //                              priceController.text = "";
  //                              Navigator.of(context).pop();
  //                            },
  //                            child: Text('등록 (Registration)'),
  //                          ),


  //                 ElevatedButton(
  //                   onPressed: () async{
  //                     print("파이어베이스에 등록");
  //                     final String name = nameController.text;
  //                     final String price = priceController.text;

  //                     DateTime currentTime = await NTP.now();
  //                     currentTime = currentTime.toUtc().add(Duration(hours: 9));

//                      var now = DateTime.now();
//                      await product.add({'name': name, 'price': price, 'daytime': '$currentTime'});
//                      nameController.text = "";
//                      priceController.text = "";
//                      Navigator.of(context).pop();
//                    },
//                    child: Text('등록 (Registration)'),
//                  ),

//                      ], // children 그 다음에 TextFormField...
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          );
//      },
//    );
//  }

  Future<void> _delete(String productId) async{
    await product.doc(productId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulletin Board in your Country'),
      ),
      body: StreamBuilder(
        stream: product.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if(streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (contest, index) {
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                return Card(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['price']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              _update(documentSnapshot);
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: (){
                              _delete(documentSnapshot.id);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ) ,
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: (){
//          _create();

          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => TransPage()));
        },
        child: Icon(Icons.add),
      ) ,
    );
  }
}