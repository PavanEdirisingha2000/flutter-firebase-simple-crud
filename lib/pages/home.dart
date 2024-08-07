import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_crud/pages/employee.dart';
import 'package:simple_crud/service/database.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   TextEditingController namecontroller= new TextEditingController();
  TextEditingController agecontroller= new TextEditingController();
  TextEditingController locationcontroller= new TextEditingController();

Stream? EmployeeStream;

getontheload()async{
EmployeeStream= await DatabaseMethods().getEmployeeDetails();
setState(() {
  
});
}

@override
void initState() {
  getontheload();
  super.initState();
  
}

Widget allEmployeeDetails(){

  return StreamBuilder(
    stream: EmployeeStream,
    builder: (context, AsyncSnapshot Snapshot){
return Snapshot.hasData? 
ListView.builder(
  itemCount: Snapshot.data.docs.length,
  itemBuilder:(context, index)  {
    DocumentSnapshot ds= Snapshot.data.docs[index];
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      
                      children: [
                        Text("Name : "+ds["Name"], 
                        style: TextStyle(fontSize: 20.0, color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            namecontroller.text= ds["Name"];
                            agecontroller.text= ds["Age"];
                            locationcontroller.text= ds["Location"];
                            editEmployeeDetails(ds["Id"]);
                          },
                          child: Icon(Icons.edit,color: Colors.blue, size: 20.0,)),
                          SizedBox(width: 10.0,),
                          GestureDetector(
                            onTap: ()async{
                              await DatabaseMethods().DeleteEmployeeDetails(ds["Id"]);
                              
                            },
                            child: Icon (Icons.delete, color: Colors.red, size: 20.0,)),
                      ],
                    ),
                    
                    Text("Age : "+ds["Age"], 
                    style: TextStyle(fontSize: 20.0, color: Colors.blue, fontWeight: FontWeight.bold),),
                  
                  Text("Location : "+ds["Location"], 
                  style: TextStyle(fontSize: 20.0, color: Colors.blue, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              ),
    );



}): Container();
  });
  

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Employee()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User Details", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold,),),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          children: [
           Expanded (child: allEmployeeDetails()),
          ],
        ),
      ),
    );
  }
Future editEmployeeDetails(String id)=> showDialog(context: context, builder: (context)=> AlertDialog(
  content: Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.cancel, color: Colors.red,),
            ),
            SizedBox(width: 60.0,),
          ],
        ),
        SizedBox(height: 30.0,),
         Text("Name", style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10.0)
              ),
              child: TextField( 
                controller: namecontroller,
                decoration: InputDecoration(
                  border: InputBorder.none), 
                ),
              ),
              SizedBox(height: 20.0,),
              Text("Age", style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10.0)
              ),
              child: TextField( 
                controller: agecontroller,
                decoration: InputDecoration(
                  border: InputBorder.none), 
                ),
              ),
              SizedBox(height: 20.0,),
              Text("Location", style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10.0)
              ),
              child: TextField( 
                controller: locationcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none), 
                ),
              ),
              SizedBox(height: 30.0, ),
              
              ElevatedButton(onPressed:()async{
                Map<String, dynamic> updateInfo={
                  "Id": id,
                  "Name": namecontroller.text,
                  "Age": agecontroller.text,
                  "Location": locationcontroller.text
                };
                await DatabaseMethods().UpdateEmployeeDetails(id, updateInfo).then((value) {
                  Navigator.pop(context);
  
                });
               
              }, child: Text("Update")),
      ],
    ),
  ),
));


}