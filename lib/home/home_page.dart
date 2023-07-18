import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../service/auth_service.dart';
import '../theme/home_templets.dart';
import '../main.dart';
import 'package:flutter/rendering.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _tabController;
  int _currentIndex = 0;
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

  final List<RestaurantData> restaurants = [
    RestaurantData(
      image: 'images/restaurant.jpg',
      logo: 'images/DeuxRes.png',
      name: 'Restaurant 1',
      address: 'Address 1',
      workingHours: '9:00 AM - 10:00 PM',
      catigory: ['Description 1', 'Description 2', 'Description 3'],
    ),
    RestaurantData(
      image: 'images/restaurant.jpg',
      logo: 'images/DeuxRes.png',
      name: 'Restaurant 2',
      address: 'Address 2',
      workingHours: '9:00 AM - 10:00 PM',
      catigory: [
        'Description 1',
        'Description 2',
        'Description 3',
        'Description 4',
        'Description 5'
      ],
    ),
    // Add more restaurant data here
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(fontWeight: FontWeight.w600),
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  transform: const GradientRotation(-45 * 0.0174533),
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
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                    ),
                    const Text(
                      'Wellcome',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('${getUser()}'),
                  ],
                ),
              ),
            ),
            leadingButtons(
                title: 'Favorates',
                icon: Icons.favorite,
                onTap: () {
                  Navigator.pop(context);
                }),
            leadingButtons(
                title: 'Feedback',
                icon: Icons.feedback_rounded,
                onTap: () {
                  Navigator.pop(context);
                }),
            leadingButtons(
                title: 'Log Out',
                icon: Icons.logout_rounded,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const StartPage()),
                  );
                }),
          ],
        ),
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
                  icon: Icon(Icons.home),
                  color: _currentIndex == 0 ? AppColors.red : AppColors.grey,
                ),
                Text(
                  'Home',
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
                      _tabController.jumpToPage(1);
                    });
                  },
                  icon: Icon(Icons.restaurant),
                  color: _currentIndex == 1 ? AppColors.red : AppColors.grey,
                ),
                Text(
                  'Restaurant',
                  style: TextStyle(
                    color: _currentIndex == 1 ? AppColors.red : AppColors.grey,
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
                  icon: Icon(Icons.date_range_rounded),
                  color: _currentIndex == 2 ? AppColors.red : AppColors.grey,
                ),
                Text(
                  'Reservation',
                  style: TextStyle(
                    color: _currentIndex == 2 ? AppColors.red : AppColors.grey,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.values[0],
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tabController.jumpToPage(3);
                    });
                  },
                  icon: Icon(Icons.bookmark),
                  color: _currentIndex == 3 ? AppColors.red : AppColors.grey,
                ),
                Text(
                  'Saved',
                  style: TextStyle(
                    color: _currentIndex == 3 ? AppColors.red : AppColors.grey,
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
                _title = 'Home';
                break;
              case 1:
                _title = 'Restaurant';
                break;
              case 2:
                _title = 'Reservation';
                break;
              case 3:
                _title = 'Saved';
                break;
            }
          });
        },
        children: [
          ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return RestaurantWidget(
                image: restaurant.image,
                logo: restaurant.logo,
                name: restaurant.name,
                address: restaurant.address,
                workingHours: restaurant.workingHours,
                catigory: restaurant.catigory,
              );
            },
          ),
          // Add the other screens here based on _currentIndex
        ],
      ),
    );
  }
}

class RestaurantData {
  final String image;
  final String logo;
  final String name;
  final String address;
  final String workingHours;
  final List<String> catigory;

  RestaurantData({
    required this.image,
    required this.logo,
    required this.name,
    required this.address,
    required this.workingHours,
    required this.catigory,
  });
}
