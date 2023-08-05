import 'package:flutter/material.dart';

class ShowReservations extends StatefulWidget {
  const ShowReservations({super.key});

  @override
  State<ShowReservations> createState() => _ShowReservationsState();
}

class _ShowReservationsState extends State<ShowReservations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      'widget.logo',
                      fit: BoxFit.cover,
                      scale: 1,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                  Text(
                    'Restaurant',
                    style: TextStyle(fontSize: 20),
                    
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
