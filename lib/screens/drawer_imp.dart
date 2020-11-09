import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/main.dart';
import 'package:flutter_covid_dashboard_ui/screens/faq.dart';
import 'package:flutter_covid_dashboard_ui/screens/screens.dart';
import 'package:flutter_covid_dashboard_ui/screens/hospital.dart';
import 'package:flutter_covid_dashboard_ui/screens/Awarness_info.dart';
import 'dart:io';

bool isSwitched = false;

class DrawerImp extends StatefulWidget with PreferredSizeWidget {
  @override
  _DrawerImpState createState() => _DrawerImpState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _DrawerImpState extends State<DrawerImp> {
  @override
  Widget build(BuildContext context) {
    MyApp mp;
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                colorFilter: ColorFilter.linearToSrgbGamma(),
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Hospital.gif'),
              ),
            ),
          ),
          new ListTile(
            focusColor: Colors.black,
            hoverColor: Colors.black,
            title: new Text(
              "Home",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new HomeScreen()));
            },
          ),
          new ListTile(
            title: new Text(
              "Statistics",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new StatsScreen()));
            },
          ),
          new ListTile(
            title: new Text(
              "Nearby Hospital",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Hospital(),
              ));
            },
          ),
          new ListTile(
            title: new Text(
              "AwarnessInfo",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new AwarnessInfo()));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text(
              "Dark Mode",
              style: TextStyle(fontSize: 18),
            ),
            trailing: Switch(
              value: isSwitched,
              onChanged: (changedTheme) {
                toggleTheme();
                setState(() {
                  isSwitched = changedTheme;
                });
                // Navigator.of(context).pop();
              },
            ),
          ),
          new ListTile(
            title: new Text(
<<<<<<< HEAD
              "FAQS",
=======
              "FAQs",
>>>>>>> bc39ff8be30c2612166679f0e2b04d9e0459f562
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new FAQPages()));
            },
          ),
          new ListTile(
            title: new Text(
              "Exit",
              style: TextStyle(fontSize: 18),
            ),
            trailing: new Icon(Icons.exit_to_app),
            onTap: () => exit(0),
          )
        ],
      ),
    );
  }

  void toggleTheme() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
