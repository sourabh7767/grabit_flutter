import 'package:flutter/material.dart';

showEmptyImage(context){
  return Container(
    height:MediaQuery.of(context).size.height / 1.5,
    child: Center(
      child:
      Image.asset('assets/images/ic_empty_box.png',height: 100,),
    ),
  );
}