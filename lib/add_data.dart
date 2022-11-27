import 'package:dbms2/rounded_button.dart';
import 'package:dbms2/text_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController cid = new TextEditingController();
  TextEditingController cname = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();
  TextEditingController cmobile = new TextEditingController();
  TextEditingController cage = new TextEditingController();
  TextEditingController cdeposits = new TextEditingController();
  TextEditingController cloan = new TextEditingController();

  @override
  void dispose(){
    cid.dispose();
    cname.dispose();
    cpassword.dispose();
    cmobile.dispose();
    cage.dispose();
    cdeposits.dispose();
    cloan.dispose();
    super.dispose();
  }

  Future<void> addData() async{
    var dio = Dio();
    var formData = FormData.fromMap({
      'id' : cid.text,
      'name' : cname.text,
      'password': cpassword.text,
      'mobile' : cmobile.text,
      'age' : cage.text,
      'deposits': cdeposits.text,
      'loan' : cloan.text,
    });
    await dio.post('http://10.6.30.191/newWork/adddata.php',data: formData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: cid,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Id'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: cname,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Name'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: cpassword,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Password'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: cmobile,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Mobile No.'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: cage,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Age'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: cdeposits,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Deposit Amount'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: cloan,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Loan Amount'),
                ),
                SizedBox(height: 5),
                RoundedButton(
                  title: 'Create Account',
                  colour: Colors.orangeAccent,
                  onPressed: (){
                    addData();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}