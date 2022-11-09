import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children:  const [
                  Image(
                    width: 30,
                    height: 30,
                    image: AssetImage("assets/images/logo.png"),
                  ),
                  Icon(Icons.menu),
                ],
              ),
            ),
          ),
        )
    );
  }
}
