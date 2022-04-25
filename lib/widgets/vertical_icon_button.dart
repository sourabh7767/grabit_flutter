import 'package:flutter/material.dart';
class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;

  const VerticalIconButton({Key? key, required this.icon, required this.title, required this.iconColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> print(title),
      child: Column(
        children: [
          Icon(icon,color: iconColor,),
          const SizedBox(height: 2.0,),
          Text(title,style:  TextStyle(color: iconColor,fontWeight: FontWeight.w600,fontSize: 10),),

        ],
      ),

    );
  }
}
