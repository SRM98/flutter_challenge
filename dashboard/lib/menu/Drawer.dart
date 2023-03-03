import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomDrawer extends StatelessWidget {
  final currentRoute;

  CustomDrawer(this.currentRoute);

  void navigate(BuildContext context, String route) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      (Route<dynamic> route) => false,
    );
  }

  Widget getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          CustomListTile(
            Icons.event_available,
            tr("Dashboard"),
            currentRoute == "/dashboard",
            () {
              if (currentRoute == "/dashboard")
                Navigator.of(context).pop();
              else
                navigate(context, "/dashboard");
            },
          ),
          CustomListTile(FontAwesome.close, tr("Logout"), false, () async {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/signIn", (Route<dynamic> route) => false);
          }),
        ],
      ),
    );
  }


  Widget returnGoodDrawer(BuildContext context) {
    return getDrawer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: returnGoodDrawer(context),
    );
  }
}

class CustomListTile extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  final bool isCurrent;
  CustomListTile(this.icon, this.text, this.isCurrent, this.onTap);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  double height;

  _CustomListTileState();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height / 10;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Container(
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: widget.isCurrent
                        ? Color(0xFF73BDBF)
                        : Colors.white),
                height: this.height,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Icon(widget.icon, color: widget.isCurrent
                            ? Colors.white
                            : Color(0xFF73BDBF), size: 25,),
                      ),
                      Expanded(
                        flex: 5,
                        child: AutoSizeText(
                          widget.text,
                          overflow: TextOverflow.clip,
                          minFontSize: 14,
                          style: widget.isCurrent
                              ? TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)
                              : TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF73BDBF)),
                        ),
                      )
                    ])),
          ),
        ),
      ),
    );
  }
}
