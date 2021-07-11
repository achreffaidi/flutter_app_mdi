import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

import 'resizableWindow.dart';

class MdiController{

  MdiController(this._onUpdate);


  List<ResizableWindow> _windows = List.empty(growable: true);

  VoidCallback _onUpdate;


  List<ResizableWindow> get windows => _windows;


  void addWindow(){
    addCalculatorApp();
  }


  void addCalculatorApp(){

    _createNewWindowedApp("Calculator",SimpleCalculator());

  }
  void _createNewWindowedApp(String title,Widget app){


    ResizableWindow resizableWindow = ResizableWindow(title,app);


    //Set initial position
    var rng = new Random();
    resizableWindow.x =  rng.nextDouble() * 500;
    resizableWindow.y =  rng.nextDouble() * 500;

    //Init onWindowDragged
    resizableWindow.onWindowDragged = (dx,dy){

      resizableWindow.x += dx;
      resizableWindow.y += dy;

      //Put on top of stack
      _windows.remove(resizableWindow);
      _windows.add(resizableWindow);

      _onUpdate();


    };

    //Init onCloseButtonClicked
    resizableWindow.onCloseButtonClicked = (){
      _windows.remove(resizableWindow);
      _onUpdate();
    };


    //Add Window to List
    _windows.add(resizableWindow);

    // Update Widgets after adding the new App
    _onUpdate();

  }


}