import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hdnfr_ver2/models/disease.dart';
import 'package:hdnfr_ver2/screens/result_page.dart';

class ResultDetailPage extends StatelessWidget {
  final Disease itemData;
  final List<Disease> diseases;
  final lstRate;
  final int x;
  const ResultDetailPage({Key? key,required this.itemData, required this.diseases,required this.lstRate, required this.x}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white70,
        title: Text(itemData.name,
          style: TextStyle(
            color: Colors.black
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_headline),
            onPressed: () => {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultPage(diseases: diseases, lstRate: lstRate,)),
              )
            },
          ),
        ],
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
                        Text(itemData.vname + " (" + lstRate[x].toStringAsFixed(2)  + "%)", style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)
                          ,),
                        SizedBox(height: 30,),
                        Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeVideo(image: itemData.relatedImage1),
                              makeVideo(image: itemData.relatedImage2),
                              makeVideo(image: itemData.relatedImage3),
                              makeVideo(image: itemData.relatedImage4),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Triệu chứng", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ,
                        SizedBox(height: 10,),
                        DescriptionTextWidget(text: itemData.symptom),
                        // Text(itemData.symptom,
                        //   style: TextStyle(color: Colors.black54, height: 1.4),),
                        SizedBox(height: (itemData.more != "") ? 20: 10,),
                        Text((itemData.more != "") ? "Thêm thông tin": " ", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ,
                        SizedBox(height: (itemData.more != "") ? 10: 0,),
                        DescriptionTextWidget(text: itemData.more),
                        // Text(itemData.reason,
                        //   style: TextStyle(color: Colors.black54, height: 1.4),),
                        SizedBox(height: (itemData.more != "") ? 20: 0,),
                        Text("Khuyến nghị", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ,
                        SizedBox(height: 10,),
                        DescriptionTextWidget(text: itemData.recommend),
                        // Text(itemData.solution,
                        //   style: TextStyle(color: Colors.black54, height: 1.4),),
                        SizedBox(height: 20,),
                        Text((itemData.more != "") ? "Kiểm soát hữu cơ": " ", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                        DescriptionTextWidget(text: itemData.organic),
                        SizedBox(height: 20,),
                        Text((itemData.more != "") ? "Kiểm soát hoá học": " ", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                        DescriptionTextWidget(text: itemData.chemistry),
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
class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}
class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(200, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      // padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf,
        style: TextStyle(
            fontSize: 16
        ),)
          : new Column(
        children: <Widget>[
          new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf), style: TextStyle(
              fontSize: 16
          ),),
          new InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  flag ? "show more" : "show less",
                  style: new TextStyle(color: Colors.teal),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}
