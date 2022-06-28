import 'package:flip_card/flip_card.dart';
import'package:flutter/material.dart';
import'dart:math'as math ;
import 'dart:ui'as ui;

import '../../../constant.dart';
class DisScreen extends StatefulWidget {
  String? backdrop_path;
  num id;
  String? original_title;
  String? overview;
  String poster_path;
  String? title;
  num? vote_average;


  @override
  _DisScreenState createState() => _DisScreenState();

  DisScreen({
    required this.backdrop_path,
    required this.id,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.title,
    required this.vote_average,

  });
}

class _DisScreenState extends State<DisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit:StackFit.expand,
        children: [
          Transform(transform: Matrix4.rotationY(math.pi),alignment: Alignment.center,
            child: Image.network(image_url+widget.poster_path),),
          BackdropFilter(
            filter:ui.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Container(
              color: Colors.red.withOpacity(0.2),


            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  SizedBox(
                    height:MediaQuery.of(context).size.height/24,

                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(onPressed: (){
                        Navigator.pop(context);
                      }, icon:Icon(Icons.arrow_back_ios,size:25,color:Colors.white), label:Text("Button Back",style:TextStyle(
                        color:Colors.white,fontSize: 25,
                        fontWeight: FontWeight.w800,
                      )),
                      )
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height/50,

                  ),
                  FlipCard(
                    fill:Fill.fillBack,
                    front:Container(
                      height: MediaQuery.of(context).size.height/1.6,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          image: DecorationImage(image: NetworkImage(
                              image_url+widget.poster_path
                          ),fit:BoxFit.fill

                          )
                      ),
                    ), back:Container(
                    height: MediaQuery.of(context).size.height/1.6,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        image: DecorationImage(image: NetworkImage(
                            image_url+widget.poster_path
                        ),
                            fit:BoxFit.fill

                        )
                    ),
                  ),
                  ),
                  Row(
                    children: [
                      Expanded( flex:70,
                          child: Text("${widget.title}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                      Expanded( flex:30,
                        child: Text(
                            "${widget.vote_average}/10",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  Text("${widget.overview}",style: TextStyle(
                      color: Colors.white  )
                  ),SizedBox(
                    height:MediaQuery.of(context).size.height/10,

                  ),


                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton:FloatingActionButton.extended(onPressed: (){

      }, elevation: 10,
          backgroundColor: primarycolor,
          autofocus: true,
          label:Text("Watch on EgyBest",style: TextStyle(
              fontSize: 16
          ),
          )
      ) ,
    );
  }
}
