
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "HDNfrs",
          style: TextStyle(
              color: Colors.black38, fontSize: 22
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage("assets/images/Duong_Avatar.jpg"),
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tài khoản của bạn",
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("Tham gia cộng đồng HDNfrs",
                            style: TextStyle(
                                color: Colors.black54
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width - 160),
                              child:OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(width: 1.0, color: Colors.teal),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => ),
                                  // );
                                },
                                child: Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
            SizedBox(height: 20,),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 120,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/icons/hdnbanner.png"),
                            )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cùng nhau gieo trồng thông minh",
                              style: TextStyle(
                                  fontSize: 17
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text("Tham gia cộng đồng HDNfrs",
                              style: TextStyle(
                                  color: Colors.black54
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 120,
                        child: Image.asset("assets/images/icons/star.png", width: 70,),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bạn có thấy ứng dùng này hữu ích",
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text("Hãy gửi đánh giá cho chúng tôi",
                              style: TextStyle(
                                  color: Colors.black54
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}