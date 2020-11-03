import 'package:flutter_covid_dashboard_ui/data/hospitaldata.dart';

import 'drawer_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:flutter_covid_dashboard_ui/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  String _state = 'A & N Islands';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawerImp(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _showHospitalInfo(screenHeight,_state),

        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/app_bg4.jpg'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hospital Info',
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                CountryDropdown(
                  countries: ['A & N Islands', 'Andhra Pradesh', 'Assam', 'Tripura',
                    'Punjab', 'Rajasthan', 'Sikkim', 'Goa', 'Chandigarh',
                    'Chhattisgarh', 'Haryana', 'Himachal Pradesh', 'Jammu & Kashmir',
                    'Jharkhand', 'Karnataka', 'Maharastra', 'Manipur', 'Meghalaya',
                    'Odisha', 'Puducherry', 'Tamil Nadu', 'Telangana', 'Delhi',
                    'Gujarat', 'Kerala', 'Madhya Pradesh', 'Bihar', 'Uttar Pradesh', 'West Bengal'],
                  country: _state,
                  onChanged: (val){
                    // _showData(val);
                    setState(()
                  { _state = val;});},
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
              ],
            )

        ),
      );

  }
}
SliverToBoxAdapter _showHospitalInfo(double screenHeight,String state) {
  return SliverToBoxAdapter(
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 5.0,
      ),
      padding: const EdgeInsets.all(10.0),
       height: screenHeight * 1,

      child: Container(
         child: ListView.builder(
              itemCount: HospitalData.hospitalData[state].length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(
                    HospitalData.hospitalData[state][index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 18),
                  ),

                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                       Column(
                         children: <Widget>[
                           Text("City : "+HospitalData.hospitalData[state][index]['city'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                         ],
                       ),
                         Column(
                         children: <Widget>[
                          Text("OwnerShip - "+HospitalData.hospitalData[state][index]['ownership'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                    ]     )
                       ]
                       ),
                    Padding(padding: EdgeInsets.all(10)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Column(
                         children: <Widget>[
                          Text("Covid Beds : - "+HospitalData.hospitalData[state][index]['hospitalBeds'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                    ]     ),
                         Column(
                           children: <Widget>[
                             Text("Admission Capacity : - "+HospitalData.hospitalData[state][index]['admissionCapacity'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                           ],
                         ),

                       ]
                       ),
                    Padding(padding: EdgeInsets.all(10)),
                  ],
                );
              })
      )
    ),
  );
}


