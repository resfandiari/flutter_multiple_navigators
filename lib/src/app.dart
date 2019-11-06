import 'package:flutter/material.dart';
import 'package:flutter_multiple_navigators/src/page/index.dart';

import 'nav/TabNavigator.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _tabSelectedIndex = 0;
  var _tabPopStack = false;

  static final List<TabItem> _tabItems = [
    TabItem(GlobalKey<NavigatorState>(), PageOne()),
    TabItem(GlobalKey<NavigatorState>(), PageTwo()),
  ];

//if the user double-clicked on any tab, all tab's sub-page is removed
  void _onTap(index) {
    setState(() {
      _tabPopStack = _tabSelectedIndex == index;
      _tabSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await _tabItems[_tabSelectedIndex].key.currentState.maybePop(),
      child: Scaffold(
        body: Stack(
            children: _tabItems
                .asMap()
                .map((index, value) => MapEntry(
                    index, _buildOffstageNavigator(_tabItems[index], index)))
                .values
                .toList()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabSelectedIndex,
          onTap: (i) => _onTap(i),
          items: [
            BottomNavigationBarItem(
                title: Text("one"), icon: Icon(Icons.looks_one)),
            BottomNavigationBarItem(
                title: Text("two"), icon: Icon(Icons.looks_two)),
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem, int tabIndex) {
    return Offstage(
      offstage: _tabSelectedIndex != tabIndex,
      child: Opacity(
        opacity: _tabSelectedIndex == tabIndex ? 1.0 : 0.0,
        child: TabNavigator(
            tabItem: tabItem, popStack: _tabPopStack, selectedIndex: tabIndex),
      ),
    );
  }
}

class TabItem {
  final GlobalKey<NavigatorState> key;
  final Widget tab;

  const TabItem(this.key, this.tab);
}
