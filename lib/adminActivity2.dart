import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telephony/telephony.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visitorproject/VisitorDataModel.dart';

class AdminActivity2 extends StatefulWidget {
  const AdminActivity2({Key? key}) : super(key: key);

  @override
  _AdminActivity2State createState() => _AdminActivity2State();
}

class _AdminActivity2State extends State<AdminActivity2>
{

  // var firebaseAuth;
  // var reversedList;
  //var  currentUser="IuVIPmybxYM7PSeq03c9PxMBzAx1";
  List<VisitorDataModel> visitorslist=[];
  final dateDBReference=FirebaseDatabase.instance.reference().child("DateDB");
  List<VisitorDataModel> reversedList=[];
  final Telephony telephony = Telephony.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Firebase Messaging
    // String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

    setvisitorslist();

  }

  void setvisitorslist()
  {

    dateDBReference.once().then((DataSnapshot dtsnap)
    {
      var currentdate=dtsnap.value;
      currentdate.forEach((key,value)
      {
        var datedbchildref=dateDBReference.child(key);
        datedbchildref.once().then((DataSnapshot snap)
        {
          var currid=snap.value;
          currid.forEach((key,value)
          {
            print(key);

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
            visitorslist.add(visitordatamodel);
             reversedList = new List.from(visitorslist.reversed);
          });
          setState(() {

          });
        });
        setState(() {

        });

      });

      setState(() {

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
        title: Text('Admin Activity'),
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







