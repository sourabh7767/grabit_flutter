import 'package:flutter/material.dart';

ShowLoader(){

  return Container(
    color: Colors.black12,
    child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 30),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        )),
  );
}