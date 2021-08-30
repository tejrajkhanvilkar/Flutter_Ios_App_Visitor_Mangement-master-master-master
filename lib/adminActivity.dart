import 'FacultyList.dart';
import 'VisitorList.dart';
import 'package:flutter/material.dart';

class adminActivity extends StatefulWidget {
  const adminActivity({Key? key}) : super(key: key);

  @override
  demoFacultyList createState() => demoFacultyList();
}

class demoFacultyList extends State<adminActivity> {

  String str = 'Visitor List';
  List<FacultyList> facultyList = [
    FacultyList(nm: 'Subhash Tatale',
        from : 'Infosys',
        mobno: '8989898989',
        temp: '95 f',
        stat: 'Rescheduled',
        date: '25-02-2021',
        time: '12:15',
        meet: 'Mr Atul Kulkarni',
        purpose: 'To discuss about the placements of viit students'
    ),
    FacultyList(nm: 'Subhash Tatale',
        from : 'Infosys',
        mobno: '8989898989',
        temp: '95 f',
        stat: 'Rescheduled',
        date: '25-02-2021',
        time: '12:15',
        meet: 'Mr Atul Kulkarni',
        purpose: 'To discuss about the placements of viit students'
    ),


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: Text('Faculty List Activity'),
        centerTitle: true,

      ),

      body:_buildRow(),
    );
  }

  Widget _buildRow() {
    return ListView.builder(
        itemCount: facultyList.length,
        itemBuilder: (context, index) {
          return Card(
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
                              'Name:   '+facultyList[index].nm ,overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'From:   '+facultyList[index].from,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500

                              ),
                            ),

                            SizedBox(height: 10,),
                            Text(
                              'Mobile No.:   '+ facultyList[index].mobno ,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500

                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Temp:   '+ facultyList[index].temp,
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
                        //     visitorsList.insert(index, VisitorList
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
                            'Visited Status:   '+facultyList[index].stat ,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500

                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Date             :   '+ facultyList[index].date ,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500

                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Requested \nTime            :   '+facultyList[index].time ,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500

                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Reschedule \nTime            :   '+facultyList[index].time ,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500

                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'To Meet      :   '+facultyList[index].meet ,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Purpose      :   '+facultyList[index].purpose ,
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
                          child: ElevatedButton(onPressed: (){},

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
                        ElevatedButton(onPressed: (){},
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


    );
  }
}