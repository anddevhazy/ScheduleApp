import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScheduleEntryPage extends StatefulWidget {
  final DateTime selectedDate;

  const ScheduleEntryPage({super.key, required this.selectedDate});

  @override
  _ScheduleEntryPageState createState() => _ScheduleEntryPageState();
}

class _ScheduleEntryPageState extends State<ScheduleEntryPage> {
  List<Map<String, String>> schedules = [];

  void addScheduleEntry() {
    setState(() {
      schedules.add({'event': '', 'time': ''});
    });
  }

  void saveSchedule() async {
    if (schedules.isNotEmpty) {
      FirebaseFirestore.instance
          .collection('schedules')
          .doc(widget.selectedDate.toIso8601String())
          .set({
        'date': widget.selectedDate.toIso8601String(),
        'entries': schedules,
      });
      Navigator.pop(context); // Return to previous page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Schedule"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "${widget.selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Event",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              onChanged: (value) {
                                schedules[index]['event'] = value;
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Time (e.g., 10:00 AM)",
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  border: InputBorder.none),
                              onChanged: (value) {
                                schedules[index]['time'] = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: addScheduleEntry,
                  child: Text("Add Entry"),
                ),
                ElevatedButton(
                  onPressed: saveSchedule,
                  child: Text("Save Schedule"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
