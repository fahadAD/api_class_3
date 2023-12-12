import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Provider/provider.dart';
import '../Repo/get_new_repo.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _token="";
  getDataFun() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
    _token= prefs.getString("token")??"";
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFun();
    Provider.of<GetAllProvider>(context,listen: false).getProjectData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          EasyLoading.show(status: "Added...");
 bool isAdded=await GetNewRepo(name: "New Sahad");
 if(isAdded){
   EasyLoading.showSuccess("Added Done");
 }else{
   EasyLoading.showError("Error...");
 }
        },child: Icon(Icons.add)),
        body:  Consumer<GetAllProvider>(builder: (context, value, child) {
          return Column(
            children: [

              Center(child: Text(_token,style: TextStyle(fontWeight: FontWeight.bold),)),

 ListView.builder(
   primary: false,
   shrinkWrap: true,
   itemCount: value.allProjectModelList.length,
   itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Text(value.allProjectModelList[index].name??""),);
 },
 ),

            ],
          );
        },),
      ),
    );
  }
}
// MaanAcademyBatch2023