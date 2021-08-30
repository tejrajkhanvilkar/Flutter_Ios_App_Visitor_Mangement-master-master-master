import 'package:flutter/material.dart';

class loadScrn extends StatefulWidget {
  const loadScrn({Key? key}) : super(key: key);

  @override
  _loadScrnState createState() => _loadScrnState();
}

class _loadScrnState extends State<loadScrn> {

  int c=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Visitor App'),
      ),

      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: c,
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white,),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined,color: Colors.white,),
            label: 'Activity',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.white,),
            label: 'Settings',
          ),
        ],
        onTap: (index){
          setState(() {
            c=index;
          });

          print(c);
        },
      ),
    );

  }
}
