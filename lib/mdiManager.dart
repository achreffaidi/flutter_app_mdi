import 'package:flutter/material.dart';
import 'package:flutter_app_mdi/mdiController.dart';

class MdiManager extends StatefulWidget {

  final MdiController mdiController;

  const MdiManager({Key key, this.mdiController}) : super(key: key);

  @override
  _MdiManagerState createState() => _MdiManagerState();
}

class _MdiManagerState extends State<MdiManager> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: widget.mdiController.windows.map((e){
        return Positioned(
          left: e.x,
          top: e.y,
          child: e,
          key: e.key,
        );
      }).toList()
    );
  }
}
