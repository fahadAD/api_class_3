
import 'package:shared_preferences/shared_preferences.dart';

String clientId="8737faa30cc347e0b36ebf7e83bd0a3d";
String clientSecred="729e1d168e134c4d83b4c17106165a74";
String states="hghhkjkh";
String code="";

String extractCodeFromUrl({required String redirectUrl}) {
  RegExp regExp = RegExp(r'code=([^&]+)');
  Match match = regExp.firstMatch(redirectUrl) as Match;
  String? code = match.group(1);
  return code ?? '';
}

Future<String> getTokens() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("token")??"";
}