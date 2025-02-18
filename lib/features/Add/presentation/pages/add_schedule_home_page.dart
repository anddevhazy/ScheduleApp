import 'package:flutter/material.dart';
import 'package:schedule_app/features/Add/presentation/pages/schedule_entry_page.dart';
import 'package:table_calendar/table_calendar.dart';

class AddScheduleHomePage extends StatelessWidget {
  const AddScheduleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDay = DateTime.now();
    CalendarFormat calendarFormat = CalendarFormat.month;
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                calendarFormat: calendarFormat,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                ),
                onDaySelected: (selectedDate, focusedDay) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduleEntryPage(
                        selectedDate: selectedDate,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text("Select a date to add schedule",
            style: TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}
