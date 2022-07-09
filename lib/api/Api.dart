import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApi{

 // final String _url="http://gps.saharshsolutions.co.in";
  final String _url="https://catchride.in/catchride/api/";
  postData(data,apiUrl) async{
    var fullUrl= _url+apiUrl;
   return await http.post(Uri.parse(fullUrl),
    body: jsonEncode(data)
    );
  }


}