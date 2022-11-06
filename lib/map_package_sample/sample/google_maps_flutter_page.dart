import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// https://pub.dev/packages/google_maps_flutter
class GoogleMapsFlutterPage extends StatefulWidget {
  const GoogleMapsFlutterPage({super.key});

  @override
  _GoogleMapsFlutterPage createState() => _GoogleMapsFlutterPage();
}

class _GoogleMapsFlutterPage extends State<GoogleMapsFlutterPage> {
  late GoogleMapController mapController;

  final LatLng _initPosition = const LatLng(35.689, 139.692);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('google_maps_flutter'),
        ),
        body: GoogleMap(
          compassEnabled: false,
          myLocationButtonEnabled: false,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: _initPosition,
            zoom: 11,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            ),
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(10, 10),
                          )
                        ],
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              color: Colors.grey[500],
                              icon: const Icon(Icons.arrow_back_ios_new),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            hintText: '場所を検索',
                            hintStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: const Text(''),
                        onTap: () async {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
