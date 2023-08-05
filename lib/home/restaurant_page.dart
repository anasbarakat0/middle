import 'package:flutter/material.dart';
import 'package:front/home/home_page.dart';
import 'package:front/home/reserve.dart';

import 'package:front/service/restaurants_service.dart';

import '../theme/color.dart';

class RestPage extends StatefulWidget {
  final String image;
  final String logo;
  final String name;
  final String address;
  final WorkingHours workingHours;
  final List<dynamic> catigory;
  final int tables;

  const RestPage(
      {super.key,
      required this.image,
      required this.logo,
      required this.name,
      required this.address,
      required this.catigory,
      required this.workingHours,
      required this.tables});

  @override
  State<RestPage> createState() => _RestPageState();
}

class _RestPageState extends State<RestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.image,
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              scale: 1,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'images/DeuxRes.png',
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).size.height / 4,
                  scale: 1,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.red,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            widget.address,
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: AppColors.red,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Open everyday at ${widget.workingHours.open} AM to ${widget.workingHours.close} AM',
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.2,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // width: MediaQuery.of(context).size.width-20,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      color: AppColors.red, width: 2),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.white),
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(AppColors.red),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Menu',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                        color: AppColors.red, width: 2)),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(AppColors.red),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReserveTable(
                                            tables: widget.tables,
                                          )));
                            },
                            child: const Text(
                              'Reserve a table',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
