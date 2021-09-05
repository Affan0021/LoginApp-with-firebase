import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_full/welcome_Login.dart';

import 'package:firebase_auth/firebase_auth.dart';
void main() {
  runApp(GoogleLoginApp());
}

class GoogleLoginApp extends StatefulWidget {
  const GoogleLoginApp({ Key? key }) : super(key: key);

  @override
  _GoogleLoginAppState createState() => _GoogleLoginAppState();
}

class _GoogleLoginAppState extends State<GoogleLoginApp> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    var query = MediaQuery.of(context);
    var height = query.size.height;
    // var container = height;
    var width =  query.size.width;






    return  Scaffold(
        appBar: AppBar(
          title: Text(' Logged ' + (user == null ? 'out' : 'in') ),
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 50,

        ),
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
                        height: height / 8,
                      ),
                      Container(
                        margin:  const EdgeInsets.fromLTRB(30, 0, 0,0),
                        width: MediaQuery.of(context).size.width/1.17,
                        height: MediaQuery.of(context).size.height/14,
                        color: Colors.transparent,
                        child: const Text(
                          'Google  Account',
                          style: TextStyle(

                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,


                          ),


                        ),


                      ),


                      SizedBox(
                        height: height / 4,
                      ),

                      Container(
                          width: MediaQuery.of(context).size.width/1.17,
                          height: MediaQuery.of(context).size.height/14,
                          margin: const EdgeInsets.only(left: 15.0),
                          child: ElevatedButton(
                              onPressed: user != null
                                  ? null
                                  : () async {
                                await _googleSignIn.signIn();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeLogin()),
                                );


                              },


                            style: ButtonStyle(

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
                                color: Colors.blueAccent,
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                      ),

                      SizedBox(
                        height: height / 18,
                      ),

                      Container(
                          width: MediaQuery.of(context).size.width/1.17,
                          height: MediaQuery.of(context).size.height/14,
                          margin: const EdgeInsets.only(left: 15.0),
                          child: ElevatedButton(
                              onPressed: user == null ? null : () async {
                                await _googleSignIn.signOut();
                                // setState(() {});
                              },


                            style: ButtonStyle(

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
                              '\tSign out ',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                      ),




                    ],
                  )






                ]
            )

        )







    );




  }
}





//
// ElevatedButton(child: Text('Sign Out'),
// ),