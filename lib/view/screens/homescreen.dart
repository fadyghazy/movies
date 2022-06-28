import"package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../constant.dart';
import '../../providers/getTopRate.dart';
import '../../providers/getpopulardata.dart';
import 'disScreen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:black,
        appBar: AppBar(
          backgroundColor:black ,
          elevation: 2,
          title: const Text("Movies app",style: TextStyle(color:black,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: const [
            Icon(Icons.search,color: primarycolor,)

          ],

        ),
        body:Column(
          children: [
            Consumer(builder: ( context, watch,  child){
              final viewmodeltoprate=watch(getTopRateData);
              return CarouselSlider.builder(itemCount:viewmodeltoprate.listDataModel.length,itemBuilder:(context, int itemIndex, int pageViewIndex){
                return GridTile(child: Image.network(image_url+viewmodeltoprate.listDataModel[itemIndex].poster_path
                  ,fit: BoxFit.fill,),
                  footer: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    color: Colors.red.withOpacity(0.7),
                    child: Text(
                      viewmodeltoprate.listDataModel[itemIndex].title,style: const TextStyle(
                      fontWeight: FontWeight.bold,color: black,
                    ),
                    ),

                  ),


                );
              }, options:
              CarouselOptions(autoPlay: true,aspectRatio: 1.5,viewportFraction: 0.7,
                  height: MediaQuery.of(context).size.height/3,
                  initialPage: 0
                  ,reverse: false,
                  autoPlayInterval: const Duration(
                      seconds: 3
                  )
                  ,enableInfiniteScroll:
                  false,
                  autoPlayAnimationDuration: const Duration(
                    microseconds: 300,

                  ),
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal),
              );
            },),
            Expanded(
                child:Consumer(builder: (context, watch, child) {
                  final viewmodelpopular=watch(getpopularData);
                  return Padding(
                      padding: const EdgeInsets.all(5),
                      child:StaggeredGridView.countBuilder(
                          crossAxisCount:2,
                          itemCount:viewmodelpopular.listDataModel.length ,
                          itemBuilder:(BuildContext context ,int itemIndex) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                  return DisScreen(poster_path:viewmodelpopular.listDataModel[itemIndex].poster_path, title:viewmodelpopular.listDataModel[itemIndex].title,id:viewmodelpopular.listDataModel[itemIndex].id,backdrop_path:viewmodelpopular.listDataModel[itemIndex].poster_path, overview:viewmodelpopular.listDataModel[itemIndex].overview, vote_average:viewmodelpopular.listDataModel[itemIndex].vote_average ,original_title:viewmodelpopular.listDataModel[itemIndex].original_title,);
                                  // id:int.parse(viewmodelpopular.listDataModel[itemIndex].id
                                }));
                              },
                              child: Card(
                                color: primarycolor,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Image.network(image_url+viewmodelpopular.listDataModel[itemIndex].poster_path),
                                      Card(
                                          child: Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(5),

                                              child:Text((viewmodelpopular.listDataModel[itemIndex].title
                                              ),
                                                style:const TextStyle(fontWeight: FontWeight.bold,color:Colors.white),),
                                              color: black
                                          )



                                      )

                                    ],
                                  ),
                                ),
                              ),
                            );

                          },
                          staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(1)
                      )
                  );


                },

                )
            )
          ],
        )
    );
  }
}
