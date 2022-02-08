import 'dart:ui';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final dynamic itemData;

  const DetailPage({Key? key,@required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white70,
        title: Text("${itemData["name"]}",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("${itemData["name"]}", style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)
                          ,),
                        SizedBox(height: 30,),
                        Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeVideo(image: '${itemData["relatedImage1"]}'),
                              makeVideo(image: '${itemData["relatedImage2"]}'),
                              makeVideo(image: '${itemData["relatedImage3"]}'),
                              makeVideo(image: '${itemData["relatedImage4"]}'),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                            Text("Triệu chứng", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ,
                        SizedBox(height: 10,),
                        Text("${itemData["symptom"]}",
                          style: TextStyle(color: Colors.black54, height: 1.4),),
                        SizedBox(height: 20,),
                            Text("Nguyên nhân và đặc điểm phát sinh bệnh", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ,
                        SizedBox(height: 10,),
                        Text("${itemData["reason"]}",
                          style: TextStyle(color: Colors.black54, height: 1.4),),
                        SizedBox(height: 20,),
                            Text("Biện pháp phòng trừ", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ,
                        SizedBox(height: 10,),
                        Text("${itemData["solution"]}",
                          style: TextStyle(color: Colors.black54, height: 1.4),),
                        SizedBox(height: 20,),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5/ 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
}

