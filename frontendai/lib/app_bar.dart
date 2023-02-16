/*import 'package:flutter/material.dart';

class CostumAppBar extends StatelessWidget {
  const CostumAppBar({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        //borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 32,
            width: 32,
            child: Image.asset(
              "assets/images/icon.png",
              color: Colors.white,
              //height: 30,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(width: 15),
          Text(
            "AI Image Generator".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                //fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 2,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Click"),
            style: ElevatedButton.styleFrom(
                primary: Colors.grey, textStyle: TextStyle(fontSize: 15)),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text("For the"),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(204, 77, 103, 116),
                textStyle: TextStyle(fontSize: 30)),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Future"),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 22, 59, 88),
                textStyle: TextStyle(fontSize: 40)),
          ),
        ],
      ),
    );
  }
}
*/