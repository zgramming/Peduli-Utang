import 'package:flutter/material.dart';
import 'package:global_template/global_template.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  /// Count of screen must be same with count of Items in BottomNavigationBarCustom
  final List<Widget> screens;

  /// Change Color Icon And Text if items is selected
  final Color selectedItemsColor;

  /// Change Color Icon And Text if items is unselected
  final Color unselectedItemsColor;

  /// Change Size Of Icon if Items is Selected
  final double selectedIconSize;

  /// Include Your Drawer in BottomNavigationCustom
  final Widget drawer;

  /// Image For Home Screen
  final Widget imageLogoBuilder;

  /// Title AppBar
  final List<Widget> titleAppbar;

  /// Icon BottomNavigation
  final List<IconData> iconBottomNavigation;

  /// Title BottomNavigation
  final List<Widget> titleBottomNavigation;

  /// Jumlah Halaman , Icon , Tittle Icon Yang Akan Ditampilkan. Minimal 2 Maximal 5 !
  final int totalScreen;

  /// Hidden Unselected BottomNavBar Text
  final bool showUnselectedLabels;
  BottomNavigationBarCustom({
    @required this.screens,
    @required this.drawer,
    @required this.titleBottomNavigation,
    @required this.totalScreen,
    @required this.titleAppbar,
    @required this.iconBottomNavigation,
    this.imageLogoBuilder,
    this.selectedItemsColor = Colors.white,
    this.unselectedItemsColor = Colors.white70,
    this.selectedIconSize = 28.0,
    this.showUnselectedLabels = false,
  });
  @override
  _BottomNavigationBarCustomState createState() => _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndexBottomNavigation = 0;
  final Widget _currentAppbarBottomNavigation = Text('');
  @override
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => doubleTapToExit.doubleTapToExit(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: (widget.imageLogoBuilder == null)
              ? _currentAppbarBottomNavigation
              : (_currentIndexBottomNavigation != 0)
                  ? _currentAppbarBottomNavigation
                  : widget.imageLogoBuilder,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            )
          ],
        ),
        drawer: widget.drawer ?? Drawer(),
        body: IndexedStack(
          index: _currentIndexBottomNavigation,
          children: widget.screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: itemsBottom(),
          selectedIconTheme: IconThemeData(size: widget.selectedIconSize),
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _currentIndexBottomNavigation,
          unselectedItemColor: widget.unselectedItemsColor,
          selectedItemColor: widget.selectedItemsColor,
          showUnselectedLabels: widget.showUnselectedLabels,
          onTap: (int index) {
            setState(() => _currentIndexBottomNavigation = index);
            Widget child;
            for (var i = 0; i < widget.totalScreen; i++) {
              if (index == i) {
                setState(() => child = widget.titleAppbar[i]);
              } else {
                child = null;
              }
            }
            return child;
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> itemsBottom() {
    var children = [];
    for (var i = 0; i < widget.totalScreen; i++) {
      children.insert(
        i,
        BottomNavigationBarItem(
            icon: Icon(widget.iconBottomNavigation[i] ?? Icons.home),
            title: widget.titleBottomNavigation[i] ?? Text('Icon Title $i')),
      );
    }
    return children;
  }
}
