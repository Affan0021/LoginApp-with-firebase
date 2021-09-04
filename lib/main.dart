
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_full/signup.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'login.dart';


void main()
{
  // SystemChrome.setEnabledSystemUIOverlays([]);
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

    statusBarColor: Colors.transparent,

  )
  );
 WidgetsFlutterBinding.ensureInitialized();
 Firebase.initializeApp();

  runApp(MaterialApp(

    home: AnimatedSplashScreen(
      splash: Image.asset(
        'user/logg.png',

      ),
      splashIconSize: 200,

      nextScreen: Start(),
      splashTransition: SplashTransition.rotationTransition,
      duration: 3,
    ),

  )
  );

}


class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);


  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override


  Widget build(BuildContext context) {

    var query = MediaQuery.of(context);
    var height = query.size.height;
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
                height: height / 1.8,
              ),

              Container(
            margin:  const EdgeInsets.fromLTRB(0, 0, 130,0),
            width: MediaQuery.of(context).size.width/2,
            height:MediaQuery.of(context).size.height/18,
            color: Colors.transparent,
            child: const Text(
              'Registration',
              style: TextStyle(

                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,


              ),


            ),


          ),



              SizedBox(
                height: height / 300,
              ),


          Container(
            margin:  const EdgeInsets.fromLTRB(30, 0, 0,0),
            width: MediaQuery.of(context).size.width/1.1,
            height: MediaQuery.of(context).size.height/14,
            color: Colors.transparent,
            child: const Text(
              'This is a test of my last month performance. I hope I will perform better than before',
              style: TextStyle(

                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 15.0,
                fontWeight: FontWeight.bold,


              ),


            ),


          ),

              SizedBox(
                height: height / 30,
              ),



              Container(
              width: MediaQuery.of(context).size.width/1.17,
              height: MediaQuery.of(context).size.height/14,
              margin: const EdgeInsets.only(left: 15.0),
              child: ElevatedButton(
                onPressed: ()

                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );

                },


                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.white;
                      return Colors.purple;
                    },
                  ),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Colors.white)
                      )
                  ),

                ),


                child: Text(
                  '\tLog in ',
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
                height: height / 40,
              ),



              Container(
                  width: MediaQuery.of(context).size.width/1.17,
                  height: MediaQuery.of(context).size.height/14,
                  margin: const EdgeInsets.only(left: 15.0),
                  child: ElevatedButton(
                    onPressed: ()

                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );

                    },


                    style: ButtonStyle(

                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.white;
                      return Colors.purple;
                    },
                  ),
                  shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: Colors.white)
                            )
                        ),

                    ),

                    child: Text(
                      '\tSign Up ',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontFamily: 'OpenSans',
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
              )





            ],
)






          ]
        )

    )







    );




  }
}

