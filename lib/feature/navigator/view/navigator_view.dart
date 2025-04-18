import 'package:flutter/material.dart';
import 'package:mental_health_app/feature/comment/comment_screen.dart';
import 'package:mental_health_app/feature/community/community_screen.dart';
import 'package:mental_health_app/feature/home/view/home_view.dart';
import 'package:mental_health_app/feature/library/library_view.dart';
import 'package:mental_health_app/feature/sessions/sessions_screen.dart';
import 'package:mental_health_app/utils/colors.dart';
import 'package:mental_health_app/utils/image_resource.dart';

class NavigatorView extends StatefulWidget {
  final String? email;
  final String? password;

  const NavigatorView({super.key, this.email, this.password});

  @override
  State<NavigatorView> createState() => _NavigatorViewState();
}

class _NavigatorViewState extends State<NavigatorView> {
  int _selectedIndex = 0;

  late final List<Widget> widgetOptions;

  @override
  void initState() {
    super.initState();
    widgetOptions = [
      HomeView(email: widget.email),
      SessionsScreen(),
      CommentScreen(),
      CommunityScreen(),
      LibraryPage()
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: ColorPalettes.whiteColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorPalettes.darkOrangeColor,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon:
                Image.asset(ImageResource.homeIcon, width: 24, height: 24),
            icon:
                Image.asset(ImageResource.emptyHomeIcon, width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(ImageResource.filledVideoIcon,
                width: 24, height: 24),
            icon: Image.asset(ImageResource.videoIcon, width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon:
                Image.asset("assets/icon/comment.png", width: 24, height: 24),
            icon: Image.asset("assets/icon/comment.png", width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(ImageResource.filledUserIcon,
                width: 24, height: 24),
            icon: Image.asset(ImageResource.userIcon, width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.my_library_books),
            icon: Icon(Icons.my_library_books_outlined),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
