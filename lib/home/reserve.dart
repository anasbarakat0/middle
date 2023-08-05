import 'package:flutter/material.dart';
import 'package:front/home/home_page.dart';
import 'package:front/theme/color.dart';
import '../service/reservat_service.dart';
import '../theme/auth_templets.dart';

class ReserveTable extends StatefulWidget {
  final int tables;
  const ReserveTable({super.key, required this.tables});

  @override
  State<ReserveTable> createState() => _ReserveTableState();
}

class _ReserveTableState extends State<ReserveTable> {
  int selectedNumber = 1;
  int selectedNumberPeople = 1;
  final TextEditingController peopleController = TextEditingController();
  final TextEditingController notes = TextEditingController();
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
    String croppedDate = dateTime.toString().substring(5, 10);
    String croppedTime = _timeOfDay.toString().substring(10, 15);
    String date = '$croppedDate $croppedTime';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'New Reservation',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
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
                    chooseD ? croppedDate : 'Pick a Date',
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
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
                        ? _timeOfDay.format(context).toString()
                        : 'Pick a Time',
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
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
              ////////////////////////////////////
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
              const Text(
                'Table number',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
                      value: selectedNumber,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedNumber = newValue!;
                        });
                      },
                      items: List.generate(
                        widget.tables,
                        (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text((index + 1).toString()),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              CustomTextField(
                controller: notes,
                text: 'Notes',
                hintText: 'Any more detailes to mention?',
              ),
              const SizedBox(
                height: 120,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.red),
                  ),
                  onPressed: () {
                    var status = addReservation(
                        selectedNumber, date, selectedNumberPeople);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("$status")),
                    );
                  },
                  child: const Text(
                    'Reserve',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
