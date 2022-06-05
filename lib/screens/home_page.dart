import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hdnfr_ver2/diseasesData.dart';
import 'package:hdnfr_ver2/extensions.dart';
import 'package:hdnfr_ver2/models/disease.dart';
import 'package:hdnfr_ver2/models/weather.dart';
import 'package:hdnfr_ver2/screens/diseasesInformation.dart';
import 'package:hdnfr_ver2/screens/result_detail.dart';
import 'package:hdnfr_ver2/screens/result_page.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';




import 'package:hdnfr_ver2/json/JSON_ROOT.dart';
import 'package:hdnfr_ver2/models/plant.dart';
// import 'package:hdnfr_ver2/json/JSON_ROOT.dart';
import 'package:hdnfr_ver2/screens/plant_list.dart';
import 'package:hdnfr_ver2/widget/home_plant_list_widget.dart';
import 'package:hdnfr_ver2/widget/plant_list_widget.dart';
import "package:hdnfr_ver2/screens/plant_list.dart" as listPlant;
import '../plantData.dart';


class HomePage extends StatefulWidget {
  final List<Plant> lstPlant;

  const HomePage({Key? key, required this.lstPlant}):super(key : key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Weather _weather;
  var active = 0;
  var backColor = "Colors.grey[200]";
  final List<Disease> diseasesData = List.from(DiseasesData.diseasesList);
  // final List<Plant> lstPlant = <Plant>[];
  File? _image;
  final picker = ImagePicker();
  Image? _imageWidget;

  String base64str = '';
  String benh1st = "", benh2nd = "", benh3rd = "";
  double tile1 = 0, tile2 = 0, tile3 = 0;

  //ảnh bst
  Future getImage() async {
    print('goi hàm getImage');
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      List<int> imageBytes = _image!.readAsBytesSync();
      base64str = base64Encode(imageBytes);

      // _predict();
    });
    // print(base64str);
  }

  //máy ảnh
  Future getImage_camera() async {
    print('goi hàm getImage_camera');
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      List<int> imageBytes = _image!.readAsBytesSync();
      base64str = base64Encode(imageBytes);

      // _predict();
    });
  }

  Future<String> convert_image_to_base64(String path) async {
    final File file = File(path);
    Uint8List bytes = await file.readAsBytes();

    String array_string = base64Encode(bytes);
    return array_string;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "HDNfrs",
          style: TextStyle(
              color: Colors.black38, fontSize: 22
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () => launch('https://sv.dhcnhn.vn/'),
            child: Padding(padding: EdgeInsets.only(right: 10),
              child: Image(image: AssetImage("assets/HaUI.png"), width: 40,),
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: getBody(),
    );
  }


  Widget buildItem(item, int index, Animation<double> animation) =>
      HomePlantListWidget(
        item: item,
        lstPlant: widget.lstPlant,
        onClicked: () => {active = item.id
        },
      );
  Widget resultPage(benh1st, benh2nd, benh3rd) {
    List<Disease> dataOfResult = [];
    var rate = [];
    final diseasesData = List.from(DiseasesData.diseasesList);
    for(int i = 0; i < diseasesData.length; i++) {
      if (benh1st == diseasesData[i].name) {
        dataOfResult.add(diseasesData[i]);
        rate.add(tile1);
        break;
      }
    }
    for (int i = 0; i < diseasesData.length; i++) {
      if (benh2nd == diseasesData[i].name) {
        dataOfResult.add(diseasesData[i]);
        rate.add(tile2);
        break;
      }
    }
    for (int i = 0; i < diseasesData.length; i++) {
      if (benh3rd == diseasesData[i].name) {
        dataOfResult.add(diseasesData[i]);
        rate.add(tile3);
        break;
      }
    }

    if (tile1 >= 95.00) return ResultDetailPage(itemData: dataOfResult[0], diseases: dataOfResult, lstRate: rate, x: 0,);
    else if(tile1 <= 30){
        return AlertDialog(
         title: Text("Thông báo"),
         content: Text("Có khả năng chúng tôi chưa thể giải quyết vấn đề trên cây trồng của bạn ngay, vui lòng chụp bổ sung ảnh để đưa vào cuộc khảo sát cuối tháng"),
          actions: [
          ElevatedButton(
          child: Text("Đóng"),
              onPressed: (){
        Navigator.of(context).pop(); // Return value
        }
        ),]);
      }
    return ResultPage(diseases: dataOfResult, lstRate: rate);
  }

  Widget getBody(){
    var size = MediaQuery
        .of(context)
        .size;
    // final items = List.from(widget.lstPlant);
    final plantList = List.from(PlantData.PlanDataList);
    final key = GlobalKey<AnimatedListState>();

    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(right: 15),
                child: SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 122,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AnimatedList(
                            scrollDirection: Axis.horizontal,
                            key: key,
                            initialItemCount: widget.lstPlant.length,
                            itemBuilder: (context, index, animation) =>
                                buildItem(widget.lstPlant[index], index, animation),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            width: 60,
                            height: 40,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              // color: Colors.grey[100],
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2)
                            ),
                            child: Image.asset("assets/images/icons/plus.png", width: 35,),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainPage(title: 'Chọn cây trồng', items: widget.lstPlant,)));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //===================================================================
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(

                  // borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                    color: active == 1 ? Colors.teal[50] : active == 2 ? Colors.red[50] : active == 3 ? Colors.indigo[50] : active == 4 ? Colors.lime[50] : active == 5 ? Colors.orange[50] : Colors.grey[200]
                  // color: backColor
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
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DiseasesInformation(diseases: diseasesData,)),
                        );
                      },
                      child: Container(
                        child: Padding(
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
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
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
                                onPressed: () async {
                                  await getImage();
                                  // final url = Uri.parse('http://ec2-44-203-161-33.compute-1.amazonaws.com:6868/predict');
                                  final url = Uri.parse('http://ec2-122-248-216-18.ap-southeast-1.compute.amazonaws.com:6868/predict');
                                  // final url = Uri.parse('http://ec2-3-94-187-209.compute-1.amazonaws.com:6868/predict');

                                  final response = await http.post(url, body: json.encode({'data' : base64str}));

                                  final response2 = await http.get(url);

                                  final decoded = json.decode(response2.body) as Map<String, dynamic>;

                                  setState(() {
                                    benh1st = decoded['benh1st'];
                                    benh2nd = decoded['benh2nd'];
                                    benh3rd = decoded['benh3rd'];
                                    tile1 = decoded['tile1'];
                                    tile2 = decoded['tile2'];
                                    tile3 = decoded['tile3'];
                                  });

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => resultPage(benh1st, benh2nd, benh3rd)),
                                  );

                                },
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
                                onPressed: () async {
                                  await getImage_camera();
                                  // final url = Uri.parse('http://192.168.100.3:6868/predict');
                                  final url = Uri.parse('http://ec2-122-248-216-18.ap-southeast-1.compute.amazonaws.com:6868/predict');
                                  // final url = Uri.parse('http://ec2-3-94-187-209.compute-1.amazonaws.com:6868/predict');

                                  final response = await http.post(url, body: json.encode({'data' : base64str}));

                                  final response2 = await http.get(url);

                                  final decoded = json.decode(response2.body) as Map<String, dynamic>;

                                  setState(() {
                                    benh1st = decoded['benh1st'];
                                    benh2nd = decoded['benh2nd'];
                                    benh3rd = decoded['benh3rd'];
                                    tile1 = decoded['tile1'];
                                    tile2 = decoded['tile2'];
                                    tile3 = decoded['tile3'];
                                  });

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => resultPage(benh1st, benh2nd, benh3rd)),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ],
                          ),
                          // Row (
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     // Text(categories.length == 0 ? '' : categories[0].label +': '+(categories[0].score*100).toStringAsFixed(2),style: TextStyle(
                          //     Text (benh1st + ': ' + tile1.toStringAsFixed(2),style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold
                          //     ),),
                          //   ],),
                          // Row (
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     // Text(categories.length == 0 ? '' : categories[0].label +': '+(categories[0].score*100).toStringAsFixed(2),style: TextStyle(
                          //     Text (benh2nd + ': ' + tile2.toStringAsFixed(2),style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold
                          //     ),),
                          //   ],),
                          // Row (
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     // Text(categories.length == 0 ? '' : categories[0].label +': '+(categories[0].score*100).toStringAsFixed(2),style: TextStyle(
                          //     Text (benh3rd + ': ' + tile3.toStringAsFixed(2),style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold
                          //     ),),
                          //   ],),
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
                          Navigator.push(context, MaterialPageRoute(builder: (_) => DiseasesInformation(diseases: diseasesData,)));
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
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
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
                                  fontSize: 15,
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
    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");

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