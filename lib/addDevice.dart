import 'package:flutter/material.dart';

class addDevicePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final addDeviceBar = AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},)
      ),
      title: Text('Add Device',
        style: TextStyle(fontSize: 25.0,)),
      centerTitle: true,
    );

    final instructions = Text('Connect your Coble Device',
    style: TextStyle(
        fontSize: 30.0, color: Colors.blue),
    textAlign: TextAlign.center,
    );

    final form = Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Wifi Name',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          SizedBox(height: 16.0,),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Wifi Password',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            child: Text('Connect'),
            textColor: Colors.white,
            elevation: 5.0,
            color: Colors.blue,
            onPressed: () {},
          )
        ],
      ),
    );

    final bottom = BottomAppBar(
      elevation: 0.0,
      color: Colors.white10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Skip",
            style: TextStyle(fontSize: 20.0, color: Colors.blue),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/toDash');
          },
        )
        ]
      ),
    );

    return Scaffold(
      appBar: addDeviceBar,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 150.0,),
              instructions,
              SizedBox(height: 40.0,),
              form
           ],
          ),
        )
      ),
      bottomNavigationBar: bottom,
    );
  }
}