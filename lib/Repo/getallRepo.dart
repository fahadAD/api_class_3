import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Model/GetAllModel.dart';
import 'package:http/http.dart' as http;
import '../const.dart';

Future<List<GetAllModel>> GetAllRepo()async{
  List<GetAllModel> projectModelList=[];
  const String uri="https://api.todoist.com/rest/v2/projects";
  var response=await http.get(Uri.parse(uri),headers: {
    "Authorization": "Bearer ${await getTokens()}",
  });

  if(response.statusCode==200){
    final data=jsonDecode(response.body);
    for(var items in data){
      projectModelList.add(GetAllModel.fromJson(items));
    }

  }else{
    EasyLoading.showError("Error");
  }
  print(projectModelList);
  return  projectModelList;
}
