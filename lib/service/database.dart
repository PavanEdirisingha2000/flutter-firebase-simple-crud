import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  //create method
  Future<void> addEmployeeDetails(
    Map<String, dynamic> employeeInfoMap, String id) async{
return await FirebaseFirestore.instance
.collection("Employee")
.doc(id)
.set(employeeInfoMap);
  } 

  //read method
Future<Stream<QuerySnapshot>> getEmployeeDetails() async{
  return await FirebaseFirestore.instance.collection("Employee").snapshots();
}

//update method
Future UpdateEmployeeDetails( String id, Map<String,dynamic> updateInfo) async{
  return await FirebaseFirestore.instance.collection("Employee").doc(id).update(updateInfo);
}

//delete method
Future DeleteEmployeeDetails(String id) async{
  return await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
}

}