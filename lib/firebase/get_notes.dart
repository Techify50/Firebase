import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/firebase/add_notes.dart';
import 'package:database/firebase/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Get_Data extends StatelessWidget {
  const Get_Data({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Notepad()));
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: firebaseFirestore.collection('notes').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final res = snapshot.data!.docs[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Icon(Icons.delete_outline),
                  onDismissed: (v) {
                    Services.delete(res.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ExpansionTile(
                      childrenPadding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      title: Text('${res['title']}'),
                      children: [Text('${res['details']}')],
                    ),
                  ),
                );
              },
            );
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
