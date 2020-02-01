import 'package:flutter/material.dart';
import 'pages/Call_screen.dart';
import 'pages/Camera_screen.dart';
import 'pages/Chat_screen.dart';
import 'pages/Status_screen.dart';

class WhatsAppHOME extends StatefulWidget {
  @override
  _WhatsAppHOMEState createState() => _WhatsAppHOMEState();
}

class _WhatsAppHOMEState extends State<WhatsAppHOME>
    with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4); //4 Tabs
    
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
        tabs: <Widget>[
          new Tab(icon: new Icon(Icons.camera_alt)),
          new Tab(text: "CHATS"),
          new Tab(text: "STATUS"),
          new Tab(text: "CALLS")
        ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Camera_screen(),
          new Chat_screen(),
          new Status_screen(),
          new Call_screen(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(Icons.message, color: Colors.white),
        onPressed: () => print("open chats"),
      ),
    );
  }
}
