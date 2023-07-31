import 'package:flutter/material.dart';
import 'package:front/home/contact.dart';
import 'package:front/home/profile.dart';
import 'package:front/main.dart';
import '../auth/log_in.dart';
import '../theme/color.dart';
import '../theme/home_templets.dart';
import '../service/restaurants_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _tabController;
  int _currentIndex = 1;
  String _title = 'Home';

  @override
  void initState() {
    super.initState();
    _tabController = PageController(initialPage: _currentIndex, keepPage: true);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.redLight,
                    AppColors.red,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, bottom: 30, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('images/DeuxRes.png')),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Wellcome',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        userName,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            leadingButtons(
                title: 'Profile',
                icon: Icons.person,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const profilePage()),
                  );
                }),
            leadingButtons(
                title: 'Contact Us',
                icon: Icons.contact_support,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const contactPage()),
                  );
                }),
            leadingButtons(
                title: 'Log Out',
                icon: Icons.logout_rounded,
                onTap: () {
                  isAuthenticated = false;
                  Id = '';
                  userName = '';
                  phone = '';
                  address = '';
                  token = '';
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const StartPage()),
                  );
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _tabController.jumpToPage(1);
          });
        },
        backgroundColor: _currentIndex == 1 ? AppColors.red : AppColors.white,
        foregroundColor: _currentIndex == 1 ? AppColors.white : AppColors.grey,
        child: const Icon(Icons.home),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tabController.jumpToPage(0);
                    });
                  },
                  icon: const Icon(Icons.date_range_rounded),
                  color: _currentIndex == 0 ? AppColors.red : AppColors.grey,
                ),
                Text(
                  'Reservation',
                  style: TextStyle(
                    color: _currentIndex == 0 ? AppColors.red : AppColors.grey,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tabController.jumpToPage(2);
                    });
                  },
                  icon: Icon(_currentIndex == 2
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined),
                  color: _currentIndex == 2 ? AppColors.red : AppColors.grey,
                ),
                Text(
                  'Saved',
                  style: TextStyle(
                    color: _currentIndex == 2 ? AppColors.red : AppColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _tabController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                _title = 'Reservation';
                break;
              case 1:
                _title = 'Home';
                break;
              case 2:
                _title = 'Saved';
                break;
            }
          });
        },
        children: [
          // Reservation page
          Visibility(
            visible: _currentIndex == 0,
            maintainState: true,
            child: Container(),
          ),

          // // Home page
          Visibility(
            visible: _currentIndex == 1,
            maintainState: true,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: SearchBar(
                    leading: const SizedBox(width: 10),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 20),
                    ),
                    hintText: 'Search',
                    trailing: [
                      Icon(
                        Icons.search,
                        color: AppColors.grey,
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                RestService(),
              ],
            ),
          ),

          // Saved page
          Visibility(
            visible: _currentIndex == 2,
            maintainState: true,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
