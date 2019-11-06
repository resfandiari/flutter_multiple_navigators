import 'package:flutter/material.dart';
import '../app.dart';

class TabNavigator extends StatelessWidget {
  final TabItem tabItem;
  final bool popStack;
  final int selectedIndex;

  TabNavigator(
      {Key key, this.tabItem, this.popStack = false, this.selectedIndex})
      : super(key: key);

//if the user double-clicked on any tab, all tab's sub-page is removed
  _popStackIfRequired(BuildContext context) async {
    if (popStack) {
      tabItem.key.currentState.popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('selectedIndex= $selectedIndex, popStack= $popStack');

    _popStackIfRequired(context);

    return Navigator(
        key: tabItem.key,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
              settings: settings, builder: (_) => tabItem.tab);
        });
  }
}
