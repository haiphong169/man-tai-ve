import 'package:flutter/material.dart';
import 'package:test_screen_test/screens/download_list_screen.dart';
import 'screens/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
      home: const ListDownloadScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Bài 20: Đề thi cuối khóa',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600),
          )),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 240, child: Image.asset('assets/icons/Test.png')),
            const Text(
              'Bài 20: Đề thi cuối khóa',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Display'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 343,
              height: 184,
              child: GridView.count(
                childAspectRatio: 163.5 / 84,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _Tile(
                      description: 'Thời lượng thi',
                      detail: '60 phút',
                      imagePath: 'assets/icons/Clock.png'),
                  _Tile(
                      description: 'Số câu hỏi',
                      detail: '30 câu',
                      imagePath: 'assets/icons/Question.png'),
                  _Tile(
                      description: 'Số lần thi cho phép',
                      detail: '2 lần',
                      imagePath: 'assets/icons/ArrowClockwise.png')
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        height: 44,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 22,
                  height: 22,
                  margin: const EdgeInsets.only(right: 5),
                  child: const ImageIcon(
                    AssetImage('assets/icons/Play.png'),
                  )),
              const Text(
                'Bắt đầu thi',
              )
            ],
          ),
          onPressed: () {},
        ),
      )),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(
      {Key? key,
      required this.description,
      required this.detail,
      required this.imagePath})
      : super(key: key);
  final String description;
  final String detail;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(
          description,
          style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.normal,
              fontSize: 14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(AssetImage(imagePath)),
            SizedBox(
              width: 5,
            ),
            Text(
              detail,
              style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            )
          ],
        )
      ]),
    );
  }
}
