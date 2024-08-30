import 'package:flutter/material.dart';

bool _isChecked = false;

class TaskScreen extends StatelessWidget {

  Widget buildbottomsheet(BuildContext context)
  {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0) ,topRight: Radius.circular(20.0),)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 32.0),),
              SizedBox(width: 1.0,height: 35.0,),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value)
                {
                  print(value);
                },
                decoration: InputDecoration(
                    hintText: 'Your Task',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
              ),
              ),
              SizedBox(width: 1.0,height: 60.0,),
              FloatingActionButton(onPressed: null,
              child: Text("Add"),
              backgroundColor: Colors.lightBlueAccent,
                foregroundColor: Colors.white,
                elevation: 7.0,
      
              ),
            ],
          ),
        ),
      ),
    );
  }
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: ()
    {
      showModalBottomSheet(context: context, builder: buildbottomsheet);
          },
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
            onChanged: (bool? value) {
              print("checked or not");
            },
          ),
          TaskTile(
            title: "Task2",
            onChanged: (bool? value) {
              print("checked or not");
            },
          ),
        ],
      ),
    );
  }
}

class TaskTile extends StatefulWidget {

  final String title;
  final ValueChanged<bool?> onChanged;


  TaskTile({
    required this.title,
    required this.onChanged,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked=false;
  void checkboxCallback(bool? checkboxState)
  {
    setState(() {


      isChecked=checkboxState ?? false;
    });
  }
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
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            decoration: isChecked ? TextDecoration.lineThrough : null,
            decorationThickness: 1.8,
          ),
        ),
        trailing: TaskCheckbox(isChecked,checkboxCallback),
      ),
    );
  }
}



class TaskCheckbox extends StatelessWidget {
  final bool checkboxState ;
  final ValueChanged<bool?> toggleCheckbox;
  TaskCheckbox(this.checkboxState,this.toggleCheckbox);
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckbox,
      fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white; // Active color
          }
          return Colors.white; // Inactive color
        },
      ),
      checkColor: Colors.lightBlue.shade800,
    );
  }
}
