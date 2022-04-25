import 'package:flutter/material.dart';

import '../constants.dart';

class depreciated extends StatefulWidget {
  const depreciated({Key? key}) : super(key: key);

  @override
  State<depreciated> createState() => _depreciatedState();
}

class _depreciatedState extends State<depreciated> {
  bool isTapped = true;
  bool isTapped2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbgColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Select Delivery Option',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTapped = !isTapped;
                        isTapped2 = !isTapped2;
                      });
                    },
                    child: HomeDeliveryExpandable(isTapped: isTapped),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTapped = !isTapped;
                        isTapped2 = !isTapped2;
                      });
                    },
                    child: PickUpExpandable(
                      isTapped: isTapped2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 270,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                          child: Text(
                        'Confirm Order',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PickUpExpandable extends StatelessWidget {
  const PickUpExpandable({Key? key, required this.isTapped}) : super(key: key);
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return ExpandableCardContainer(
      expandedChild: PhysicalModel(
        color: Colors.white,
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: const Icon(Icons.done),
                    height: 50,
                    width: 20,
                    decoration: BoxDecoration(
                      color: priceColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Will Pickup',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  const Text(
                    'x minutes',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        textBaseline: TextBaseline.ideographic),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      collapsedChild: PhysicalModel(
        color: Colors.white,
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                child: const Text(''),
                height: 50,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text(
                'Will Pickup',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      isExpanded: isTapped,
    );
  }
}

class HomeDeliveryExpandable extends StatelessWidget {
  const HomeDeliveryExpandable({
    Key? key,
    required this.isTapped,
  }) : super(key: key);

  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return ExpandableCardContainer(
      expandedChild: PhysicalModel(
        color: Colors.white,
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                child: const Icon(Icons.done),
                height: 50,
                width: 20,
                decoration: BoxDecoration(
                  color: priceColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text(
                'Home Delivery',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      collapsedChild: PhysicalModel(
        color: Colors.white,
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                child: const Text(''),
                height: 50,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text(
                'Home Delivery',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      isExpanded: isTapped,
    );
  }
}

class ExpandableCardContainer extends StatefulWidget {
  final bool isExpanded;
  final Widget collapsedChild;
  final Widget expandedChild;

  const ExpandableCardContainer(
      {Key? key,
      required this.isExpanded,
      required this.collapsedChild,
      required this.expandedChild})
      : super(key: key);

  @override
  _ExpandableCardContainerState createState() =>
      _ExpandableCardContainerState();
}

class _ExpandableCardContainerState extends State<ExpandableCardContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 10),
      curve: Curves.bounceIn,
      child: widget.isExpanded ? widget.expandedChild : widget.collapsedChild,
    );
  }
}
