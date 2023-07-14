import 'package:flutter/material.dart';
import 'package:vibe_checker/screens/url_screen.dart';
import 'package:vibe_checker/screens/visualization_screen.dart';
import 'package:vibe_checker/widgets/navigation/logo.dart';
import 'package:vibe_checker/widgets/navigation/navigation_button.dart';

class SideNavBar extends StatefulWidget {
  final String? url;
  final int numberOfComments;
  final TextEditingController? controller;
  final int index;

  const SideNavBar({super.key, this.url, this.controller, required this.index, required this.numberOfComments});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  String url = '';
  int index = 0;
  bool extended = false;
  bool extendedLogo = false;

  @override
  void initState() {
    index = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: extended,
      backgroundColor: const Color(0xff101F36),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.search),
          label: Text('Analyze'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.insert_chart),
          label: Text('Visualization'),
        ),
        // NavigationRailDestination(
        //   icon: Icon(Icons.layers),
        //   label: Text('Projects'),
        // ),
      ],
      minWidth: 70,
      minExtendedWidth: 300,
      selectedIndex: index,
      selectedLabelTextStyle: const TextStyle(color: Colors.white),
      selectedIconTheme: const IconThemeData(color: Colors.black),
      unselectedLabelTextStyle: TextStyle(color: Colors.grey.shade400),
      unselectedIconTheme: const IconThemeData(color: Colors.white),
      useIndicator: true,
      indicatorColor: const Color(0xffEBDFD7),
      groupAlignment: -0.5,
      leading: Column(
        children: [
          extendedLogo ? const Logo(isFull: true) : const Logo(isFull: false,),
          NavigationButton(
            onTap: () {
              setState(() {
                extended = extended ? false : true;
              });
              Future.delayed(const Duration(milliseconds: 100), () {
                setState(() {
                  extendedLogo = extendedLogo ? false : true;
                });
              });
            },
            isRight: extended,
          ),
        ],
      ),
      onDestinationSelected: (value) {
        setState(() {
          index = value;
        });
        // if (widget.controller?.text != "") {
        //   url = widget.controller!.text;
        // }
        if (index == 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const UrlScreen()));
        } else if (index == 1) {
          String? url = widget.url ?? '';
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VisualizationScreen(
                    url: url,
                    numberOfComments: widget.numberOfComments,
                  )));
        }
      },
    );
  }
}
