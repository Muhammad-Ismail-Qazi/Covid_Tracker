 import 'dart:convert';

import 'package:covid_tracker/models/countries_model.dart';
import 'package:http/http.dart' as http;
import '../app_url/app_url.dart';

 class CountriesListService{
   List<CountriesModel> addCountries=[];
   Future <List<CountriesModel>> countriesListFunction ()async{
    final response= await http.get(Uri.parse(AppUrl.countriesList));
    if(response.statusCode==200){
      var data =jsonDecode(response.body);

      for(Map i in data){
        addCountries.add(CountriesModel.fromJson(i));
      }
      return addCountries;

    }
    else{
      return addCountries;
      
    }
   }
 }