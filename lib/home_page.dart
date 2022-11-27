import 'package:dbms2/get_data.dart';
import 'package:dbms2/rounded_button.dart';
import 'package:dbms2/user_page.dart';
import 'package:flutter/material.dart';
import 'add_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context){
                return AddData();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'EASY BANKING',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Create Account With Us',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Make Deposits',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Trustworthy Loans',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Easy Account Updates',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 15.0),
              RoundedButton(
                title: 'User Page',
                colour: Colors.orangeAccent,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return UserPage();
                    },
                  ),
                  );
                },
              ),
              RoundedButton(
                title: 'Go to Database',
                colour: Colors.orangeAccent,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return GetData();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
