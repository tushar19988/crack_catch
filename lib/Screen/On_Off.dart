import 'dart:convert';
import 'package:catch_crack/Screen/Drop.dart';
import 'package:catch_crack/Screen/bike_list.dart';
import 'package:catch_crack/auth/login/login_screen.dart';
import 'package:catch_crack/model/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class OnOffPage extends StatefulWidget {
  const OnOffPage({Key? key}) : super(key: key);

  @override
  State<OnOffPage> createState() => _OnOffPageState();
}

class _OnOffPageState extends State<OnOffPage> {
  TextEditingController GJ_controller = TextEditingController();
  TextEditingController h_controller = TextEditingController();
  TextEditingController HL_controller = TextEditingController();
  TextEditingController Number_controller = TextEditingController();
  TextEditingController show_controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final storage = const FlutterSecureStorage();

  Future<Data?> Off_vehicle() async {
    final uri = Uri.parse(
        "http://gps.saharshsolutions.co.in/EventController?opr=setEvent&devicename=${GJ_controller.text.trim()}%20${h_controller.text.trim()}%20${HL_controller.text.trim()}%20${Number_controller.text.trim()}&eventvalue=OFF");
    print("url>>>>>>>>>>$uri");
    var res = await http.post(uri);

    var reportModel = Data.fromJson(jsonDecode(res.body));
    if (res.body != null) {
      if (reportModel.data != null) {
        print("status>>>> ${reportModel.status}");
        print("data>>>> ${reportModel.data}");
        print("message >>>> ${reportModel.message}");
        if (reportModel.message == "Your Command Send Successfully") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0XFFE5EBA7),
            content: Text(
              'Vehicle Off ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 3),
          ));
        }
      } else {
        print("Error >>1 ");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.lightGreen,
          content: Text('Got error'),
          duration: Duration(seconds: 3),
        ));
      }
    } else {
      print("No Data Found >>3 ");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Something went wrong'),
        duration: Duration(seconds: 3),
      ));
    }
    return null;
  }

  Future<Data?> On_vehicle() async {
    final uri = Uri.parse(
        "http://gps.saharshsolutions.co.in/EventController?opr=setEvent&devicename=${GJ_controller.text.trim()}%20${h_controller.text.trim()}%20${HL_controller.text.trim()}%20${Number_controller.text.trim()}&eventvalue=ON");
    print("url>>>>>>>>>>$uri");
    var res = await http.post(uri);

    var reportModel = Data.fromJson(jsonDecode(res.body));
    if (res.body != null) {
      if (reportModel.data != null) {
        print("status>>>> ${reportModel.status}");
        print("data>>>> ${reportModel.data}");
        print("message >>>> ${reportModel.message}");
        if (reportModel.message == "Your Command Send Successfully") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0XFFE5EBA7),
            content: Text(
              'Please wait 30 second after start vehicle',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 3),
          ));
        }
      } else {
        print("Error >>1 ");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.lightGreen,
          content: Text('Got error'),
          duration: Duration(seconds: 3),
        ));
      }
    } else {
      print("No Data Found >>3 ");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.lightGreen,
        content: Text('Something went wrong'),
        duration: Duration(seconds: 3),
      ));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF99C87),
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color(0XFFF99C87),
      ),
      drawer: Drawer(
        backgroundColor: Color(0XFFF99C87),
        child: ListView(
          children: [
            DrawerHeader(
                child: Image.asset(
                  'assets/images/sec.png',
                  height: 50.h,
                  width: 50.w,
                )),
            ListTile(
              onTap: (){
                print('1');
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Drop()));
              },
              leading: Image.asset('assets/images/location.png',height: 30.h),
              title: Text(
                "Location",
                style: TextStyle(fontSize: 20.sp,color: Colors.white),
              ),
            ),
            ListTile(
              onTap: (){
                print('2');
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BikeList()));
              },
              leading: Image.asset('assets/images/scooter.png',height: 35.h),
              title: Text(
                "Vehicle List",
                style: TextStyle(fontSize: 20.sp,color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () async {
                print("firebase logout ${FirebaseAuth.instance.signOut()}");
                print("storage ${storage.deleteAll()}");
                await FirebaseAuth.instance.signOut();
                await storage.deleteAll();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
              },
              leading: Image.asset('assets/images/logout.png',height:30.h),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 20.sp,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: REdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      border: Border.all(
                          color: Colors.green, // Set border color
                          width: 1.0), // Set border width
                      borderRadius:  BorderRadius.all(
                          Radius.circular(10.r)), // Set rounded corner radius
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                  child: Text(
                    "Enter Choose Vehicle Number",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoMono(
                      textStyle:
                          TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: 60.h,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      border: Border.all(
                          color: Colors.green, // Set border color
                          width: 1.0), // Set border width
                      borderRadius: const BorderRadius.all(
                          Radius.circular(10.0)), // Set rounded corner radius
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // Make rounded corner of border
                      ),
                  child: Container(
                    margin:  REdgeInsets.only(top: 10),
                    child: TextField(
                      controller: show_controller,
                      keyboardType: TextInputType.none,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoMono(
                        textStyle:
                            TextStyle(fontSize: 18.sp, color: Colors.white),
                      ),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.none, width: 0)),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "GJ 01 KP 8226"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),

                ///TODO GJ 01 Inpute Textfield
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: GJ_controller,
                        keyboardType: TextInputType.text,
                        maxLength: 2,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.characters,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: "GJ",
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field cannot be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        maxLength: 2,
                        controller: h_controller,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            textStyle: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black.withOpacity(0.6))),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: "01",
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field cannot be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),

                ///TODO HL 2785 Inpute Textfield
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: HL_controller,
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        maxLength: 2,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            textStyle: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black.withOpacity(0.6))),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: "KP",
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field cannot be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: Number_controller,
                        maxLength: 4,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            textStyle: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black.withOpacity(0.6))),
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            hintText: "8226",
                            fillColor: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field cannot be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),

                ///TODO ON OFF BUtton
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin:  REdgeInsets.all(10),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0.r),
                            side: const BorderSide(
                                color: Color.fromRGBO(0, 160, 227, 1))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            show_controller.text =
                                "${GJ_controller.text} ${h_controller.text} ${HL_controller.text} ${Number_controller.text}";
                            print("ON");

                            await On_vehicle();
                          }
                        },
                        padding: const EdgeInsets.all(10.0),
                        color: const Color.fromRGBO(0, 160, 227, 1),
                        textColor: Colors.white.withOpacity(0.6),
                        child: Text(
                          "START",
                          style: GoogleFonts.robotoMono(
                              textStyle: TextStyle(
                                  fontSize: 18.sp, color: Colors.white)),
                        ),
                      ),
                    ),
                    Container(
                      margin: REdgeInsets.all(10),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0.r),
                            side: const BorderSide(
                                color: Color.fromRGBO(0, 160, 227, 1))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print("OFF");
                            show_controller.text =
                                "${GJ_controller.text} ${h_controller.text} ${HL_controller.text} ${Number_controller.text}";

                            await Off_vehicle();
                          }
                        },
                        padding: const EdgeInsets.all(10.0),
                        color: const Color.fromRGBO(0, 160, 227, 1),
                        textColor: Colors.white.withOpacity(0.6),
                        child: Text(
                          "OFF",
                          style: GoogleFonts.robotoMono(
                              textStyle: TextStyle(
                                  fontSize: 18.sp, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin:  REdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0.r),
                        side: const BorderSide(
                            color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () async {
                      print("EXIT");
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                    padding: const EdgeInsets.all(10.0),
                    color: const Color.fromRGBO(0, 160, 227, 1),
                    textColor: Colors.white.withOpacity(0.6),
                    child: Text(
                      "EXIT",
                      style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                              fontSize: 18.sp, color: Colors.white)),
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
