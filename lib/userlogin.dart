import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'usermain.dart';

class userlogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {




  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _email, _password;

  checkAuthentication() async{

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) async {
      if (user != null) {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setBool('isloggedin', true);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> usermain()));
        //Navigator.pop(context);
      }
    });

  }

  // sharedpref()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var iln =  await (prefs.getBool('isloggedin') ?? false );
  //   if(iln){
  //
  //   }
  //   //return iln;
  // }

  @override
  void initState(){
    super.initState();
    this.checkAuthentication();
  }

  login()
  async {
    //User user = (await auth.signInWithEmailAndPassword(email: 'atul.kulkarni@viit.ac.in', password: '12345678')) as User;

    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      try{
        UserCredential user = await auth.signInWithEmailAndPassword(email: _email, password: _password);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isloggedin', true);
        await prefs.setString('user', 'user');
        //User user = (await auth.signInWithEmailAndPassword(email: _email, password: _password)) as User;
      }catch(e){
        showError(e.toString());
      }
    }
  }

  showError(String errormessage){

    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
            // Center(
            //   child:Padding(
            //     //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            //     padding: EdgeInsets.only(top: 25),
            //     // child: TextField(
            //     //   decoration: InputDecoration(
            //     //       border: OutlineInputBorder(),
            //     //       labelText: 'Email',
            //     //       hintText: 'Enter valid email id'),
            //     // ),
            //     child: TextFormField(
            //         validator: (input)
            //         {
            //           if(input!.isEmpty)
            //             return 'Enter EMail';
            //         },
            //         decoration: InputDecoration(
            //             labelText: 'Email',
            //             prefixIcon: Icon(Icons.email)
            //         ),
            //         onSaved: (input) => _email=input!
            //
            //     ),
            //   ),
            // ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                          validator: (input)
                          {
                            if(input!.isEmpty)
                              return 'Enter EMail';
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email)
                          ),
                          onSaved: (input) => _email=input!

                      ),
                    ),
                    Container(
                      child: TextFormField(
                          validator: (input) {
                            if (input!.length < 6)
                              return 'Provide Min 6 character';
                          },
                          decoration:InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock)
                          ),
                          obscureText:true,
                          onSaved: (input) => _password=input!

                      ),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: login,
                      child: Text('Login'),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}