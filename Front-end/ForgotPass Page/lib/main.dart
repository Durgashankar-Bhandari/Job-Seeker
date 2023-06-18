import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 78, 8, 91),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor:
              Color.fromARGB(255, 78, 8, 91), // Set the cursor color to purple
          selectionHandleColor: Color.fromARGB(
              255, 78, 8, 91), // Set the selection handle color to purple
        ),
      ),
      home: EmailPage(),
    );
  }
}

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController _emailController = TextEditingController();

  void _sendEmail() {
    String email = _emailController.text;
    // TODO: Implement the logic to send the email
    print('Sending email to $email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18.0),
              Text(
                'Please Enter Your Email To Send A Verification Code',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 78, 8, 91),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 22.0),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: _sendEmail,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 78, 8, 91),
                  ),
                  child: Text('Send'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
