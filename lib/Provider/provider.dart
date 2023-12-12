import 'package:flutter/cupertino.dart';
import '../Model/GetAllModel.dart';
import '../Repo/getallRepo.dart';

class GetAllProvider extends ChangeNotifier{
  List<GetAllModel> allProjectModelList=[];
  getProjectData() async {
    allProjectModelList=await GetAllRepo();
    notifyListeners();
  }
}
