import 'package:flutter/material.dart';
// import 'package:hdnfr_ver2/json/Diseases.dart';
import 'package:hdnfr_ver2/models/disease.dart';
import 'package:hdnfr_ver2/screens/result_detail.dart';
import 'detail.dart';

class ResultPage extends StatelessWidget {

  final List<Disease> diseases;
  final lstRate;
  const ResultPage({
    required this.diseases,
    required this.lstRate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 20;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Kết quả dự đoán",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: diseases.length,
                        itemBuilder: (context, index) {
                          return RealEstateItem(
                            itemData: diseases[index], diseases: diseases,lstRate: lstRate,x: index,
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final Disease itemData;
  final List<Disease> diseases;
  final lstRate;
  final int x;
  const RealEstateItem({Key? key, required this.itemData, required this.diseases,required this.lstRate,required this.x}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ResultDetailPage(
                itemData: itemData,
                diseases: diseases,
                lstRate: lstRate,
                x: x,
            )));
      },
      child: Container(

        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(itemData.name + " (" + lstRate[x].toStringAsFixed(2) + "%)",style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ],),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Triệu chứng",style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500
                                      ),),
                                    ],),
                                  SizedBox(height: 10,),
                                  DescriptionTextWidget(text: itemData.symptom,),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: (MediaQuery.of(context).size.width - 95) / 2,
                                            height: 145,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                                image: DecorationImage(image: AssetImage(itemData.relatedImage1),fit: BoxFit.cover)
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            width: (MediaQuery.of(context).size.width - 95) / 2,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                                                image: DecorationImage(image: AssetImage(itemData.relatedImage2),fit: BoxFit.cover)
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            width: (MediaQuery.of(context).size.width - 95) / 2,
                                            height: 255,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                                                image: DecorationImage(image: AssetImage(itemData.relatedImage3),fit: BoxFit.cover)
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
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

    if (widget.text.length > 60) {
      firstHalf = widget.text.substring(0, 60);
      secondHalf = widget.text.substring(60, widget.text.length);
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