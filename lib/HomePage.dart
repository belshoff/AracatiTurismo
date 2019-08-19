import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'Detail.dart';

import 'package:flutter/rendering.dart';


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

  passData(DocumentSnapshot snap) {
    Navigator.of(context).push(new MaterialPageRoute(
      builder:  (context) => Detail(snapshot: snap,)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Aracati Turismo"),
        backgroundColor: Colors.cyan[700],
        centerTitle: true,
      ),
      body: new ListView.builder(
        itemCount: snapshot.length != null ? snapshot.length : 0,
        itemBuilder: ((context, index) {
          return new Card(
            elevation: 10.0,
            color: Colors.cyan[700],
            margin: EdgeInsets.all(10.0),
            child: new Container(
              padding: EdgeInsets.all(10.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Image.network(
                    "${snapshot[index].data["image"]}",
                    alignment: Alignment.topLeft,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width*0.95,
                    // scale: 3.5,
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 10.0),
                    width: MediaQuery.of(context).size.width*0.75,
                    child: new Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new InkWell(
                          child: new Text(
                            snapshot[index].data["title"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                          onTap: () {
                            passData(snapshot[index]);
                          },
                        ),
                        new SizedBox(height: 5.0,),
                        new Text(
                          snapshot[index].data["content"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.5
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
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