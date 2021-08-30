import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';

class editProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Edit Profile';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          elevation: 0,
          title: Text(appTitle),
          centerTitle: true,
        ),
        body: MyCustomForm2(),
      ),
    );
  }
}
// Create a Form widget.
class MyCustomForm2 extends StatefulWidget {
  @override
  editFormState createState() {
    return editFormState();
  }
}
// Create a corresponding State class. This class holds data related to the form.
class editFormState extends State<MyCustomForm2> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String Newpassword;
   late String Name;







  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 50.0),
            child:Center(
                child:Text("Edit Profile Here")
            ),),
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child:TextFormField(

              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
                onSaved: (input) => Name=input!
            ),),


          Padding(padding: const EdgeInsets.only(top: 20.0),
            child:TextFormField(

              decoration: const InputDecoration(
                icon: const Icon(Icons.password),
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
                obscureText:true,
                onSaved: (input) => Newpassword=input!
            ),),

          Center(
            child:Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child:SizedBox(
                  height: 30,
                  width: 300,
                  child: new ElevatedButton(
                    child: const Text('Update'),
                    onPressed: (){
                      Fluttertoast.showToast(
                          msg: "Hello I a update",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        try{




                          User? user = auth.currentUser;

                          if (user != null ) {
                            final dateDBReference=FirebaseDatabase.instance.reference().child("Users");
                            dateDBReference.child(user.uid.toString()).child("name").set(Name);


                            user.updatePassword(Newpassword);

                          }

                        }catch(e){

                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.blue[700]),
                  )),),),
        ],
      ),
    );
  }
}