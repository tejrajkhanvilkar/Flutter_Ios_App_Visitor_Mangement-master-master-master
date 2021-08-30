import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitorproject/editProfile.dart';

class AdminSettings extends StatefulWidget {
  const AdminSettings({Key? key}) : super(key: key);

  @override
  _AdminSettingsState createState() => _AdminSettingsState();
}

class _AdminSettingsState extends State<AdminSettings> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signOutadmin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isloggedin', false);
    await prefs.setString('user', '');
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        children: <Widget>[
          Padding(padding:  const EdgeInsets.only(top: 60.0),
          child:Center(

            child:SizedBox(width: 300,height: 30,
            child:ElevatedButton(
              onPressed: (){
                  Navigator.push(
                  context, MaterialPageRoute(builder: (_) => editProfile()));
              },
              child: Center(
                child: Text('Edit Profile',

                ),

              ),
            ),
          ),
    ),
    ),
          Padding(padding:  const EdgeInsets.only(top: 30.0),
          child:Center(
          child:SizedBox(width: 300,height: 30,
            child:ElevatedButton(
              onPressed: signOutadmin,
              child: Center(
                child: Text('Log Out',

                ),

              ),
            ),
          ),
          ),
          ),
        ],
      ),
    );
  }
}
