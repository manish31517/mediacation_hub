import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/screens/setting.dart';
bool isSwitched = false;
class DrawerImp extends StatefulWidget with PreferredSizeWidget {
  @override
  _DrawerImpState createState() => _DrawerImpState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _DrawerImpState extends State<DrawerImp> {

  @override
  String currentProfilePic = "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";

  String otherProfilePic = "https://yt3.ggpht.com/-2_2skU9e2Cw/AAAAAAAAAAI/AAAAAAAAAAA/6NpH9G8NWf4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg";

  void _switchUser(){
    String backupString = currentProfilePic;
    this.setState(() {
      currentProfilePic=otherProfilePic;
      otherProfilePic = backupString;
    });
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text("My Drawer App"),
              accountEmail: new Text('matul31517@gmail.com'),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("This is the current user"),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(currentProfilePic),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => _switchUser(),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(otherProfilePic),
                  ),
                ),
              ],
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg")
                  )
              )
          ),
          new ListTile(
            title: new Text("About Us"),
            trailing: new Icon(Icons.arrow_upward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Setting(
                      'First Page')));
            },

          ),
          new ListTile(
            title: new Text("Dark Mode"),
            trailing: Switch(
                value: isSwitched,
                onChanged:(changedTheme){
                  toggleTheme();
                  setState(() {
                     isSwitched = changedTheme;
                  });
                  // Navigator.of(context).pop();
                },
                ),

          ),
          new Divider(),
          new ListTile(
            title: new Text("Close"),
            trailing: new Icon(Icons.cancel),
            onTap: () => Navigator.of(context).pop(),
          )

        ],
      ),
    );

  }
  void toggleTheme(){
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
