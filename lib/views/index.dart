import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

import 'news_screen.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selected = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.saved_search), label: '')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => {
          setState(() {
            selected = index;
          })
        },
        children: const [
          NewsScreen(),
          NewsScreen(),
          NewsScreen(),
          NewsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selected,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(microseconds: 500), curve: Curves.ease);
        },
        selectedItemColor: Constants.primaryColor,
        items: _bottomNavigationBarItems,
      ),
    );
  }
}
