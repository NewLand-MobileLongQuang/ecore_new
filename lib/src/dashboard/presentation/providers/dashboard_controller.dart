import 'dart:core';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/tab_navigator.dart';
import '../../../../core/common/views/page_notfound.dart';
import '../../../../core/common/views/persistent_view.dart';


class DashboardController extends ChangeNotifier
{
  List<int> _indexHistory=[0];
  final List<Widget> _screens =[
    ChangeNotifierProvider(create: (_)=> TabNavigator(TabItem(child: PageNotfound())), child: PersistentView(),),
    //ChangeNotifierProvider(create: (_)=> TabNavigator(TabItem(child: RegisterWidget())), child: PersistentView(),),
    //ChangeNotifierProvider(create: (_)=> TabNavigator(TabItem(child: Placeholder())), child: PersistentView(),),
    //ChangeNotifierProvider(create: (_)=> TabNavigator(TabItem(child: ProfileScreen())), child: PersistentView(),),
  ];

  List<Widget> get screens=>_screens;
  int _currentIndex=0;
  int get currentIndex =>_currentIndex;

  void changeIndex(int index)
  {
    if(_currentIndex==index) return;
    _currentIndex=index;
    _indexHistory.add(index);
    notifyListeners();
  }

  void goBack()
  {
    if(_indexHistory.length==1) return;
    _indexHistory.removeLast();
    _currentIndex=_indexHistory.last;
    notifyListeners();
  }

  void resetIndex()
  {
    _indexHistory=[0];
    _currentIndex=0;
    notifyListeners();
  }


}