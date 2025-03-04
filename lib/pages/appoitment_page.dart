import 'package:flutter/material.dart';
import 'package:medicalshala/components/appointment_actions.dart';
import 'package:medicalshala/components/appointment_card.dart';

// Main Appointment Page
class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          title: const Text("Appointment"),
          actions: const [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/profile_pic.png'), // Profile Image
            ),
            SizedBox(width: 16),
          ],
        ),
        drawer: const Drawer(), // Side Menu
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppointmentSummary(),
              const SizedBox(height: 10),
              const AppointmentActions(),
              const SizedBox(height: 10),
              const Text("Today, 10 Jan 2024",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: const [
                    AppointmentCard(
                      time: "10:00 AM",
                      status: "ONGOING",
                      name: "Aarav",
                      id: "9374",
                      age: "30",
                      gender: "Male",
                      lastVisited: "1 month ago",
                      image: "assets/patients/aarav.png",
                      statusColor: Colors.green,
                    ),
                    AppointmentCard(
                      time: "10:30 AM",
                      status: "UPCOMING",
                      name: "Ishita",
                      id: "9723",
                      age: "28",
                      gender: "Female",
                      lastVisited: "1 month ago",
                      image: "assets/patients/ishita.png",
                      statusColor: Colors.blue,
                    ),
                    AppointmentCard(
                      time: "11:00 AM",
                      status: "UPCOMING",
                      name: "Kavya",
                      id: "8634",
                      age: "24",
                      gender: "Female",
                      lastVisited: "1 month ago",
                      image: "assets/patients/kavya.png",
                      statusColor: Colors.blue,
                    ),
                    AppointmentCard(
                      time: "11:30 AM",
                      status: "UPCOMING",
                      name: "Aditya",
                      id: "7364",
                      age: "28",
                      gender: "Male",
                      lastVisited: "1 month ago",
                      image: "assets/patients/aditya.png",
                      statusColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white, // Ensures visibility
          selectedItemColor: Colors.blue, // Active tab color
          unselectedItemColor: Colors.grey, // Inactive tab color
          showUnselectedLabels: true, // Shows labels for inactive items
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Replace SvgIcon if needed
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "Inbox",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help),
              label: "Ask AI",
            ),
          ],
        ));
  }
}

// Appointment Summary Widget
class AppointmentSummary extends StatelessWidget {
  const AppointmentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircularProgressIndicator(
                value: 0.7, strokeWidth: 8), // Dummy progress
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("24",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("ALL PATIENTS", style: TextStyle(color: Colors.grey)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("12 UPCOMING", style: TextStyle(color: Colors.purple)),
                Text("8 COMPLETED", style: TextStyle(color: Colors.green)),
                Text("4 MISSED", style: TextStyle(color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
