import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_start_dkim230109/bulletin_board/bulletin_board_first_screen.dart';
import 'package:test_start_dkim230109/screens/screen_index.dart';
import 'package:test_start_dkim230109/chat_main.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _pageIndex = 0; // 페이지 정보

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kmall+',
          style: TextStyle(
              fontFamily: 'dkim',
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true, // 중앙 정렬 여부
        elevation: 6, // 상단바 그림자 정도
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){
              print('shopping cart button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('search button is clicked');
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //빈공간을 만들지 말자
          children: <Widget>[
            UserAccountsDrawerHeader(//메뉴 중에 사용자 헤드 메시지 부분
              accountName: Text('김대웅 D.KiM',
                style: TextStyle(
                    fontFamily: 'dkim',
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              accountEmail: Text('kdukim@naver.com'),
              currentAccountPicture: CircleAvatar( //이미지는 동그랗게 꾸며주고
                backgroundImage: AssetImage('assets/DKIM.jpg'),
                backgroundColor: Colors.white, // 배경은 화이트로, 투명색
              ),
              onDetailsPressed: (){ //더보기 화살표 버튼
                print('menu is clicked');
              },

              decoration: BoxDecoration(
                color: Colors.purple.shade100, //바탕색
                borderRadius: BorderRadius.only( // 사각형 이미지의 아래쪽을 동그랗게게
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),

              otherAccountsPictures: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/Facebook.png')
                ),

                CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/카카오톡.png')
                ),
              ],
            ),
            ListTile (
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('홈'),
              trailing: Icon(Icons.add),
              onTap:() {
                print('홈메뉴 클릭완료');
              },
            ),

            ListTile (
              leading: Icon(
                Icons.mic_none,
                color: Colors.grey[850],
              ),
              title: Text('공지사항'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('공지사항메뉴 클릭완료');
              },
            ),

            ListTile (
              leading: Icon(
                Icons.translate,
                //               color: Colors.grey[850],
                color: Colors.deepPurpleAccent,
              ),
              title: Text('언어 선택'),
              subtitle: Text('Selection language'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('언어 선택 메뉴 클릭완료');
              },
            ),

            ListTile (
              leading: Icon(
                Icons.info_outline,
                color: Colors.grey[850],
              ),
              title: Text('고객센터'),
              trailing: Icon(Icons.add),
              onTap: () {
                print('고객센터메뉴 클릭완료');
              },
            ),

            ListTile (
              leading: Icon(
                Icons.camera_alt,
                color: Colors.grey[850],
              ),
              title: Text('사진-아름다운 베트남 여인들'),

              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageView2()
                    )
                );
                //              print('베트남 클릭완료');
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),

      body:


      Center(
        child: Container(

          margin: EdgeInsets.all(06),
   //       padding: EdgeInsets.fromLTRB(20, 10, 10, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[
          //    Container(
//                HomePage(),
           //     width:200,
           //     height: 200,
           //     color: Colors.pink.shade200,
          //    ),
              Image.asset('assets/003c.png'),
              SizedBox(
                height: 8,
              ),
              Container(
                  margin: EdgeInsets.all(06),
                  color: Colors.white,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top:05),
                        width: 400,
                        height: 300,
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00A_1.jpg'),
                              ),
                              title: Text('요금충전 & Top Up'),
                              subtitle: Text('보다 값싸게... 개발 중'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00B_1.jpg'),
                              ),
                              title: Text('쇼핑 (Shopping)'),
                              subtitle: Text('구매에 대한 전체 흐름도 진행 중 '),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap:(){
                                print('게시판');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => IndexScreen(),
                                  ),
                                );
                              },
                            ),

                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00C_1.jpg'),
                              ),
                              title: Text('여행 & 티켓'),
                              subtitle: Text('세계로 세계로. 개발 중'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00D_1.jpg'),
                              ),
                              title: Text('해외 송금'),
                              subtitle: Text('보다 빠르고 저렴한 수수료. 개발 중'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00E_1.jpg'),
                              ),
                              title: Text('게시판'),
                              subtitle: Text('전체 및 각 나라별 게시판 사용'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap:(){
                                print('게시판');
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => BBSHomePage(),
                                  ),
                                );
                              },
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00F_1.jpg'),
                              ),
                              title: Text('채팅'),
                              subtitle: Text('어떻게 활용할 것인가?  당근 마켓 유사 서비스 개인 거래 이용?'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap:(){
                                //        _pushScreen(context,TouchDetectionScreen());
//                        _pushScreen(context,BBSHomePage());
                                print('채팅');
                              },
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00G_1.jpg'),
                              ),
                              title: Text('공지 사항'),
                              subtitle: Text('대한민국 법무부,각국 주한 대사관 공지사항, 도우미 정보...'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap:(){
//                        _pushScreen(context, UpdateListViewScreen());
                                print('공지 사항');
                              },
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00H_1.jpg'),
                              ),
                              title: Text('법률 상담'),
                              subtitle: Text('이럴 때 변호사를 찾아 줍니다...'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap:(){
//                        _pushScreen(context, UpdateListViewScreen());
                                print('법률 상담 사항');
                              },
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/00I_1.jpg'),
                              ),
                              title: Text('to 파워콜'),
                              subtitle: Text('의견 이나 건의 사항을 부탁합니다'),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap:(){
//                        _pushScreen(context, UpdateListViewScreen());
                                print('파워콜 사항');
                              },
                            ),

                          ],
                        ),
                      )
                    ], // children
                  ),
                ),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) { // 하단 네비게이션 바를 눌러 페이지 이동
          setState(() {
            _pageIndex = value;
          });
        },
        currentIndex: _pageIndex, // 현재 페이지
        selectedItemColor: Colors.blue, // 선택된 NavigationBar의 색상
        unselectedItemColor: Colors.black26, // 선택안된 NavigationBar의 색상
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'photo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'more',
          ),
        ],
      ),
    );
  }
}

final pictureLists = [
  'assets/images/001.png',
  'assets/images/002.png',
  'assets/images/003.png',
  'assets/images/004.png',
  'assets/images/005.png',
  'assets/images/006.png',
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView ( //Column에서 변경
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Container(
            padding: EdgeInsets.all(0.0),
            color: Colors.redAccent,
            width: 10,
            height: 3,
          ),
        ),
//        _pageOfMiddle(), // 중단
//        _pageOfBottom(), // 하단
      ],
    );
  }
}

var PowerCallList = ['절약하는 행동','이주일의 추천 게임','2023년, 크게 성장하는 파워콜!',
  '멋진 저녁, 그대와 함께', '2023년 계묘년 (癸卯年)','인생 즐겁게 살아야...'];

Widget _pageOfMiddle(){
  return CarouselSlider(
    options: CarouselOptions(
        height:  245,
        autoPlay: true),

    items: ['assets/images/001.png','assets/images/002.png','assets/images/003.png',
      'assets/images/004.png','assets/images/005.png','assets/images/006.png'].map((i) {
      return Builder(
          builder : (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin : EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(i),
                  //                 SizedBox( height:  0,),
                  if(i == 'assets/images/001.png')
                    Text("${PowerCallList[0]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                  if(i == 'assets/images/002.png')
                    Text("${PowerCallList[1]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                  if(i == 'assets/images/003.png')
                    Text("${PowerCallList[2]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                  if(i == 'assets/images/004.png')
                    Text("${PowerCallList[3]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                  if(i == 'assets/images/005.png')
                    Text("${PowerCallList[4]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                  if(i == 'assets/images/006.png')
                    Text("${PowerCallList[5]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                ],
              ),

            );
          }
      );
    }).toList(),
  );
}


Widget _pageOfBottom() {

  return
    Container(
      margin: EdgeInsets.all(06),
      color: Colors.white,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top:05),
            width: 400,
            height: 300,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00A_1.jpg'),
                  ),
                  title: Text('요금충전 & Top Up'),
                  subtitle: Text('보다 값싸게... 개발 중'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00B_1.jpg'),
                  ),
                  title: Text('쇼핑 (Shopping)'),
                  subtitle: Text('구매 절차에 대한 전체 구조 진행 중 '),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap:(){
                    //                   Navigator.of(context).pushNamed('/index');
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00C_1.jpg'),
                  ),
                  title: Text('여행 & 티켓'),
                  subtitle: Text('세계로 세계로... 개발 중'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00D_1.jpg'),
                  ),
                  title: Text('해외 송금'),
                  subtitle: Text('보다 빠르고 저렴한 수수료...개발 중'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00E_1.jpg'),
                  ),
                  title: Text('게시판'),
                  subtitle: Text('전체 및 각 나라별 게시판 사용'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap:(){
                    print('게시판');
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00F_1.jpg'),
                  ),
                  title: Text('채팅'),
                  subtitle: Text('어떻게 활용할 것인가? 고민 중...'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap:(){
                    //        _pushScreen(context,TouchDetectionScreen());
//                        _pushScreen(context,BBSHomePage());
                    print('채팅');
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00G_1.jpg'),
                  ),
                  title: Text('공지 사항'),
                  subtitle: Text('대한민국 법무부,각국 주한 대사관에서...'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap:(){
//                        _pushScreen(context, UpdateListViewScreen());
                    print('공지 사항');
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00H_1.jpg'),
                  ),
                  title: Text('법률 상담'),
                  subtitle: Text('변호사를 찾아 줍니다...'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap:(){
//                        _pushScreen(context, UpdateListViewScreen());
                    print('법률 상담 사항');
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/00I_1.jpg'),
                  ),
                  title: Text('to 파워콜'),
                  subtitle: Text('의견 이나 건의 사항을 부탁합니다'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap:(){
//                        _pushScreen(context, UpdateListViewScreen());
                    print('파워콜 사항');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
}

class PageView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page 1'),
        )
    );
  }
}

class PageView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageListPage(),
      //appBar: AppBar(
      //  title: Text('아름다운 Vietnam 여인들'),
    );
    // body: ImageListPage (),
    //);
  }
}


class ImageListPage extends StatelessWidget {

  final List<String> images = <String>['100.jpg','101.jpg','102.jpg','103.jpg','104.jpg','105.jpg','106.jpg','107.jpg','108.jpg','109.jpg','110.jpg'];
  final List<int> colorCodes = <int>[100,400,200,100,400,200,100,400,200,100,400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('베트남 여인들 My DREAM!'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: const EdgeInsets.all(06),
                height: 66,
                color: Colors.indigo[colorCodes[index]],
                child: ListTile(
                    title: Text('베트남 ${images[index]}'),
                    //          leading: Image.asset('assets/images/101.jpg'),
                    leading: Image.asset('assets/images/${images[index]}'),
                    trailing: Icon(Icons.more_vert),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ImageViewPage(path: 'assets/images/${images[index]}')),
                      );
                    }
                )
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
    );
  }
}

class ImageViewPage extends StatelessWidget {
  ImageViewPage({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('베트남 여인, 아오자이'),
        ),
        body: Center(
          child: Image.asset(path),
        )
    );
  }
}