/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Registration';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          centerTitle: true,
        ),
        body: MyCustomForm(),
      ),
    );
  }
}
// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();

  late String  _email,_password,_name,_phnno,_designation;

  signUp()async{

    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();
      try{
        UserCredential user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
        if(user!=null){
          //updating name in firebase
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName= _name;
          // user.updateProfile(updateuser);

          //finish this actiivty and navigate to home

        }
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
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 50.0),
                child:Center(
                    child:Text("Register Here")
                ),
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                            validator: (input)
                            {
                              if(input!.isEmpty)
                                return 'Enter Name';
                            },
                            decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person)
                            ),
                            onSaved: (input) => _name=input!

                        ),
                      ),
                      Container(
                        child: TextFormField(
                            validator: (input) {
                              if (input!.length < 11)
                                return 'Provide Min 10 digits';
                            },
                            decoration:InputDecoration(
                                labelText: 'Phone',
                                prefixIcon: Icon(Icons.phone)
                            ),
                            obscureText:true,
                            onSaved: (input) => _phnno=input!

                        ),
                      ),
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
                      Container(
                        child: TextFormField(
                            validator: (input)
                            {
                              if(input!.isEmpty)
                                return 'Enter Designation';
                            },
                            decoration: InputDecoration(
                                labelText: 'Designation',
                                prefixIcon: Icon(Icons.description_rounded)
                            ),
                            onSaved: (input) => _designation=input!

                        ),
                      ),

                      SizedBox(height: 20),
                      RaisedButton(
                        onPressed: signUp,
                        child: Text('Register'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visitorproject/UserHome.dart';

class registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Registration';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          centerTitle: true,
        ),
        body: MyCustomForm(),
      ),
    );
  }
}
// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final userfireReference= FirebaseDatabase.instance.reference().child("Users");
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();

  late String  _email,_password,_name,_phnno,_designation;

  signUp()async{

    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();
      try{
        UserCredential user = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
        if(user!=null){
          //updating name in firebase
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName= _name;
          // user.updateProfile(updateuser);

          final User? firebaseUser=_auth.currentUser;
          String mailID=firebaseUser!.email.toString();
          String uid=firebaseUser.uid.toString();

          Map hashmap={
            "email":mailID,
            "name":_name,
            "uid":uid,
            "phone":_phnno,
            "organization":"VI",
            "designation":_designation,
            "image":"",
          };

          userfireReference.child(uid).set(hashmap).then((value)
          {
            Fluttertoast.showToast(msg: "Registered User " + mailID,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              fontSize: 16.0,
            );
            print("Registered");
            HomeActivity();
          });





          //finish this actiivty and navigate to home

        }
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
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 50.0),
                child:Center(
                    child:Text("Register Here")
                ),
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                            validator: (input)
                            {
                              if(input!.isEmpty)
                                return 'Enter Name';
                            },
                            decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person)
                            ),
                            onSaved: (input) => _name=input!

                        ),
                      ),
                      Container(
                        child: TextFormField(
                            validator: (input) {
                              if (input!.length < 10 )
                                return 'Provide exactly 10 digits';
                            },
                            decoration:InputDecoration(
                                labelText: 'Phone',
                                prefixIcon: Icon(Icons.phone)
                            ),
                            //obscureText:true,
                            onSaved: (input) => _phnno=input!
                        ),
                      ),
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
                      Container(
                        child: TextFormField(
                            validator: (input)
                            {
                              if(input!.isEmpty)
                                return 'Enter Designation';
                            },
                            decoration: InputDecoration(
                                labelText: 'Designation',
                                prefixIcon: Icon(Icons.description_rounded)
                            ),
                            onSaved: (input) => _designation=input!

                        ),
                      ),

                      SizedBox(height: 20),
                      RaisedButton(
                        onPressed: signUp,
                        child: Text('Register'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}