import 'dart:convert';
import 'package:http/http.dart' as http;
import '../const.dart';
Future<bool> GetNewRepo({required String name})async{
   const String uri="https://api.todoist.com/rest/v2/projects";
  var response=await http.post(Uri.parse(uri),
    headers: {
    "Authorization": "Bearer d0867e71239e11bcce7ec2c2d7bbc0362e4b352c",
    "Content-Type" : "application/json",
    // "Authorization": "Bearer ${await getTokens()}",
  },
    // body: jsonEncode({"name" : name}),
    body:  {
    "name" : name
    },
  );

   print(response.body);
   print(response.statusCode);
   if(response.statusCode==200){
     return true;

   }else{
     return false;
   }
}