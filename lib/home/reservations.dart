import 'package:flutter/material.dart';
import '../service/reservat_service.dart';
import '../theme/color.dart';

class ShowReservations extends StatefulWidget {
  final String reservationId;
  final String restaurantId;
  final String tableId;
  final String restName;
  final String restLogo;
  final String tableNo;
  final int people;
  final String date;
  final String status;
  const ShowReservations({
    super.key,
    required this.people,
    required this.date,
    required this.status,
    required this.restName,
    required this.restLogo,
    required this.tableNo,
    required this.reservationId,
    required this.tableId,
    required this.restaurantId,
  });

  @override
  State<ShowReservations> createState() => _ShowReservationsState();
}

class _ShowReservationsState extends State<ShowReservations> {


  DateTime dateTime = DateTime.now();

  TimeOfDay _timeOfDay = TimeOfDay.now();
  bool chooseD = false;
  bool chooseT = false;

  void _showDatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    ).then((value) {
      setState(() {
        chooseD = true;
        dateTime = value!;
      });
    });
  }

  void _showTimepicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((time) {
      setState(() {
        chooseT = true;
        _timeOfDay = time!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int selectedNumberPeople = widget.people;
    String croppedDate = widget.date.toString().substring(0, 5);
    String croppedTime = widget.date.toString().substring(6, 11);
    String editeDate = '$croppedDate $croppedTime';
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.0,
            blurRadius: 3.0,
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      widget.restLogo,
                      fit: BoxFit.cover,
                      scale: 1,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                  Text(
                    widget.restName,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const Text(
                'Reservation date',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: AppColors.red, width: 1)),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: _showDatepicker,
                  child: Text(
                    chooseD
                        ? croppedDate = _timeOfDay.toString().substring(5, 10)
                        : croppedDate,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const Text(
                'Reservation time',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: AppColors.red, width: 1)),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.white),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: _showTimepicker,
                  child: Text(
                    chooseT
                        ? croppedTime = _timeOfDay.toString().substring(10, 15)
                        : croppedTime,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Number of people',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2.0,
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(3, 3),
                        ),
                      ],
                      border: Border.all(
                        color: AppColors.red,
                        width: 1.0,
                      ),
                    ),
                    child: DropdownButton<int>(
                      value: selectedNumberPeople,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedNumberPeople = newValue!;
                        });
                      },
                      items: List.generate(
                        20,
                        (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text((index + 1).toString()),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: deletReservation(widget.reservationId),
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.red,
                ),
              ),
              ElevatedButton(
                onPressed:() {updateReservation(editeDate, selectedNumberPeople, widget.reservationId);},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.red),
                ),
                 child: const Text('Modification'),
              )
            ],
          )
        ],
      ),
    );
  }
}
