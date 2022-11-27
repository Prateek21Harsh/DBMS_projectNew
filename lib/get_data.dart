import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List<DataModal> dataList = [];
  bool isLoading = true;

  Future<void> getAllCourses() async{
    Response response;
    var dio = Dio();
    response = await dio.get('http://10.6.30.191/newWork/getdata.php');
    final list = json.decode(response.data) as List<dynamic>;

    dataList = list.map((e) => DataModal.fromJson(e)).toList();

    setState(() {
      if(dataList.isNotEmpty) {
        isLoading = false;
      }
    });
  }

  @override
  void initState() {
    getAllCourses();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    setState(() {
      getAllCourses();
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: isLoading ? Center(child: Text('Data not found'),) :
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _createDataTable()),
            ],
          ),
        ),
      ),
    );
  }
  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('id')),
      DataColumn(label: Text('name')),
      DataColumn(label: Text('password')),
      DataColumn(label: Text('mobile')),
      DataColumn(label: Text('age')),
      DataColumn(label: Text('deposits')),
      DataColumn(label: Text('loan'))
    ];
  }

  List<DataRow> _createRows() {
    return dataList
        .map((book) => DataRow(cells: [
      DataCell(Text(book.id)),
      DataCell(Text(book.name)),
      DataCell(Text(book.password)),
      DataCell(Text(book.mobile)),
      DataCell(Text(book.age)),
      DataCell(Text(book.deposits)),
      DataCell(Text(book.loan)),
    ]))
        .toList();
  }

}


class DataModal{
  String id;
  String name;
  String password;
  String mobile;
  String age;
  String deposits;
  String loan;

  DataModal({required this.id, required this.name, required this.password, required this.mobile, required this.age,
  required this.deposits, required this.loan});

  factory DataModal.fromJson(Map<String, dynamic> json) => DataModal(
      id: json['id'] as String,
      name: json["name"] as String,
      password: json["password"] as String,
      mobile: json["mobile"] as String,
      age: json["age"] as String,
      deposits: json["deposits"] as String,
      loan: json["loan"] as String
  );
}