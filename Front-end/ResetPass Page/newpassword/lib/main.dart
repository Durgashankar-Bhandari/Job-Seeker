import 'package:flutter/material.dart';

void main() {
  runApp(
    WidgetsApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      builder: (context, _) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Password Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: NewPasswordPage(),
    );
  }
}

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset Password' '                                 ',
              style: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 58, 56, 56),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Enter Your New Password. Your Password Must Be Different From Previous One.',
              style: TextStyle(
                fontSize: 20.0,
                color: Color.fromARGB(255, 73, 72, 72),
              ),
            ),
            SizedBox(height: 24.0),
            buildPasswordField(
              controller: _passwordController,
              placeholderText: 'New Password',
              isVisible: _passwordVisible,
              toggleVisibility: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            SizedBox(height: 16.0),
            buildPasswordField(
              controller: _confirmPasswordController,
              placeholderText: 'Confirm Password',
              isVisible: _confirmPasswordVisible,
              toggleVisibility: () {
                setState(() {
                  _confirmPasswordVisible = !_confirmPasswordVisible;
                });
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                if (password.isNotEmpty && confirmPassword.isNotEmpty) {
                  if (password == confirmPassword) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Success'),
                        content: Text('Password updated successfully!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // TODO: Navigate to the next screen after successful password update
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content:
                            Text('Passwords do not match. Please try again.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 83, 13, 95),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPasswordField({
    required TextEditingController controller,
    required String placeholderText,
    required bool isVisible,
    required VoidCallback toggleVisibility,
  }) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 83, 13, 95),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: placeholderText,
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: toggleVisibility,
            icon: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ),
        obscureText: !isVisible,
      ),
    );
  }
}
