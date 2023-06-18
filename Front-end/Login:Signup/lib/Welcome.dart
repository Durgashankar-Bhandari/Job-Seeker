// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:job_seeker/Login.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 111, 8, 134),
              Color.fromARGB(255, 224, 190, 231),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage(
                  'assets/images/jobseeker.jpg',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  'JOB SEEKER',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 40),
                child: Center(
                  child: Text(
                    'Discover your next \n opportunity with us',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      onPrimary: Colors.white,
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Padding(
              //   padding: EdgeInsets.only(top: 0.5, bottom: 0.5),
              //   child: SizedBox(
              //     height: 40,
              //     width: 120,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         // TODO: Handle sign-up button press
              //       },
              //       style: ElevatedButton.styleFrom(
              //         primary: Colors.white,
              //         onPrimary: Colors.purple,
              //       ),
              //       child: Text(
              //         'Signup',
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20), // Add space after the buttons
            ],
          ),
        ),
      ),
    );
  }
}
