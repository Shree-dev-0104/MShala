import 'package:flutter/material.dart';
import 'package:medicalshala/pages/schedule_appointment_page.dart';

class AppointmentActions extends StatelessWidget {
  const AppointmentActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScheduleAppointmentPage(),
                ));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.blue, // Button background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 5),
                Text("Appointment", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            // Video Consultation action
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.video_call, color: Colors.white),
                SizedBox(width: 5),
                Text("Consultation", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
