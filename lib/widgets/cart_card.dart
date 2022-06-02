import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants.dart';


class CartCard extends StatefulWidget {
  CartCard({
    Key? key, required this.imageUrl, required this.name, required this.price, required this.location,
  }) : super(key: key);
  final String imageUrl;
  final String name;
  final String price;
  final String location;


  @override
  State<CartCard> createState() => _CartCardState();
  int counter = 1;
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 130,

        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: PhysicalModel(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 70,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () => setState(() {
                                      widget.counter++;
                                    }),
                                child: const Icon(
                                  EvaIcons.plus,
                                  size: 15,
                                  color: Colors.grey,
                                )),
                            Text(widget.counter.toString()),
                            GestureDetector(
                              onTap: () => setState(() {
                                widget.counter!=0? widget.counter --:0;
                              }),
                              child: const Icon(
                                EvaIcons.minus,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            image:  DecorationImage(
                                image: AssetImage(widget.imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              widget.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              '\$${widget.price}',
                              style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                             Row(
                               children: [
                                  Icon(Iconsax.location,size: 15,color: homeHeadingColor,),
                                 Text(widget.location,
                                  style:  TextStyle(
                                      color: homeHeadingColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                            ),
                               ],
                             ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
