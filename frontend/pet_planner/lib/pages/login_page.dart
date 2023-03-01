import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFC6E2C3),
        body: Container(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Row(
                  children: [
                    Column(
                      children: <Widget>[
                        Expanded(
                            child: Transform.rotate(
                                angle: math.pi / 2,
                                child: Image.asset('lib/images/dogcat.jpg')))
                      ],
                    ),
                    Column(),
                  ],
                ))));
  }
}


//    child: SizedBox(
            //  width: MediaQuery.of(context).size.width / 2,
            //  height: MediaQuery.of(context).size.width,
            //  child: Row(
            ///    children: [
             //     Column(
             //       children: [
              //        Transform.rotate(
              //            angle: math.pi / 2,
              //            child: Image.asset('lib/images/dogcat.jpg',
              //                fit: BoxFit.fitHeight))
               //     ],
               ////   ),
               //   Column(),
               // ],
            //  ))