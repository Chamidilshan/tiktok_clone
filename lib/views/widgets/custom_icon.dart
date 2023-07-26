import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.0,
      height: 30,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 10.0,
            ),
            width: 38.0,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 45, 100),
              borderRadius: BorderRadius.circular(7.0)
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 10.0,
            ),
            width: 38.0,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(7.0)
            ),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 38.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.0)
              ),
              child: Icon(
                  Icons.add,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
