import 'package:flutter/material.dart';
import 'package:student_management_provider/core/constants.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile(
      {super.key,
      required this.tag,
      required this.imageUrl,
      required this.name});
  final String tag;
  final String name;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Sibin Sebastian'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            h20,
            Container(
              width: size.width,
              height: size.height * .3,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[900],
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.grey.shade800,
                        offset: const Offset(-3, -3),
                        blurRadius: 15,
                        spreadRadius: 1,
                      )
                    ]),
                child: Hero(
                  tag: tag,
                  child: Image.asset(imageUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
