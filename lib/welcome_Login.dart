
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeLogin extends StatefulWidget {
  const WelcomeLogin({Key? key}) : super(key: key);

  @override
  _WelcomeLoginState createState() => _WelcomeLoginState();
}

class _WelcomeLoginState extends State<WelcomeLogin> {
  @override


  Widget build(BuildContext context) {

    var query = MediaQuery.of(context);
    var height = query.size.height;
    // var container = height;
    var width =  query.size.width;






    return  Scaffold(

        body: Container(

            child: Stack(
                children: <Widget>[

                  Container(
                    margin:  const EdgeInsets.fromLTRB(0, 0, 0, 0),
//alignment: Alignment.center,

                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height,
                    decoration:   BoxDecoration(
//   shape: BoxShape.circle,
                      image:  const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('user/log.jpg'),

                      ),


                    ),

                  ),


                  Column(
                    children: [




                      SizedBox(
                        height: height / 2,
                      ),


                      Container(
                        margin:  const EdgeInsets.fromLTRB(30, 0, 0,0),
                        width: MediaQuery.of(context).size.width/1.1,
                        height: MediaQuery.of(context).size.height/14,
                        color: Colors.transparent,
                        child: const Text(
                          'Welcome!  You are Logged in',
                          style: TextStyle(

                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,


                          ),


                        ),


                      ),




                    ],
                  )






                ]
            )

        )







    );




  }
}

