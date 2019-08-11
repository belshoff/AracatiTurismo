import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';


class Home extends StatefulWidget {
  @override
  _HomeState createState () => new _HomeState();
}

class _HomeState extends State<Home> {

  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference = Firestore.instance.collection("Post");

  void initState() {
    super.initState();

    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Aracati Turismo"),
        backgroundColor: Colors.grey,
      ),
      body: new ListView.builder(
        itemCount: snapshot.length,
        itemBuilder: ((context, index) {
          return new Card(
            elevation: 10.0,
            margin: EdgeInsets.all(10.0),
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new CircleAvatar(
                    child: new Text(snapshot[index].data["title"][0]),
                  ),
                  new Container(
                    child: new Column(
                      children: <Widget>[
                        new Text(snapshot[index].data["title"]),
                        new Text(snapshot[index].data["content"]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}