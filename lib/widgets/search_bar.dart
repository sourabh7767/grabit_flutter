import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:group_button/group_button.dart';
import 'package:iconsax/iconsax.dart';


import '../constants.dart';

class CustomSearchBar extends StatefulWidget {
  final String hint;

  const CustomSearchBar({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {

  final Geolocator geolocator = Geolocator();
  Position _currentPosition = Position(
      longitude: 0.0,
      latitude: 0.0,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0);
  String _currentAddress = '';

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();



    _getCurrentLocation();
  }

  _getCurrentLocation() {

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {

    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0.0),
            hintText: widget.hint,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
            prefixIcon: Icon(
              Iconsax.search_normal,
              color: priceColor,
              size: 18,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
              child: Icon(
                Icons.filter_list_outlined,
                color: priceColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            floatingLabelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Text(
        'Filters',
        style: TextStyle(color: primaryColor),
      ),
      content: SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sort',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GroupButton(
              elevation: 1,
              borderRadius: BorderRadius.circular(5),
              selectedBorderColor: primaryColor,
              unselectedBorderColor: Colors.grey,
              buttons: ['Top rated', 'Distance'],
              onSelected:(int,bool){},
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Choose your hour',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GroupButton(
              isRadio: true,
              spacing: 10,
              elevation: 1,
              borderRadius: BorderRadius.circular(5),
              selectedBorderColor: primaryColor,
              unselectedBorderColor: Colors.grey,
              mainGroupAlignment: MainGroupAlignment.start,
              onSelected: (index, isSelected) =>
                  print('$index button is selected'),
              buttons: [
                "All day long",
                "Between 17:00 - 19:00",
                "Between 20:00 - 22:00",
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sort by payment method',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GroupButton(
              isRadio: true,
              spacing: 10,
              elevation: 1,
              borderRadius: BorderRadius.circular(5),
              selectedBorderColor: primaryColor,
              unselectedBorderColor: Colors.grey,
              mainGroupAlignment: MainGroupAlignment.start,
              onSelected: (index, isSelected) =>
                  print('$index button is selected'),
              buttons: [
                "Credit card",
                "Cash",
                "both",
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sort by delivery method',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GroupButton(
              isRadio: true,
              spacing: 10,
              elevation: 1,
              borderRadius: BorderRadius.circular(5),
              selectedBorderColor: primaryColor,
              unselectedBorderColor: Colors.grey,
              mainGroupAlignment: MainGroupAlignment.start,
              onSelected: (index, isSelected) =>
                  print('$index button is selected'),
              buttons: ["In-store pickup"],
            ),
            GroupButton(
              isRadio: true,
              spacing: 10,
              elevation: 1,
              borderRadius: BorderRadius.circular(5),
              selectedBorderColor: primaryColor,
              unselectedBorderColor: Colors.grey,
              mainGroupAlignment: MainGroupAlignment.start,
              onSelected: (index, isSelected) {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Address details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontSize: 15),
                          ),
                          SizedBox(height: 10,),

                          Row(

                            children: [
                              SizedBox(width: 20,),

                              Icon(Icons.location_on),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Location',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                    if (_currentPosition != null &&
                                        _currentAddress != null)
                                      Text(_currentAddress,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0.0),
                                labelText: 'Street name',
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                prefixIcon: const Icon(
                                  Icons.add_road,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                floatingLabelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0.0),
                                labelText: 'Apartment name',
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                prefixIcon: const Icon(
                                  Icons.apartment,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                floatingLabelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          MaterialButton(onPressed: ()=> Navigator.pop(context),child: Text('Submit',style: TextStyle(color: Colors.white),),color: primaryColor,)
                        ],
                      ),
                    );
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 10,
                  isScrollControlled: true,
                );
              },
              buttons: ["Home Delivery"],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: primaryColor,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
