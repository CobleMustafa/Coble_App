import 'package:flutter/material.dart';

class NoiseProfile extends StatefulWidget {
  final String deviceName;
  final bool status;
  final bool connected;

  NoiseProfile({this.deviceName, this.status, this.connected});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoiseProfileState();
  }
}

class _NoiseProfileState extends State<NoiseProfile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      SizedBox(height: 5.0),
      Card(
        color: Color(0xFF4D74E2),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                width: 140.0,
                child: ListTile(
                  title: Text(
                    widget.deviceName,
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  subtitle: Text(
                    widget.connected ? 'Connected' : 'Not Connected',
                    style: TextStyle(
                        color: widget.connected ? Colors.greenAccent : Colors.red,
                        fontSize: 15.0,),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 160.0,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: widget.status ? Colors.white : Colors.red,
              ),
              iconSize: 40.0,
            )
          ],
        ),
      ),
      SizedBox(
        height: 5.0,
      )
    ]);
  }
}
