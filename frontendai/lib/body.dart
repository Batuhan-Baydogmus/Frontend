/*

import 'package:flutter/material.dart';

//Statefull widget for interactive picturebox and textbox

class Body extends StatefulWidget {
  const Body({key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<Body> {
// For getting data from textbox ?
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var boxColor = Color.fromARGB(255, 187, 198, 209).withOpacity(0.4);
  var borderColor = Colors.black.withOpacity(0);

  @override
  Widget build(BuildContext context) {
    // _formkey things for getting data i think.
    return Form(
      key: _formKey,
      // row for ordering horizontal
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Sized box for limit the widht of input line
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            // Card for colored and opac background
            child: Card(
              color: boxColor,
              child: TextFormField(
                // Focused border label text label style and keyboard type added
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: borderColor)),
                  labelText: ' URL Address',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  filled: true,
                  hoverColor:
                      Color.fromARGB(148, 187, 198, 209).withOpacity(0.2),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                keyboardType: TextInputType.url,
// The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(
            //Padding for vertical and horizontal spaces.
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 3),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 187, 169, 190).withOpacity(0.4),
                  // Button size adjusting via padding
                  padding: EdgeInsets.symmetric(horizontal: 23, vertical: 23),
                  textStyle: TextStyle(fontSize: 20)),
              // Loading button part
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Sized box for size adjustment loading indicator
                        SizedBox(
                            height: 18,
                            width: 18,
                            child:
                                CircularProgressIndicator(color: Colors.white)),
                        const SizedBox(width: 10),
                        Text(
                          "Please Wait..",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                  : Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
              //Simulates server response the button.
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() => isLoading = true);
                  setState(() => boxColor = Colors.black38.withOpacity(0.9));
                  setState(() => borderColor = Colors.white);
                  await Future.delayed(Duration(seconds: 3));
                  setState(() => isLoading = false);
                  setState(() => boxColor =
                      Color.fromARGB(255, 187, 198, 209).withOpacity(0.4));
                  setState(() => borderColor = Colors.black.withOpacity(0));

                  ScaffoldMessenger.of(context).showSnackBar(
                    // Snack bar for image opener with animation.
                    SnackBar(
                        duration: const Duration(seconds: 10),
                        /*action: SnackBarAction(
                          label: 'Close',
                          onPressed: () {},
                          textColor: Colors.white,
                          disabledTextColor: Colors.grey,
                        ),*/
                        //Snackbar floating behavior can be changed fixed
                        /*behavior: SnackBarBehavior.floating,
                        width: MediaQuery.of(context).size.width * (0.6),*/
                        backgroundColor: Colors.black.withOpacity(0.8),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /* const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 100.0),
                            ),*/
                            //Sized box for image inside snackbar.
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: Column(
                                  children: [
                                    //Image.network('[Link will be here]'), image gelecek
                                    Image.asset(
                                      "assets/images/ai-background.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                    ),
                                  ],
                                )),
                            //Padding for close button

                            SizedBox(
                              width: 30,
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  primary: Colors.grey.withOpacity(
                                      0.5) //elevated btton background color
                                  ),
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                              icon: Icon(
                                Icons.close_rounded,
                                size: 17,
                                color: Color.fromARGB(255, 228, 225, 225),
                              ), //icon data for elevated button
                              label: Text(
                                "CLOSE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ), //label text
                            )
                          ],
                        )),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/