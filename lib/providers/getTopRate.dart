import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import'package:http/http.dart'as http ;
import '../models/moviemodel.dart';
final getTopRateData=ChangeNotifierProvider<GetTopRate>((ref)=>GetTopRate());
class GetTopRate extends ChangeNotifier{
  List<Movie>listDataModel=[];
  GetTopRate(){
    getData();
  }
  Future getData()async{
    listDataModel=[];

    try {
      String APIKEY="8e446fb9bddfe7928808d59190789aa0";
      var url =Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=8e446fb9bddfe7928808d59190789aa0&language=en-US&page=1");
      print(url);
      var response = await http.get(url);
      var responsebody=jsonDecode(response.body)["results"];
      print(responsebody);
      for(int i=0;i<responsebody.length;i++){
        listDataModel.add(Movie.fromMap(responsebody[i]));

      }
    }
    catch(e){
      print("e$e");

    }
    notifyListeners();

  }



}