import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image(
              image: AssetImage('assets/images/dummy.png'),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "재로그",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
          ),
          Text(
            "SOLID - SRP와 OCP",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
