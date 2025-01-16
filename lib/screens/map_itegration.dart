import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapIntegration extends StatefulWidget {
  const MapIntegration({super.key});

  @override
  State<MapIntegration> createState() => _MapIntegrationState();
}

class _MapIntegrationState extends State<MapIntegration> {
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 26,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 900,
            child: OpenStreetMapSearchAndPick(
              center: LatLong(27.7019086, 85.3311488),
              buttonText: 'Set Location',
              onPicked: (pickedData) {
                setState(() {
                  address = pickedData.address;
                  Navigator.pop(context, address);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
