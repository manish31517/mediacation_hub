import 'package:flutter_covid_dashboard_ui/data/hospitaldata.dart';

import 'drawer_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_covid_dashboard_ui/widgets/widgets.dart';

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
          _showHospitalInfo(screenHeight, _state),
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
            bottomLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    'Hospital Information',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 25.0,
                      letterSpacing: 1.2,
                      fontFamily: 'Merienda-Regular',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'Select State',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Merienda-Regular',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.0095),
                CountryDropdown(
                  countries: [
                    'A & N Islands',
                    'Andhra Pradesh',
                    'Assam',
                    'Bihar',
                    'Chandigarh',
                    'Chhattisgarh',
                    'Delhi',
                    'Goa',
                    'Gujarat',
                    'Haryana',
                    'Himachal Pradesh',
                    'Jammu & Kashmir',
                    'Jharkhand',
                    'Karnataka',
                    'Kerala',
                    'Madhya Pradesh',
                    'Maharastra',
                    'Manipur',
                    'Meghalaya',
                    'Odisha',
                    'Puducherry',
                    'Punjab',
                    'Rajasthan',
                    'Sikkim',
                    'Tamil Nadu',
                    'Telangana',
                    'Tripura',
                    'Uttar Pradesh',
                    'West Bengal'
                  ],
                  country: _state,
                  onChanged: (val) {
                    // _showData(val);
                    setState(() {
                      _state = val;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

SliverToBoxAdapter _showHospitalInfo(double screenHeight, String state) {
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                            "City : " +
                                HospitalData.hospitalData[state][index]['city'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14)),
                      ],
                    ),
                    Column(children: <Widget>[
                      Text(
                        "OwnerShip : " +
                            HospitalData.hospitalData[state][index]
                                ['ownership'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ])
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                              "Covid Beds : " +
                                  HospitalData.hospitalData[state][index]
                                          ['hospitalBeds']
                                      .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                              "Admission Capacity : " +
                                  HospitalData.hospitalData[state][index]
                                          ['admissionCapacity']
                                      .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ]),
                Padding(padding: EdgeInsets.all(10)),
              ],
            );
          },
        ),
      ),
    ),
  );
}
