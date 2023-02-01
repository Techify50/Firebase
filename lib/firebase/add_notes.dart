import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/firebase/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Notepad extends StatefulWidget {
  const Notepad({super.key});

  @override
  State<Notepad> createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  final title = TextEditingController();
  final detail = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Notes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17)),
                        hintText: 'Title',
                        contentPadding: EdgeInsets.only(left: 16, top: 10),
                      ),
                    ),
                    TextFormField(
                      controller: detail,
                      maxLines: 16,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17)),
                          hintText: 'Details',
                          contentPadding:
                              EdgeInsets.only(left: 16, bottom: 10, top: 17)),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print('success');
                    Services.add(title.text, detail.text);
                  },
                  child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
