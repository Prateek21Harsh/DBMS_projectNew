import 'package:dbms2/rounded_button.dart';
import 'package:dbms2/text_field_decoration.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UpdateDeleteData extends StatefulWidget {
  final String id;

  const UpdateDeleteData({Key? key, required this.id}) : super(key: key);

  @override
  _UpdateDeleteDataState createState() => _UpdateDeleteDataState();
}

class _UpdateDeleteDataState extends State<UpdateDeleteData> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final mobileController = TextEditingController();
  final ageController = TextEditingController();
  final depositsController = TextEditingController();
  final loanController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    ageController.dispose();
    depositsController.dispose();
    loanController.dispose();
    super.dispose();
  }

  Future<void> updateData() async{
    var dio = Dio();
    var formData = FormData.fromMap({
      'id' : widget.id,
      'name' : nameController.text,
      'password': passwordController.text,
      'mobile' : mobileController.text,
      'age' : ageController.text,
      'deposits': depositsController.text,
      'loan' : loanController.text,
    });
    await dio.post('http://10.6.30.191/newWork/editdata.php',data: formData);
  }

  Future<void> deleteData() async{
    var dio = Dio();
    var formData = FormData.fromMap({
      'id' : widget.id,
    });
    await dio.post('http://10.6.30.191/newWork/deletedata.php',data: formData);
  }

  @override
  Widget build(BuildContext context) {
    //nameController.text = widget.orgName;
    //mobileController.text = widget.orgMobile;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(widget.id, style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                SizedBox(height: 5),
                TextField(
                  controller: nameController,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Name'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: passwordController,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Password'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: mobileController,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Mobile No.'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: ageController,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Age'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: depositsController,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Deposit Amount'),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: loanController,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter Loan Amount'),
                ),
                SizedBox(height: 5),
                RoundedButton(
                  title: 'UPDATE ACCOUNT',
                  colour: Colors.orangeAccent,
                  onPressed: (){
                    setState(() {
                      updateData();
                    });
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 5),
                RoundedButton(
                  title: 'DELETE ACCOUNT',
                  colour: Colors.orangeAccent,
                  onPressed: (){
                    setState(() {
                      deleteData();
                    });
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
