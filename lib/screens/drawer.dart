import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/text/text.dart';
import 'cart.dart';
import 'home.dart';
import 'icons.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/pratik.jpg'),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                      const SizedBox(width: 13),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextBuilder(text: 'Pratik Navapara', fontSize: 20, fontWeight: FontWeight.bold),
                            TextBuilder(text: 'pratik@gmail.com', fontSize: 15.0, fontWeight: FontWeight.normal),
                          ]),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 400,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
                        },
                        child: ListTile(
                          leading: Icon(Icons.home, color: Colors.black),
                          title: TextBuilder(
                              text: "Home", fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Cart()));
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.shopping_bag,
                            color: Colors.black,
                          ),
                          title: TextBuilder(
                              text: "Cart", fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: _createEmail,
                        child: ListTile(
                          leading: Icon(Icons.email, color: Colors.black),
                          title: TextBuilder(
                              text: "Contact", fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showAboutDialog(
                            context: context,
                            applicationIcon: SmallAppIcon(),
                            applicationVersion: '1.0.0+1',
                            applicationLegalese: 'Show me',
                          );
                        },
                        child: ListTile(
                          leading: Icon(Icons.info, color: Colors.black),
                          title: Text("About App",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _createEmail() async {
    const emailAddress = 'mailto:adbytee@gmail.com?subject=Can we Talk?&body=I have Job offer for you.';
    await canLaunch(emailAddress) ? await launch(emailAddress) : throw 'Could not launch $emailAddress';
  }
}