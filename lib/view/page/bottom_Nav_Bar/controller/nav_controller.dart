import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Call/call_list.dart';
import '../../Chat/chat.dart';
import '../../Contact/contact_list.dart';
import '../../Home/Home.dart';

class NavController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  List<Widget> page=[
    ChatPage(),
    HomePage(),
    ContactListPage(),
    CallListPage()

  ];




}