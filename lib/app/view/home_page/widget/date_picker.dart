import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class WeekDaysPicker extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateChanged;

  const WeekDaysPicker({
    Key? key,
    required this.initialDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  State<WeekDaysPicker> createState() => _WeekDaysPickerState();
}

class _WeekDaysPickerState extends State<WeekDaysPicker> {
  late List<DateTime> weekDays;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    weekDays = _generateWeekDays(selectedDate);
  }

  List<DateTime> _generateWeekDays(DateTime currentDate) {
    // Find the Monday of the current week
    DateTime monday = currentDate.subtract(Duration(days: currentDate.weekday - 1));

    // Generate the week (Monday to Sunday)
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weekDays.map((date) {
          bool isSelected = selectedDate.day == date.day;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = date;
              });
              widget.onDateChanged(date);
            },
            child: Container(
              width: 50,
              height: 70,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: isSelected ? Colors.red.shade400 : Colors.grey,),
                color: isSelected ? Colors.transparent : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat.E().format(date), // Display day name (Mon, Tue, ...)
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date.day.toString(), // Display day number (1, 2, ...)
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
