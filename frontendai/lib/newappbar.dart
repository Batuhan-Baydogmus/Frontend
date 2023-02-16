import 'package:flutter/material.dart';
import 'animated_text.dart';

class NewAppBar extends StatefulWidget {
  const NewAppBar({key});

  @override
  State<NewAppBar> createState() => _NewAppBarState();
}

class _NewAppBarState extends State<NewAppBar> with TickerProviderStateMixin {
  TabController? tabController;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var boxColor = Color.fromARGB(255, 71, 75, 78).withOpacity(0.5);
  var borderColor = Colors.black.withOpacity(0);
  var boxHoverColor = Color.fromARGB(148, 187, 198, 209).withOpacity(0.2);
  var textformvalue = true;

  //Disable for generate button, only 1 click.
  int maxClick = 0;
  int counter = 0;

  AnimationController? _animationController;
  Animation? _animation;

  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animationController!.repeat(reverse: true);
    _animation = Tween(begin: 0, end: 1.1).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            border: Border(
                bottom: BorderSide(
                    color: Colors.white.withOpacity(0.3), width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Spacer(flex: 1),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              //decoration: BoxDecoration(color: Colors.white),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10),

                  Text(
                    "AI Image Generator".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        //fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  //Animated text container
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    //decoration: BoxDecoration(color: Colors.black),
                    child: Animated(),
                  ),
                  //Space for text and searchbar
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // For limited width textbox size.
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        //card for colored ant transparent background
                        child: Card(
                          color: boxColor,
                          child: TextFormField(
                            //interactive disable enable while proccessing
                            enabled: textformvalue,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: _animation?.value,
                                color: Colors.white,
                              )),
                              labelText: 'Your Prompt',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              filled: true,
                              hoverColor: boxHoverColor,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),

                            //Empty box checker
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      //Elevated button for textbox.
                      //Padding for vertical and horizontal spaces.
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 3),
                        //Container for button glowing

                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 187, 169, 190)
                                    .withOpacity(0.4),
                                //elevation: _animation?.value * 10,
                                // shadowColor: Colors.white,
                                side: BorderSide(
                                    color: Colors.white.withOpacity(0.4),
                                    width: 0.8),

                                // Button size adjusting via padding
                                padding: EdgeInsets.symmetric(
                                    horizontal: 23, vertical: 23),
                                textStyle: TextStyle(fontSize: 20)),
                            child: isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //Sized box for size adjustment loading indicator
                                      SizedBox(
                                          height: 18,
                                          width: 18,
                                          child: CircularProgressIndicator(
                                              color: Colors.white)),

                                      //Sized box for space between textbox and generate button.
                                      const SizedBox(width: 10),
                                      Text(
                                        "Please Wait..",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                    ],
                                  )
                                : Text(
                                    'Generate',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),

                            //Simulator for server responsive button.
                            //And textboxcolor changes when pressed.
                            // Textformvalue is  enable and disable box.
                            onPressed: counter > maxClick
                                ? null
                                : () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() => counter++);
                                      setState(() => isLoading = true);
                                      setState(() => boxColor =
                                          Colors.black38.withOpacity(0.9));

                                      setState(
                                          () => borderColor = Colors.white);
                                      setState(
                                          () => boxHoverColor = Colors.black);
                                      setState(() => textformvalue = false);
                                      await Future.delayed(
                                          Duration(seconds: 3));
                                      setState(() => isLoading = false);
                                      setState(() => boxColor =
                                          Color.fromARGB(255, 71, 75, 78)
                                              .withOpacity(0.5));
                                      setState(() => borderColor =
                                          Colors.black.withOpacity(0));
                                      setState(() => boxHoverColor =
                                          Color.fromARGB(148, 187, 198, 209)
                                              .withOpacity(0.2));
                                      setState(() => textformvalue = true);
                                      setState(() => counter = 0);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              // Snack bar for image opener with animation.
                                              SnackBar(
                                                  duration: const Duration(
                                                      seconds: 10),
                                                  /*action: SnackBarAction(
                            label: 'Close',
                            onPressed: () {},
                            textColor: Colors.white,
                            disabledTextColor: Colors.grey,
                        ),*/
                                                  //Snackbar floating behavior can be changed fixed
                                                  /*behavior: SnackBarBehavior.floating,
                        width: MediaQuery.of(context).size.width * (0.6),*/
                                                  backgroundColor: Colors.black
                                                      .withOpacity(0.7),
                                                  content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        //Sizedbox for little more fixing the image position.
                                                        SizedBox(width: 50),
                                                        //Container for image inside snackbar.
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              (0.80),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              (0.79),
                                                          //color: Colors.white,
                                                          child: Image.asset(
                                                            "assets/images/ai-background.png",
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),

                                                        ElevatedButton.icon(
                                                          style: ElevatedButton.styleFrom(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          0,
                                                                      horizontal:
                                                                          10),
                                                              primary: Colors
                                                                  .grey
                                                                  .withOpacity(
                                                                      0.5) //elevated button background color
                                                              ),
                                                          onPressed: () {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .hideCurrentSnackBar();
                                                          },
                                                          icon: Icon(
                                                            Icons.close_rounded,
                                                            size: 17,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    228,
                                                                    225,
                                                                    225),
                                                          ), //icon data for elevated button
                                                          label: Text(
                                                            "CLOSE",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ), //label text
                                                        ),
                                                      ])));
                                    }
                                  }),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
