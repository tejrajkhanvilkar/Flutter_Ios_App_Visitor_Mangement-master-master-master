import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visitorproject/VisitorDataModel.dart';

class UserActivity extends StatefulWidget {
  const UserActivity({Key? key}) : super(key: key);

  @override
  _UserActivityState createState() => _UserActivityState();
}

class _UserActivityState extends State<UserActivity>
{

  // var firebaseAuth;
  //User? user = auth.currentUser;
  //final FirebaseAuth auth = FirebaseAuth.instance;
  //var  currentUser="CxFh8UAy5UQl1YLl3v12B033yXd2";
  // FirebaseAuth auth = FirebaseAuth.instance;
  // User? currentUser;
  //
  final dateDBReference=FirebaseDatabase.instance.reference().child("DateDB");

  // var currentUser;
  List<VisitorDataModel> pastvisitorList=[];
  List<VisitorDataModel> reversedList=[];

  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  //final dateDBReference=FirebaseDatabase.instance.reference().child("DateDB");
  // final dateDBChildReference=dateDBReference.child(currentDate);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //currentUser= auth.currentUser;
    // var firedbAuth=FirebaseAuth.instance;
    // currentUser = firedbAuth.currentUser;
    //Firebase Messaging
    // String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // final dateDBReference=FirebaseDatabase.instance.reference().child("DateDB");

    setVisitorList();

  }

  void setVisitorList()
  {
    final dateDBChildReference=dateDBReference.child(currentDate);
    print(currentDate);
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    print('currentuser id is :'+currentUser!.uid.toString());

    //final FirebaseMessaging fdbmsgToken= FirebaseMessaging.instance;
    //fdbmsgToken.getToken().then((value) => print(value));

    dateDBChildReference.onChildChanged.listen((event) {

      pastvisitorList.clear();
      dateDBChildReference.once().then((DataSnapshot snap)
      {
        var visitor=snap.value;
        visitor.forEach((key,value)
        {
          VisitorDataModel visitordatamodel=new VisitorDataModel.con(
              value['RescheduledTime'],
              value['Vuid'],
              value['Reason'],
              value['Mobile_NO'],
              value['AreaCode'],
              value['First_Name'],
              value['Last_Name'],
              value['Email_ID'],
              value['Address'],
              value['City'],
              value['State'],
              value['WhomToMeet_Name'],
              value['WhomToMeet'],
              value['MDate'],
              value['MTime'],
              value['FeverStatus'],value['Cough'],
              value['Breathing_Difficulty'], value['Resp_Problem'],value['Visited_Status'],
              value['Notification_Status'],
              value['Visited_Status_Update'],
              value['ImageUrl'],
              value['ImageName']



          );





          bool visited=visitordatamodel.isVisited_Status();
          if(visited) {
            if (currentUser.uid == visitordatamodel.getWhomToMeet()) {
              pastvisitorList.add(visitordatamodel);
              reversedList = new List.from(pastvisitorList.reversed);



            }
          }
          setState(() {

          });
          // }
          // setState(() {
          //
          // });
          //
          // pastvisitorList.add(visitordatamodel);
          //
          //

        });


      });

      // VisitorDataModel visitordatamodel=new VisitorDataModel.fromDataSnap(event.snapshot);
      //   bool visited=visitordatamodel.isVisited_Status();
      //   if(visited) {
      //
      //     if(currentUser==visitordatamodel.getWhomToMeet())
      //     {
      //       pastvisitorList.add(visitordatamodel);
      //       print("Data inserted...");
      //
      //     }
      //
      //   }
      //   setState(() {
      //
      //   });
    });

    dateDBChildReference.once().then((DataSnapshot snap)
    {
      var visitor=snap.value;
      visitor.forEach((key,value)
      {
        VisitorDataModel visitordatamodel=new VisitorDataModel.con(
            value['RescheduledTime'],
            value['Vuid'],
            value['Reason'],
            value['Mobile_NO'],
            value['AreaCode'],
            value['First_Name'],
            value['Last_Name'],
            value['Email_ID'],
            value['Address'],
            value['City'],
            value['State'],
            value['WhomToMeet_Name'],
            value['WhomToMeet'],
            value['MDate'],
            value['MTime'],
            value['FeverStatus'],value['Cough'],
            value['Breathing_Difficulty'], value['Resp_Problem'],value['Visited_Status'],
            value['Notification_Status'],
            value['Visited_Status_Update'],
            value['ImageUrl'],
            value['ImageName']



        );

        // value['rtime'],
        // value['uid'],
        // value['reason'],
        // value['whomToMeet_Name'],
        // value['first_Name'],
        // value['mobile_NO'],
        // value['email_ID'],
        // value['address'],
        // value['city'],
        // value['areaCode'],
        // value['breathing_Difficulty'],
        // value['cough'],
        // value['feverStatus'],
        // value['last_Name'],
        // value['MDate'],
        // value['MTime'],
        // value['resp_problem'],
        // value['state'],
        // value['visited_Status'],
        // value['whomToMeet'],
        // value['notification_Status'],
        // value['visited_Status_Update'],
        // value['imageurl'],
        // value['imagename']



        bool visited=visitordatamodel.isVisited_Status();
        if(visited) {
          if (currentUser.uid == visitordatamodel.getWhomToMeet()) {
            pastvisitorList.add(visitordatamodel);
            reversedList = new List.from(pastvisitorList.reversed);


          }
        }
        setState(() {

        });
        // }
        // setState(() {
        //
        // });
        //
        // pastvisitorList.add(visitordatamodel);
        //
        //

      });


    });
  }

  Widget setui(String fnm,String from,String mob,String temp,String visitedStatus,String date,String requestedTime, String tomeet, String purpose,String rescheduleTime)
  {


    //final newdateDBChildReference=dateDBReference.child(currentDate);


    return new GestureDetector(
      onLongPress: (){},
      onTap: (){},
      child: Card(
        color: Colors.blue[100],
        child:Padding(padding:  const EdgeInsets.only(top: 10.0),

          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[

                    SizedBox(width: 15.0,),
                    CircleAvatar(
                      radius: 45.0,
                      backgroundImage: AssetImage('asset/images/user.png'),

                    ),
                    SizedBox(width: 15.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name:   '+fnm
                          ,overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'From:   '+from,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500

                          ),
                        ),

                        SizedBox(height: 10,),
                        Text(
                          'Mobile No.:   '+ mob ,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Temp:   '+ temp,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500

                          ),
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),


                    // onTap: () {
                    //   setState(() {
                    //
                    //     visitorsList.insert(index, visitorslist
                    //       (nm: 'Name$index',
                    //         purpose: 'Purpose$index',
                    //         fever: 'fever$index',
                    //         mobno: 'mobno$index'));
                    //   });
                    //
                    //   print('$index tapped.');
                    // },
                    // onLongPress: () {
                    //   setState(() {
                    //     visitorsList.removeAt(index);
                    //
                    //   });
                    //   print('$index Removed.');
                    // },



                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Visited Status:   '+ visitedStatus ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500

                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Date             :   '+ date ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500

                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Requested \nTime            :   '+ requestedTime ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500

                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Reschedule \nTime            :   '+ rescheduleTime ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500

                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'To Meet      :   '+ tomeet ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Purpose      :   '+ purpose ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),

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
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('User Activity'),
        centerTitle: true,
      ),

      body: new Container(

        child: reversedList.length==0?Text("No Data Available"):new ListView.builder(
            itemCount: reversedList.length,
            itemBuilder:(_,index)
            {
              //Widget setui(String fnm,String from,String mob,String temp,String visitedStatus,String date,String requestedTime,String rescheduleTime, String tomeet, String purpose)

              return setui(reversedList[index].getFirst_Name(), 'no' ,reversedList[index].getMobile_NO(),reversedList[index].getFeverStatus(),reversedList[index].getVisited_Status_Update(),reversedList[index].getMDate(),reversedList[index].MTime,reversedList[index].getWhomToMeet_Name(),reversedList[index].getReason(),reversedList[index].getRescheduledTime() );
            }
        ),
      ),
    );
  }




}