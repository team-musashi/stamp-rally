import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/core.dart';
import 'package:google_maps_webservice/src/places.dart';

import '../api_keys.dart';

/// https://pub.dev/packages/google_maps_flutter
class GoogleMapsFlutterPage extends StatefulWidget {
  const GoogleMapsFlutterPage({super.key});

  @override
  _GoogleMapsFlutterPage createState() => _GoogleMapsFlutterPage();
}

class _GoogleMapsFlutterPage extends State<GoogleMapsFlutterPage> {
  Position? currentPosition;
  late GoogleMapController _controller;
  late StreamSubscription<Position> positionStream;
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  final CameraPosition initPosition = const CameraPosition(
    target: LatLng(35.689, 139.692),
    zoom: 14,
  );

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
    //位置情報が許可されていない時に許可をリクエストする
    Future(() async {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
    });

    //現在位置を更新し続ける
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      currentPosition = position;
      print(
        position == null
            ? 'Unknown'
            : '${position.latitude.toString()}, ${position.longitude.toString()}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('google_maps_flutter'),
      ),
      body: GoogleMap(
        compassEnabled: false,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        initialCameraPosition: initPosition,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push<void>(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceSample(),
            ),
          ),
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}

class PlaceSample extends StatefulWidget {
  @override
  _PlaceSampleState createState() => _PlaceSampleState();
}

final homeScaffoldKey = GlobalKey<ScaffoldMessengerState>();
final searchScaffoldKey = GlobalKey<ScaffoldMessengerState>();

class _PlaceSampleState extends State<PlaceSample> {
  Mode _mode = Mode.overlay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        title: const Text('google place sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildDropdownMenu(),
            ElevatedButton(
              onPressed: _handlePressButton,
              child: const Text('Search places'),
            ),
            ElevatedButton(
              child: const Text('Custom'),
              onPressed: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CustomSearchScaffold(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownMenu() => DropdownButton(
        value: _mode,
        items: const <DropdownMenuItem<Mode>>[
          DropdownMenuItem<Mode>(
            value: Mode.overlay,
            child: Text('Overlay'),
          ),
          DropdownMenuItem<Mode>(
            value: Mode.fullscreen,
            child: Text('Fullscreen'),
          ),
        ],
        onChanged: (m) {
          if (m == null) {
            return;
          }
          setState(() {
            _mode = m;
          });
        },
      );

  void onError(PlacesAutocompleteResponse? response) {
    if (response == null) {
      return;
    }
    homeScaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    final p = await PlacesAutocomplete.show(
      context: context,
      apiKey: googleMapsAPIKey,
      onError: onError,
      mode: _mode,
      language: 'jp',
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [Component(Component.country, 'jp')],
      offset: 0,
      radius: 1000,
      types: [],
      strictbounds: false,
      region: 'ar',
    );

    if (p == null) {
      return;
    }
    await displayPrediction(p, context);
  }
}

Future<void> displayPrediction(
  Prediction p,
  BuildContext context,
) async {
  final places = GoogleMapsPlaces(
    apiKey: googleMapsAPIKey,
    apiHeaders: await const GoogleApiHeaders().getHeaders(),
  );
  final detail = await places.getDetailsByPlaceId(p.placeId!);
  if (detail.result.geometry == null) {
    return;
  }
  final lat = detail.result.geometry!.location.lat;
  final lng = detail.result.geometry!.location.lng;

  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('search result'),
        content: Text('${p.description} - $lat/$lng'),
        actions: <Widget>[
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

  // scaffold.showSnackBar(
  //   SnackBar(content: Text('${p.description} - $lat/$lng')),
  // );
}

// custom scaffold that handle search
// basically your widget need to extends [GooglePlacesAutocompleteWidget]
// and your state [GooglePlacesAutocompleteState]
class CustomSearchScaffold extends PlacesAutocompleteWidget {
  CustomSearchScaffold({super.key})
      : super(
          apiKey: googleMapsAPIKey,
          sessionToken: Uuid().generateV4(),
          language: 'en',
          components: [Component(Component.country, 'uk')],
        );

  @override
  _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
}

class _CustomSearchScaffoldState extends PlacesAutocompleteState {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: AppBarPlacesAutoCompleteTextField());
    final body = PlacesAutocompleteResult(
      onTap: (p) {
        displayPrediction(p, context);
      },
      logo: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [FlutterLogo()],
      ),
    );
    return Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    searchScaffoldKey.currentState!.showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }

  @override
  void onResponse(PlacesAutocompleteResponse? response) {
    if (response == null) {
      return;
    }
    super.onResponse(response);
    if (response.predictions.isNotEmpty) {
      searchScaffoldKey.currentState?.showSnackBar(
        const SnackBar(content: Text('Got answer')),
      );
    }
  }
}

class Uuid {
  final Random _random = Random();

  String generateV4() {
    // Generate xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx / 8-4-4-4-12.
    final special = 8 + _random.nextInt(4);

    return '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}-'
        '${_bitsDigits(16, 4)}-'
        '4${_bitsDigits(12, 3)}-'
        '${_printDigits(special, 1)}${_bitsDigits(12, 3)}-'
        '${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}${_bitsDigits(16, 4)}';
  }

  String _bitsDigits(int bitCount, int digitCount) =>
      _printDigits(_generateBits(bitCount), digitCount);

  int _generateBits(int bitCount) => _random.nextInt(1 << bitCount);

  String _printDigits(int value, int count) =>
      value.toRadixString(16).padLeft(count, '0');
}




// /// 検索ボタン押下時に表示されるページ
// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   late Prediction? prediction;
//   List<Prediction> predictions = [];
//   final homeScaffoldKey = GlobalKey<ScaffoldState>();
//   final searchScaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     prediction = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: googleMapsAPIKey,
//       mode: Mode.overlay, // Mode.fullscreen
//       language: 'fr',
//       components: [Component(Component.country, 'fr')],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: homeScaffoldKey,
//       body: SafeArea(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 10,
//                             spreadRadius: 1,
//                             offset: Offset(10, 10),
//                           )
//                         ],
//                       ),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         alignment: Alignment.centerLeft,
//                         child: TextFormField(
//                           onChanged: _textChanged,
//                           decoration: InputDecoration(
//                             prefixIcon: IconButton(
//                               color: Colors.grey[500],
//                               icon: const Icon(Icons.arrow_back_ios_new),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                             hintText: '場所を検索',
//                             hintStyle: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Flexible(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 0,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: ListTile(
//                         title: const Text(''),
//                         onTap: () async {},
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// 検索テキストボックス文字列変更イベントハンドラ
//   Future<void> _textChanged(String changedText) async {
//     // final result = await prediction.
//     // if (result != null && result.predictions != null && mounted) {
//     //   setState(() {
//     //     predictions = result.predictions!;
//     //   });
//     // }
//     if (prediction == null) {
//       return;
//     }

//     final places = GoogleMapsPlaces(
//       apiKey: googleMapsAPIKey,
//     );

//     final detail = await places.getDetailsByPlaceId(prediction!.placeId!);
//     final lat = detail.result.geometry!.location.lat;
//     final lng = detail.result.geometry!.location.lng;

//     homeScaffoldKey.currentState!.showBottomSheet<void>(
//       (context) =>
//           SnackBar(content: Text('${prediction!.description} - $lat/$lng')),
//     );
//   }
// }
