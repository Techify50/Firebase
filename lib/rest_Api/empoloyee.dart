//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:database/rest_Api/employee_data.dart';
import 'package:database/rest_Api/employee_data2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  Future<Employee_Data> data() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(Uri.parse(url));
    var decoding = json.decode(response.body);
    var w = Employee_Data.fromJson(decoding[1]);
    print('success');
    return w;
  }

  Future<Employee_Data2> data2() async {
    var url = 'https://jsonplaceholder.typicode.com/posts/1';
    http.Response response = await http.get(Uri.parse(url));
    var decoding = json.decode(response.body);
    var v = Employee_Data2.fromJson(decoding);
    print('success');
    return v;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<Employee_Data2>(
        future: data2(),
        builder: (context, AsyncSnapshot<Employee_Data2> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text('${snapshot.data!.id}');
        },
      )),
    );
  }
}
