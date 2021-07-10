import 'package:flutter/material.dart';
import 'package:flutter_app_mdi/mdiController.dart';
import 'package:flutter_app_mdi/mdiManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MDI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MdiController mdiController;
  @override
  void initState() {
    super.initState();

    mdiController = MdiController((){
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        mdiController.addWindow();
      },),
      body: MdiManager(mdiController: mdiController,),
    );
  }
}

