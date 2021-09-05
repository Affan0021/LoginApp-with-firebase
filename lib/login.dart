import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'google.dart';
import 'login.dart';
import 'phone.dart';
import 'welcome_Login.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width =  query.size.width;

    return  Scaffold(


        body: SingleChildScrollView(

            child: Stack(
                children: <Widget>[


                  Container(
                    margin:  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                   width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height,
                    decoration:   BoxDecoration(

                      image:  const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('user/log.jpg'),

                      ),


                    ),

                  ),

                  Column(
                    children: [


                      SizedBox(
                        height: height /2,
                      ),

                      Container(
                        //alignment: Alignment.center,
                        //  margin:  EdgeInsets.only(top: 400),

                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.transparent,
                                offset: const Offset(
                                  10.0,
                                  10.0,
                                ), //Offset
                                blurRadius: 4.0,
                                spreadRadius: 0.11,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                              //BoxShadow
                            ],
                            border: Border.all(
                              color: Colors.black26,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),



                    ],
                  ),

                  Column(

                    children: [


                      //
                      SizedBox(
                        height: height /6,
                      ),


                      Container(
                        margin:  const EdgeInsets.fromLTRB(0, 0, 130,0),
                        width: MediaQuery.of(context).size.width/2,
                        height: MediaQuery.of(context).size.height/10,
                        color: Colors.transparent,
                        child: const Text(
                          'Welcome\nBack',
                          style: TextStyle(

                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,


                          ),


                        ),


                      ),


                      //
                      SizedBox(
                        height: height /2.9,
                      ),


                      Container(

                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'OpenSans',

                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 11.0),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter your Email',
                            hintStyle: TextStyle(
                              color: Colors.blueGrey, // <-- Change this
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _email = value.trim();
                            });
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(0),
                          // color: const Color(0xff7cb1b6),
                        ),
                      ),




                      SizedBox(
                        height: height /25,
                      ),



                      Container(

                        child: TextField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'OpenSans',

                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 11.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(
                              color: Colors.blueGrey, // <-- Change this
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _password = value.trim();
                            });
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(0),
                          // color: const Color(0xff7cb1b6),
                        ),
                      ),


                      //
                      SizedBox(
                        height: height /20,
                      ),




                      Container(
                          width: MediaQuery.of(context).size.width/1.15,
                          height: MediaQuery.of(context).size.height/14,
                          margin: const EdgeInsets.only(left: 5.0),
                          child: ElevatedButton(

                              onPressed: (){
                                auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomeLogin()));
                                });

                              },
                            style:
                            ButtonStyle(

                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.white;
                                  return Colors.blueGrey;
                                },
                              ),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Colors.white)
                                  )
                              ),

                            ),
                            child: Text(
                              '\tSign in ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )

                      ),

                      SizedBox(
                        height: height/ 110,
                      ),
                      Row(
                        children: [


                          SizedBox(

                            width: width / 35,
                          ),

                          Container(
                              width: MediaQuery.of(context).size.width/2.1,
                              height: MediaQuery.of(context).size.height/18,
                              // margin: const EdgeInsets.only(left: 15.0),
                              child: ElevatedButton(
                                onPressed: ()

                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => GoogleLoginApp()),
                                  );

                                },


                                style: ButtonStyle(

                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.pressed))
                                        return Colors.white;
                                      return Colors.indigoAccent;
                                    },
                                  ),
                                  shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                          side: BorderSide(
                                              color: Colors.white)
                                      )
                                  ),

                                ),

                                child: Text(
                                  '\tSign in with Google ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                          ),




                          SizedBox(

                            width: width / 60,
                          ),

                          Container(
                              width: MediaQuery.of(context).size.width/2.1,
                              height: MediaQuery.of(context).size.height/18,
                              // margin: const EdgeInsets.only(left: 15.0),
                              child: ElevatedButton(
                                onPressed: ()

                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Phone()),
                                  );

                                },


                                style: ButtonStyle(

                                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.pressed))
                                        return Colors.white;
                                      return Colors.indigoAccent;
                                    },
                                  ),
                                  shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                          side: BorderSide(
                                              color: Colors.white)
                                      )
                                  ),

                                ),

                                child: Text(
                                  '\tSign in with Phone',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                          ),


                        ],
                      )



                    ],
                  )



                ]
            )

        )
    );
  }
}



