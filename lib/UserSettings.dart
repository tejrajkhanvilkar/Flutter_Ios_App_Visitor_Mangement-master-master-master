import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitorproject/registration.dart';
import 'editProfile.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  signOut()async{
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
                    setState(() {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => editProfile()));
                    });


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
                  onPressed: signOut,
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
