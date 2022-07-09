import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class BikeList extends StatefulWidget {
  const BikeList({Key? key}) : super(key: key);

  @override
  State<BikeList> createState() => _BikeListState();
}

class _BikeListState extends State<BikeList> {
  List locations = [];
  bool isLoading = false;

  fetchLocation() async {
    isLoading = true;
    var url = "https://catchride.in/catchride/api/homedata";
    var response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['bikes_data'];
      setState(() {
        isLoading = false;
        locations = items;
      });
      print("loccc<<<<<<<< $locations");
    } else {
      setState(() {
        isLoading = false;
        locations = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Available"),
        backgroundColor: Color(0XFFF99C87),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isLoading
              ? Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(child: getBody()),
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
    var bikename = index['bikename'] + " ";
    var number = index['bikergnumber'] + " ";
    var doc = index['doccument'] + " ";
    var point = index['pointname'] ?? '';

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 5.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          trailing: IconButton(
            onPressed: () async {
              if (await canLaunch(doc)) {
                await launch(doc);
              } else {
                throw 'Could not launch $doc';
              }
              print(doc.toString());
            },
            icon: Image.asset('assets/images/pdf.png'),
          ),
          title: Text(
            bikename.toString(),
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(number.toString()),
              Text("Location :- ${point.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
