import 'package:flutter/material.dart';

// Reusable Appointment Card
class AppointmentCard extends StatelessWidget {
  final String time, status, name, id, age, gender, lastVisited, image;
  final Color statusColor;

  const AppointmentCard({
    super.key,
    required this.time,
    required this.status,
    required this.name,
    required this.id,
    required this.age,
    required this.gender,
    required this.lastVisited,
    required this.image,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),

            // Appointment Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Time & Status
                  Row(
                    children: [
                      Text(
                        time,
                        style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      Text("• $status", style: TextStyle(color: statusColor)),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Name
                  Text(
                    name,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),

                  // Patient Info Row
                  Wrap(
                    spacing: 10,
                    children: [
                      _iconText(Icons.people, id),
                      _iconText(Icons.person, "$age, $gender"),
                      _iconText(Icons.access_time, "Visited $lastVisited"),
                    ],
                  ),
                ],
              ),
            ),

            // More Options
            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Icon + Text
  Widget _iconText(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }
}
