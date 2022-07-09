import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class Drop extends StatefulWidget {
  const Drop({Key? key}) : super(key: key);

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {

  List locations = [];

  ///GPS
  bool servicestatus = false;
  bool haspermission = false;
  bool isLoading = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  checkGps() async {
    setState((){
      isLoading = true;
    });
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }else if(permission == LocationPermission.deniedForever){
          print("'Location permissions are permanently denied");
        }else{
          haspermission = true;
        }
      }else{
        haspermission = true;
      }

      if(haspermission){
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    }else{
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
      isLoading=false;
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {});
    });
  }

///GPS OVER

  @override
  void initState() {
    super.initState();
    checkGps();

    fetchLocation();
  }
  fetchLocation() async {
    setState((){
      isLoading = true;
    });
    var url = "https://catchride.in/catchride/api/homedata";
    var response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['marker_data'];
      setState(() {
        isLoading =false;
        locations = items;
      });
    } else {
      setState(() {
        isLoading = false;
        locations = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFF99C87),
        title: Text("Location"),
      ),
      body: Column(
        children: [
          isLoading ? Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          ):
          Expanded(child: getBody()),
        ],
      ),
    );
  }
  Widget getBody() {
    List items = ["1", "2"];
    return Container(
      color: Color(0XFFF99C87),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return getCard(locations[index]);
          }),
    );
  }

  Widget getCard(index) {
    var pointname = index['pointname'] + " ";
    var latt = index['latitude'] + "";
    var longg = index['longitude'] + "";

    _drop() async {
      var sourceLat = lat;
      var sourecLong = long;
      String url =
          "http://maps.google.com/maps?saddr=$sourceLat,$sourecLong&daddr=$latt,$longg";

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 5.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: _drop,
          splashColor: Colors.green,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pointname.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: ClipOval(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.green, // splash color
                        onTap: () {
                          _drop();
                        }, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Image.asset("assets/images/ic_navigation.png"),
                            )
                          ],
                        ),
                      ),
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



