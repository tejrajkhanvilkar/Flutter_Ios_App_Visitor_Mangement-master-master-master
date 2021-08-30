import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitorproject/adminmain.dart';
import 'package:visitorproject/usermain.dart';
import 'adminlogin.dart';
import 'userlogin.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppState(),
    );
  }
}
class AppState extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<AppState> {

  checkiflogin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var iln =  await (prefs.getBool('isloggedin') ?? false );
    var usertype = await (prefs.getString('user') ?? '' );
    if(iln && usertype=='user'){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> usermain()));
    }else if(iln && usertype=='admin'){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> adminmain()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkiflogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Text('Login'),
                centerTitle: true,
              ),
              body:Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Center(
                        child: Container(
                            width: 150,
                            height: 150,
                            /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                            child: Image.asset('asset/images/logo.png')),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 64.0),
                        child:Container(
                          width:double.infinity,
                          height: 290,
                          alignment: Alignment.bottomCenter,
                          //color: Color(0xffcce5ff),
                          child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child:Center(
                                    child:Text("Login As"),
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: SizedBox(
                                    height: 50,
                                    width: 370,

                                    child:ElevatedButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (_) => userlogin()));
                                      },
                                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                                      //padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                                      child:Center(
                                        child:Text("User Login"),
                                      ),),),),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child:SizedBox(
                                    height: 50,
                                    width: 370,
                                    child:ElevatedButton(onPressed:(){
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (_) => adminlogin()));
                                    },
                                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                                      //padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      child: Center(
                                          child:Text("Admin Login")
                                      ),

                                    ),),),

                              ] ),


                        ),),
                      ]
                    ),
                  ])),
        ));
  }
}