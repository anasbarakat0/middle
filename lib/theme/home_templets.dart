import 'package:flutter/material.dart';
import 'color.dart';

class RestaurantWidget extends StatefulWidget {
  final String image;
  final String logo;
  final String name;
  final String address;
  final String workingHours;
  final List<String> catigory;
  bool isSaved;

  RestaurantWidget({
    required this.image,
    required this.logo,
    required this.name,
    required this.address,
    required this.workingHours,
    required this.catigory,
    this.isSaved = false,
  });

  @override
  _RestaurantWidgetState createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(4, 4), // changes the shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
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
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x00FFFFFF),
                            Color(0x66000000),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 0), 
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.logo,
                        fit: BoxFit.cover,
                      ),
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
                            const SizedBox(
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
                                backgroundColor: AppColors.white,
                                labelStyle:  TextStyle(
                                  color: AppColors.redLight,
                                  fontSize: 12,
                                ),
                                padding: const EdgeInsets.symmetric(
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 0), // changes the shadow position
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isSaved = !widget.isSaved;
                        });
                      },
                      icon: Icon(
                        widget.isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: AppColors.red,
                      ),
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
