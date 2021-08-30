import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitorproject/MyApp.dart';
import 'package:visitorproject/userActivity.dart';

import 'AdminSetting.dart';
import 'UserHome.dart';

import 'UserSettings.dart';
import 'package:fluttertoast/fluttertoast.dart';


/// This Widget is the main application widget.
class usermain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigationBar (),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar ({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;


  checkAuthentication() async{

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) async{
      // if (user == null) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
      // }
      SharedPreferences prefs = await SharedPreferences.getInstance();
        var iln =  await (prefs.getBool('isloggedin') ?? false );
        if(!iln){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
        }
    });


  }

  getUser() async{
    User firebaseUser = await _auth.currentUser!;
    await firebaseUser.reload();
    firebaseUser = await _auth.currentUser!;

    if(firebaseUser!=null){
      setState(() {
        this.user = firebaseUser;
        //this.isloggedin = true;
      });
    }
  }

  signOut()async{
    _auth.signOut();
  }

  //runs when homepage is opened
  @override
  void initState(){
    //Firebase.initializeApp();
    this.checkAuthentication();
    this.getUser();
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeActivity(),
    UserActivity(),
    UserSettings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          title: const Text('User'),
          centerTitle: true,
          backgroundColor: Colors.blue
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.green,
      //   onPressed: () {
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.lightBlueAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.work_rounded),
                title: Text('Activity'),
                backgroundColor: Colors.lightBlueAccent
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Setting'),
              backgroundColor: Colors.lightBlueAccent,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),


    );
  }
}