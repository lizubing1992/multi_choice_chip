import 'package:flutter/material.dart';

import 'muliti_normal_select_choice.dart';
import 'test_select_entity.dart';
import 'muliti_select_choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Choice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Choice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TestSelectEntity> selectList = new List();

  List<TestSelectEntity> allList = new List();

  List<TestSelectEntity> selectNormalList = new List();

  List<TestSelectEntity> allLNormaList = new List();

  void initData() {
    allList.add(TestSelectEntity(title: "Android"));
    allList.add(TestSelectEntity(title: "iOS"));
    allList.add(TestSelectEntity(title: "Web"));
    allList.add(TestSelectEntity(title: "Java"));
    allList.add(TestSelectEntity(title: "Python"));
    allList.add(TestSelectEntity(title: "Go"));

    allLNormaList.add(TestSelectEntity(title: "Android"));
    allLNormaList.add(TestSelectEntity(title: "iOS"));
    allLNormaList.add(TestSelectEntity(title: "Web"));
    allLNormaList.add(TestSelectEntity(title: "Java"));
    allLNormaList.add(TestSelectEntity(title: "Python"));
    allLNormaList.add(TestSelectEntity(title: "Go"));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MultiNormalSelectChip(
              allList,
              selectList: selectList,
              onSelectionChanged: (selectedList) {
                selectList = selectedList;
              },
            ),
            MultiSelectChip(
              allLNormaList,
              selectList: selectNormalList,
              onSelectionChanged: (selectedList) {
                allLNormaList = selectedList;
              },
            ),
          ],
        ),
      ),
    );
  }


}
