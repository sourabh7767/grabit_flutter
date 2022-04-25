import 'package:flutter/cupertino.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(title,style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,

            ),),
            const Icon(CupertinoIcons.forward),
          ],
        ),
      ),
    );
  }
}
