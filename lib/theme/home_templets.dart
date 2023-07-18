import 'package:flutter/material.dart';
import 'package:front/main.dart';

import 'color.dart';

class RestaurantWidget extends StatefulWidget {
  final String image;
  final String logo;
  final String name;
  final String address;
  final String workingHours;
  final List<String> catigory;

  RestaurantWidget({
    required this.image,
    required this.logo,
    required this.name,
    required this.address,
    required this.workingHours,
    required this.catigory,
  });

  @override
  _RestaurantWidgetState createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(4, 4), // changes the shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.image,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 0, 0, 0.3),
                            Color.fromRGBO(255, 255, 255, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: ClipOval(
                      child: Image.asset(
                        widget.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0), // changes the shadow position
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.red),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '(${widget.address})',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.grey),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 8.0,
                            children: widget.catigory.map((category) {
                              return Chip(
                                label: Text(category),
                                backgroundColor: AppColors.redLight,
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1,
                                  vertical: 1,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: AppColors.red,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isSaved = !isSaved;
                        });
                      },
                      icon: Icon(
                        isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: AppColors.red,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0), // changes the shadow position
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class leadingButtons extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const leadingButtons({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      leading: Icon(
        icon,
        color: AppColors.red,
      ),
      onTap: onTap,
    );
  }
}
