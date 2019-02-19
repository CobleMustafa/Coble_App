/* This class renders the Dashboard of the Coble App,
* Structurally, this code describes the elements rendered on the page (appBAr, buttons, etc...)
* followed by code on how these elements are presented with each other*/

import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//abc
//Class part of the Coble App
import './NoiseProfile.dart';

class DashBoardPage extends StatefulWidget{
  @override
  _DashBoardPage createState() => new _DashBoardPage();
}

class _DashBoardPage extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //DocumentReference _reads = Firestore.instance.collection('Test').document('Dummy');
    final dashboardBar = AppBar( //AppBar on top of the page
    backgroundColor: Color(0xFF4D74E2)  
    ,leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.directions_boat),
      ),
      title: Text('Dashboard'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(         //This button open the Option Drawer
          icon: Icon(Icons.dehaze),
          onPressed: () {},
        ),
      ],
    );

    final dashboardFAB = FloatingActionButton ( //This button sends the User to the Add Device page
    onPressed: () {},
    backgroundColor: Color(0xff5bf072),
    child: Icon(Icons.add),
    elevation: 1.0,
    );

    /*int getNumber(){
      StreamBuilder<DocumentSnapshot>(
        stream: _reads.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          return snapshot.data['number'];
        },
      );
    }*/

    _dashBody() {
      int counter = 3;
      if( counter ==  0){
        return Center(
          child: Text('You do not have any device connected',
            style: TextStyle(color: Colors.grey),),
        );
      } else{
        return ListView.builder(
            itemBuilder: (context,index){
              return NoiseProfile(deviceName: 'Floor 1',
                status: true,
                connected: true,
              );
            },
            itemCount: counter,
            shrinkWrap: true
        );
      }
    }

    return Scaffold(
      appBar: dashboardBar,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(10.0),
        child: Transform.scale(
          scale: 1.4,
          child: dashboardFAB,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: _dashBody(),
      ),
    );
  }
}

