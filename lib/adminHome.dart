import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visitorproject/AuthorityDataModel.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  List<AuthorityDataModel> userlist=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final userdbRef=FirebaseDatabase.instance.reference().child("Users");
    userdbRef.once().then((DataSnapshot snap)
    {
      var user=snap.value;
      //userlist.clear();
      user.forEach((key,value)
      {
        AuthorityDataModel authoritydatamodel=new AuthorityDataModel(
          value['designation'],
          value['phone'],
          value['email'],
          value['image'],
          value['name'],
          value['organization'],
          value['uid'],
        );
        userlist.add(authoritydatamodel);
      });
      setState(() {

      });
    }
    );
  }

  Widget createUserList(String des,String mob,String email,String img,String nm,String org,String uid)
  {
    return GestureDetector(
      onTap: (){},
      onLongPress: (){},
      child:  Card(
        color: Colors.blue[100],
        child: Container(
          height: 190,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 5,),
                  Image.asset("asset/images/user.png",
                    width: 90,
                    height: 90,

                  ),
                  SizedBox(width: 15.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nm ,overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(height: 13,),
                      Row(
                        children: [
                          Text(
                            'Designation - ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15.0,

                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              des  ,overflow: TextOverflow.ellipsis,maxLines: 1,
                              softWrap: false,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile No. - ' ,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15.0,

                            ),
                          ),
                          Text(
                            mob ,overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: ElevatedButton(onPressed: (){
                      launch("tel://"+mob);
                    },

                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen

                      ),
                      child: Row(
                        children: [
                          Icon(
                              Icons.call
                          ),

                          Text("Call"),
                        ],
                      ),

                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Expanded(child:
                  ElevatedButton(onPressed: (){
                    launch('sms:'+mob);
                  },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue
                      ),
                      child: Row(
                        children: [
                          Icon(
                              Icons.message
                          ),
                          Text("Message"),
                        ],
                      )),),
                  SizedBox(width: 10.0,),
                ],
              ),
            ],
          ),

        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        backgroundColor: Colors.blue[600],
      ),

      body: new Container(
        child: userlist.length==0?Text("No users "):ListView.builder(
            itemCount: userlist.length,
            itemBuilder: (_,index)
            {
              return  createUserList(userlist[index].designation, userlist[index].phone,userlist[index].email,userlist[index].image, userlist[index].name, userlist[index].organization, userlist[index].uid);
            }
        ),
      ),
    );
  }
}