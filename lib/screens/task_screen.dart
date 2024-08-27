import 'package:flutter/material.dart';

bool _isChecked = false;

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: null,
        shape: CircleBorder(),
      ),
      appBar: AppBar(
        title: Text('Todoss',style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),),
          backgroundColor: Colors.blue[600],
          actions: [
      IconButton(
      icon: Icon(Icons.search,color: Colors.white,),
      onPressed: () {
        // Action for search button
      },
    ),
    ],
        leading: Row(
          mainAxisSize: MainAxisSize.min, // Ensures the row takes up the minimum necessary space
          children: [
            SizedBox(
              width: 16.0,
              height:10.0 ,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.check,
                color: Colors.blue[800],
                size: 37.0,
              ),

              ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
                padding: EdgeInsets.only(
                    top: 40.0, left: 30.0, right: 30.0),
                child: Text(
                  'Todoss',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, left: 30.0, right: 30.0, bottom: 40.0),
                child: Text("5 Tasks",style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),),
              ),

              Expanded(
                child: TasksList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0),)
      ),
      child: ListView(
        padding:  EdgeInsets.all(10),
        children: <Widget>[
          TaskTile(
            title: "Task1",
            isChecked: false,
            onChanged: (bool? value) {
              print("checked or not");
            },
          ),
          TaskTile(
            title: "Task2",
            isChecked: false,
            onChanged: (bool? value) {
              print("checked or not");
            },
          ),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  TaskTile({
    required this.title,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.0),
      margin: EdgeInsets.symmetric(vertical: 2.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 0.8,
        ),
        color: Colors.lightBlue.shade600,
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: onChanged,
          fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.white; // Active color
              }
              return Colors.white; // Inactive color
            },
          ),
          checkColor: Colors.lightBlue.shade600,
        ),
      ),
    );
  }
}