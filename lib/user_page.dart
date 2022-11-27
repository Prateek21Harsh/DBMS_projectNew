import 'package:dbms2/rounded_button.dart';
import 'package:dbms2/text_field_decoration.dart';
import 'package:dbms2/update_delete_data.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController idController = new TextEditingController();

  @override
  void dispose(){
    idController.dispose();
    super.dispose();
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
                  'USER PAGE',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  controller: idController,
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter ID of User'),
                ),
                SizedBox(height: 5),
                RoundedButton(
                  title: 'SUBMIT',
                  colour: Colors.orangeAccent,
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                        UpdateDeleteData(
                          id: idController.text
                        )
                    ));
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
