
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';
import 'package:project/helper/const.dart';
import 'package:project/models/mid_list.dart';




String baseUrl = "http://192.168.66.48:8000/";
class ShowMedApi{

    Future<Response> addToRoshta({
      required List<MisdList> meds,
      required String url,
      required String name,
      required String userEmail,
      required String specialization,
      required String patientBirthday,
      required String decription,
      }) async{
   String token = await getToken();
    
    Response res = await http.post(
      Uri.parse("$baseUrl$url"),
      headers: {
       'Authorization': 'Bearer $token',
       'Accept':'application/json'
      },
      body:  {
           'patientName': name,
            'patientBirthday': patientBirthday.toString(),
            'userEmail' : userEmail,
             'specialization':specialization,
             'medicine1': meds[0].title.text,
             'time1':meds[0].times.text,
             'medicine2':meds.length>1 ?meds[1].title.text:'',
             'time2' :meds.length>1 ?meds[1].times.text:'',
             'medicine3':meds.length>2 ?meds[2].title.text:'null', 
             'time3':meds.length>2 ?meds[2].times.text:'null',
             'medicine4':meds.length>3 ?meds[3].title.text:'null', 
             'time4':meds.length>3 ?meds[3].times.text:'null',
             'medicine5':meds.length>4 ?meds[4].title.text:'null',
             'time5':meds.length>4 ?meds[4].times.text:'null',
             'decription':decription,
      }
      
       
      );
      if (kDebugMode) {
        print(
        jsonEncode( {
           'patientName': name,
            'patientBirthday': patientBirthday,
            'userEmail' : userEmail,
             'specialization':specialization,
             'medicine1': meds[0].title.text,
             'time1':meds[0].times.text,
             'medicine2':meds.length>1 ?meds[1].title:null,
             'time2' :meds.length>1 ?meds[1].times.text:null,
             'medicine3':meds.length>2 ?meds[2].title.text:null, 
             'time3':meds.length>2 ?meds[2].times.text:null,
             'medicine4':meds.length>3 ?meds[3].title.text:null, 
             'time4':meds.length>3 ?meds[3].times.text:null,
             'medicine5':meds.length>4 ?meds[4].title.text:null,
             'time5':meds.length>4 ?meds[4].times.text:null,
             'decription':decription,
      })
      );
      }
      
     
      return res;
  }
  Future<Response> showMed(url) async{
    String token = await getToken();
    Response res = await http.get(
      Uri.parse("$baseUrl$url"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      },
    
      );
      return res;
  }

  get(Uri parse) {}
  
}