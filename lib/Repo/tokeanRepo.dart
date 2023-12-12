import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../const.dart';
Future<void> getTokeanRepo()async{

  const String uri="https://todoist.com/oauth/access_token";
var response=await http.post(Uri.parse(uri),body: {
  "client_id":clientId,
  "client_secret":clientSecred,
  "code":code,
});
if(response.statusCode==200){

final data=jsonDecode(response.body);
print(data["access_token"]);
final SharedPreferences prefs = await SharedPreferences.getInstance();
print(response.body);
prefs.setString("token", data["access_token"]);
EasyLoading.showSuccess("Success Done");
}else{
  EasyLoading.showError("Error");
}

}