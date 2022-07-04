
import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp,String location){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 64.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text("$temp",style: TextStyle(
          fontSize: 45.0,
        ),
        ),
        Text("$location",style: TextStyle(fontSize: 20.0,color: Colors.black26),)
      ],
    )
  );
}