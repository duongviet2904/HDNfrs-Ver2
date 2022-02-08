import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hdnfr_ver2/extensions.dart';
import 'package:hdnfr_ver2/models/weather.dart';
import 'package:hdnfr_ver2/screens/onboarding.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Weather _weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery
        .of(context)
        .size;
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "HDNfrs",
                          style: TextStyle(
                              color: Colors.black38, fontSize: 22
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/HaUI.png"),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: 0, left: 0),
                        child: Divider(
                          height: 25,
                          color: Colors.black,
                        )
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/icons/plus.png"),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text("Thêm")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                              color: Colors.teal[50],
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/icons/cucumber.png"),
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15,),
                                  Padding(padding: EdgeInsets.only(right: 5, left: 5), child: Text("Dưa chuột"),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/icons/tomato.png"),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Padding(padding: EdgeInsets.only(right: 5, left: 5), child: Text("Cà chua"),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/icons/grapes.png"),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Padding(padding: EdgeInsets.only(right: 5, left: 5), child: Text("Nho"),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/icons/lemons.png"),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Padding(padding: EdgeInsets.only(right: 5, left: 5), child: Text("Chanh"),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/icons/watermelon.png"),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Padding(padding: EdgeInsets.only(right: 5, left: 5), child: Text("Dưa hấu"),)
                        ],
                      ),
                    ),
                  ],),

                ),
              ),
              //===================================================================
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                  color: Colors.teal[50],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: (size.width / 4),
                            height: 100,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    // color: Colors.white38,
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/icons/fertilizer.png"),
                                          fit: BoxFit.fill
                                      )
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text("Tính toán \n phân bón", textAlign: TextAlign.left,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: (size.width / 4),
                            height: 100,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    // color: Colors.white38,
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/icons/worm.png"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text("Sâu hại và \n Bệnh cây", textAlign: TextAlign.left,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: (size.width / 4),
                            height: 100,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.topLeft,
                                  // padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    // color: Colors.grey,
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/icons/growth.png"),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text("Mẹo canh tác", textAlign: TextAlign.left,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                // alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Kiểm tra bệnh cây trồng",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      ],),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.teal[50],
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/icons/image.png", width: 65,),
                              SizedBox(width: 10,),
                              Image.asset("assets/images/icons/right.png", width: 30,),
                              SizedBox(width: 10,),
                              Image.asset("assets/images/icons/development.png", width: 55,),
                              SizedBox(width: 10,),
                              Image.asset("assets/images/icons/right.png", width: 30,),
                              SizedBox(width: 10,),
                              Image.asset("assets/images/icons/medicine.png", width: 55,),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlatButton(
                                child: Text(
                                  "Chọn ảnh",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                                color: Colors.teal,
                                onPressed: () => {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),

                              FlatButton(
                                child: Text(
                                  "Chụp ảnh",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                                color: Colors.teal,
                                onPressed: () => {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Thời tiết",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                      ],),
                    SizedBox(height: 10,),
                    Container(
                      child: FutureBuilder(
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot != null) {
                            this._weather = snapshot.data;
                            if (this._weather == null) {
                              return Text("Error getting weather");
                            } else {
                              return  weatherBox(_weather);
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                        future: getCurrentWeather(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Thư viện ảnh",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                        SvgPicture.asset("assets/images/forward_icon.svg")
                      ],),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Onboarding()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/back.jpg"))
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: (MediaQuery.of(context).size.width - 70) / 2,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: AssetImage("assets/images/duachuot-back.jpg"),fit: BoxFit.cover)
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: (MediaQuery.of(context).size.width - 70) / 2,
                              height: 230,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: AssetImage("assets/images/nho-back.jpg"),fit: BoxFit.cover)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20,),
                        Column(
                          children: <Widget>[
                            Container(
                              width: (MediaQuery.of(context).size.width - 70) / 2,
                              height: 230,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: AssetImage("assets/images/cachua-back.jpg"),fit: BoxFit.cover)
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              width: (MediaQuery.of(context).size.width - 70) / 2,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: AssetImage("assets/images/suongmai.jpg"),fit: BoxFit.cover)
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ),
            ],
          ),
        ],
      ),)
    );
  }

  Widget weatherBox(Weather _weather) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(15.0),
        // margin: const EdgeInsets.all(15.0),
        height: 160.0,
        decoration: BoxDecoration(
            color: Colors.indigoAccent,
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      ClipPath(
          clipper: Clipper(),
          child: Container(
              padding: const EdgeInsets.all(15.0),
              // margin: const EdgeInsets.all(15.0),
              height: 160.0,
              decoration: BoxDecoration(
                  color: Colors.indigoAccent[400],
                  borderRadius: BorderRadius.all(Radius.circular(20))))),
      Container(
          padding: const EdgeInsets.all(15.0),
          // margin: const EdgeInsets.all(15.0),
          height: 160.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        getWeatherIcon(_weather.icon),
                        Container(
                            margin: const EdgeInsets.all(5.0),
                            child: Text(
                              "${_weather.description.capitalizeFirstOfEach}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.white),
                            )),
                        Container(
                            margin: const EdgeInsets.all(5.0),
                            child: Text(
                              "H:${_weather.high.toInt()}°C L:${_weather.low.toInt()}°C",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Colors.white),
                            )),
                      ])),
              Column(children: <Widget>[
                Container(
                    child: Text(
                      "${_weather.temp.toInt()}°C",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: Colors.white),
                    )
                ),
                Container(
                    margin: const EdgeInsets.all(0),
                    child: Text(
                      "Cảm giác: ${_weather.feelsLike.toInt()}°C",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.white),
                    )),
              ])
            ],
          ))
    ]);
  }

  Image getWeatherIcon(String _icon) {
    String path = 'assets/images/weather/';
    String imageExtension = ".png";
    return Image.asset(
      path + _icon + imageExtension,
      width: 70,
      height: 70,
    );
  }

  Future getCurrentWeather() async {
    Weather? weather;
    String city = "Ha Noi";
    String apiKey = "e753b4f9ba0c7b3e498bca448bf37072";
    var url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      weather = Weather.fromJson(jsonDecode(response.body));
    }
    return weather;
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height - 20);

    path.quadraticBezierTo((size.width / 6) * 1, (size.height / 2) + 15,
        (size.width / 3) * 1, size.height - 30);
    path.quadraticBezierTo((size.width / 2) * 1, (size.height + 0),
        (size.width / 3) * 2, (size.height / 4) * 3);
    path.quadraticBezierTo((size.width / 6) * 5, (size.height / 2) - 20,
        size.width, size.height - 60);

    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(Clipper oldClipper) => false;
}
//
// class Clipper2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, size.height - 20);
//
//     path.quadraticBezierTo((size.width / 6) * 1, (size.height / 2) + 15,
//         (size.width / 3) * 1, size.height - 30);
//
//     path.lineTo(size.width, size.height - 60);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper){
//     return true;
//   }
// }