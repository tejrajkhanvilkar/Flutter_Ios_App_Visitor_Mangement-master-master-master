import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:telephony/telephony.dart';
import 'package:visitorproject/VisitorDataModel.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity>
{

  // var firebaseAuth;
  //var  currentUser="IuVIPmybxYM7PSeq03c9PxMBzAx1";

  var firedbAuth=FirebaseAuth.instance;

  String currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  final dateDBReference=FirebaseDatabase.instance.reference().child("DateDB");
  List<VisitorDataModel> visitorList=[];
  List<VisitorDataModel> reversedList=[];
  var hour;
  var minute;
  final Telephony telephony = Telephony.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Firebase Messaging
    Firebase.initializeApp();

    //String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

    var currentUser=firedbAuth.currentUser;

    final dateDBChildReference=dateDBReference.child(currentDate);

    final FirebaseMessaging fdbmsgToken= FirebaseMessaging.instance;
    fdbmsgToken.getToken().then((value)
    {
          print(value);
          final userdbref=FirebaseDatabase.instance.reference().child("Users").child(currentUser!.uid);
          userdbref.child("token").set(value);
    });


    dateDBChildReference.onChildAdded.listen((event) {
      //visitorList.clear();
      VisitorDataModel visitordatamodel=new VisitorDataModel.fromDataSnap(event.snapshot);
      bool visited=visitordatamodel.isVisited_Status();
      if(!visited) {

        if(currentUser!.uid==visitordatamodel.getWhomToMeet())
        {
            visitorList.add(visitordatamodel);
            reversedList = new List.from(visitorList.reversed);
            print("Data inserted...");
        }

      }
      setState(() {

      });

    });

  }

  Widget setui(String fnm,String lnm,String mob,String whom_to_meet,String reason,String fstatus,String visitedstatusupdate, String uid, int index,String reschedule)
  {


    final newdateDBChildReference=dateDBReference.child(currentDate);


    return new GestureDetector(
      onLongPress: (){},
      onTap: (){},
      child: Card(
        color: Colors.blue[100],
        child: Container(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    fnm+" "+lnm,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    whom_to_meet,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    mob,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    reason,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    fstatus,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),

                  Text(
                    visitedstatusupdate,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),



                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(onPressed: ()async{
                    //_showMyDialog();
                    // newdateDBChildReference.child(uid).update({
                    //   'Visited_Status':true,
                    //   'Visited_Status_Update':'Accepted'
                    // });
                    // visitorList.remove(index);

                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Accept this request'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('Accept this visitors request to meet you?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                newdateDBChildReference.child(uid).update({
                                  'Visited_Status':true,
                                  'Visited_Status_Update':'Accepted',
                                  'RescheduledTime' : '-'
                                });
                                Navigator.of(context).pop();
                                reversedList.removeAt(index);
                                setState(() {

                                });
                                telephony.sendSmsByDefaultApp(to: mob, message: "Your request is been accepted");
                              },
                            ),
                          ],
                        );
                      },
                    );


                  },
                      child: Text("Accept"),

                  ),
                  ElevatedButton(onPressed: ()async{
                    //_showTimePicker();

                    final TimeOfDay? picked=await showTimePicker(context: context,initialTime: TimeOfDay(hour: 5,minute: 10));
                    if(picked != null)
                    {
                      //print(picked.format(context));
                      //print(picked.hour);
                      hour = picked.hour.toString();
                      minute= picked.minute.toString();
                      newdateDBChildReference.child(uid).update({
                        'Visited_Status':true,
                        'Visited_Status_Update':'Rescheduled',
                        'RescheduledTime': picked.hour.toString()+ ":" +picked.minute.toString()
                      });
                    }
                    reversedList.removeAt(index);
                    setState(() {

                    });
                    telephony.sendSmsByDefaultApp(to: mob, message: "Your request is been rescheduled at "+hour+ ":" +minute);
                  },
                      child: Text("Reschedule")),
                  ElevatedButton(onPressed: ()async{

                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Deny this request'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('Deny this visitors request to meet you?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                newdateDBChildReference.child(uid).update({
                                  'Visited_Status':true,
                                  'Visited_Status_Update':'Deny',
                                  'RescheduledTime': '-'
                                });
                                Navigator.of(context).pop();
                                reversedList.removeAt(index);
                                setState(() {

                                });
                                telephony.sendSmsByDefaultApp(to: mob, message: "Your request is been denied");
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                      child: Text("Deny")),
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
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Home Activity'),
        centerTitle: true,
      ),

      body: new Container(

        child: reversedList.length==0?Text("No Data Available"):new ListView.builder(
            itemCount: reversedList.length,
            itemBuilder:(_,index)
            {
              return setui(reversedList[index].First_Name,reversedList[index].Last_Name,reversedList[index].Mobile_NO, reversedList[index].WhomToMeet, reversedList[index].Reason, reversedList[index].FeverStatus, reversedList[index].Visited_Status_Update, reversedList[index].Vuid, index, reversedList[index].getRescheduledTime());
            }
        ),
      ),
    );
  }
}
