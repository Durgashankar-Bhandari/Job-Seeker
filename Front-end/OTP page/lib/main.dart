import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PIN Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: PinCodePage(),
    );
  }
}

class PinCodePage extends StatefulWidget {
  @override
  _PinCodePageState createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  List<TextEditingController> pinControllers =
      List.generate(4, (_) => TextEditingController());
  List<String> enteredPins = List.generate(4, (_) => '');
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  int currentFocusIndex = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      focusNodes[i].addListener(() {
        setState(() {
          currentFocusIndex = i;
        });
      });
    }
  }

  @override
  void dispose() {
    for (final controller in pinControllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 20), // Move to the right
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 20), // Move to the right
                child: Text(
                  'Please enter the 4-digit code sent to your number',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildPinBox(0),
                  buildPinBox(1),
                  buildPinBox(2),
                  buildPinBox(3),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align centrally
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle resend code option
                      print('Resend Code');
                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align centrally
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Perform validation or any required action with enteredPins
                      print('Entered PINs: $enteredPins');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    child: Text('Verify'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPinBox(int index) {
    final bool hasFocus = index == currentFocusIndex;

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextFormField(
          controller: pinControllers[index],
          focusNode: focusNodes[index],
          autofocus: index == 0,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            setState(() {
              enteredPins[index] = value;
            });
            if (value.isNotEmpty && index < 3) {
              focusNodes[index + 1].requestFocus();
            }
          },
          onTap: () {
            setState(() {
              currentFocusIndex = index;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            filled: hasFocus,
            fillColor: hasFocus ? Colors.transparent : null,
          ),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
