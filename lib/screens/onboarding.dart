import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hdnfr_ver2/screens/root.dart';
class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.3),
              image: DecorationImage(
                  image: AssetImage("assets/images/back.jpg"),
                  fit: BoxFit.cover)),),
      Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.4)
              ]
            )
          ),
      ),
      Padding(
        padding:
            const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 16),
        child: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 48.0),
                      child: Text.rich(TextSpan(
                        text: "Welcome to HDNfr",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w600),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text("Protect your plants.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child:OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 3.0, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RootApp()),
                        );
                      },
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
