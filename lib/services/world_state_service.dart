import 'dart:convert';

import 'package:covid_tracker/app_url/app_url.dart';
import 'package:http/http.dart' as http ;
import '../models/WordStateModel.dart';

class WorldStateService{
  Future <WordStateModel> worldStateFunction()async{
     final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
     if(response. statusCode ==200){
       var data =jsonDecode(response.body);
       return WordStateModel.fromJson(data);
     }
     else {
       throw Exception('Error');
     }

  }
}