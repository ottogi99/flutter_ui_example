import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_example/my_form_validation.dart';
import 'package:ui_example/my_swipe_to_dismiss.dart';

final dummyItems = [
  'https://cdn.pixabay.com/photo/2018/11/12/18/44/thanksgiving-3811492_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/10/30/15/33/tajikistan-4589831_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/11/25/16/15/safari-4652364_1280.jpg',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0; // 페이지 인덱스 0, 1, 2
  var _pages = [
    Page1(),
    MyAnimatedContainer(),
    MyAnimatedOpacity(),
    MyDrawer(),
    MySnackBar(),
    MyOrientation(),
    MyTabController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '복잡한 UI',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'AnimateContainer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'AnimatedOpacity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Drawer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.start),
            label: 'SnackBar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stop),
            label: 'OrientationBuilder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'TabController',
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  print('클릭1');
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('클릭2');
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_taxi,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Opacity(
                opacity: 0.0, //투명
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.local_taxi,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
      ),
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  _buildBottom() {
    final items = List.generate(10, (i) {
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[이벤트] 이것은 공지사항입니다'),
      );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(), // 이 리스트의 스크롤 동작 금지
      shrinkWrap: true, // 이 리스트가 다른 스크롤 객체 안에 있다면 true로 설정해야 함
      children: items,
    );
  }
}

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadius _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(8),
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class MyAnimatedOpacity extends StatefulWidget {
  const MyAnimatedOpacity({Key? key}) : super(key: key);

  @override
  State<MyAnimatedOpacity> createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Header'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              onTap: () {
                // 할 일
                Navigator.pop(context);
              },
              title: Text('Item 1'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text('Item 2'),
            ),
            ListTile(
              onTap: () {
                // 할 일
                Navigator.pop(context);
              },
              title: Text('Item 3'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      body: Center(
        child: Text('Drawer 예제'),
      ),
    );
  }
}

class MySnackBar extends StatefulWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySnackBar'),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       final snackBar = SnackBar(
      //         content: Text('나는 스낵바'),
      //       );
      //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //     },
      //     child: Text('Show SnackBar'),
      //   ),
      // ),
      body: Builder(
        builder: (context) => Center(
          // 여기 context는 별도의 context를 만드는 것?????
          child: ElevatedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('메일이 삭제 되었습니다.'),
                action: SnackBarAction(
                  onPressed: () {
                    // 눌렀을 때 처리
                  },
                  label: '취소',
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text('Show SnackBar'),
          ),
        ),
      ),
    );
  }
}

class MyOrientation extends StatefulWidget {
  const MyOrientation({Key? key}) : super(key: key);

  @override
  State<MyOrientation> createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrientationBuilder'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            children: List.generate(
              50,
              (position) {
                return Center(
                  child: Text('Item $position'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MyTabController extends StatefulWidget {
  const MyTabController({Key? key}) : super(key: key);

  @override
  State<MyTabController> createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text('TabController'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.access_alarm)),
                Tab(
                  icon: Icon(Icons.portrait),
                  text: 'SwipeToDismissible',
                ),
                Tab(
                  text: 'FormValidation',
                  icon: Icon(Icons.access_time),
                ),
              ],
            )),
        body: TabBarView(
          children: [
            Icon(Icons.access_alarm),
            MySwipeToDismiss(),
            MyFormValidation(),
          ],
        ),
      ),
    );
  }
}
