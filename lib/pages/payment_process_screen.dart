import 'package:flutter/material.dart';
import 'package:medicalshala/components/detail_row.dart';
import 'package:medicalshala/pages/payment_screen.dart';


/*
NAVIGATION - PAYMENT PROCESS SCREEN - PAYMENT SCREEN
*/

class PaymentProcessScreen extends StatelessWidget {
  final String patientName;
  final String patientAge;
  final String patientGender;
  final String contactNumber;
  final String doctorName;
  final String hospitalName;
  final String appointmentDate;
  final String appointmentSlot;
  final double consultationFee;

  const PaymentProcessScreen({
    super.key,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.contactNumber,
    required this.doctorName,
    required this.hospitalName,
    required this.appointmentDate,
    required this.appointmentSlot,
    this.consultationFee = 500,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "Appointment Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main content card
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Booking Details",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // PATIENT DETAILS
                    _buildSectionHeader("PATIENT DETAILS"),
                    const SizedBox(height: 8),

                    DetailRow(
                      label: "Name",
                      value: patientName,
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      labelStyle: const TextStyle(fontSize: 13),
                      valueStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    DetailRow(
                      label: "Age",
                      value: patientAge,
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      labelStyle: const TextStyle(fontSize: 13),
                      valueStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    DetailRow(
                      label: "Gender",
                      value: patientGender,
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      labelStyle: const TextStyle(fontSize: 13),
                      valueStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    DetailRow(
                      label: "Contact Number",
                      value: contactNumber,
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      labelStyle: const TextStyle(fontSize: 13),
                      valueStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 12),

                    // DOCTOR DETAILS
                    _buildSectionHeader("DOCTOR DETAILS"),
                    const SizedBox(height: 8),

                    DetailRow(
                      label: "Doctor's Name",
                      value: doctorName,
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      labelStyle: const TextStyle(fontSize: 13),
                      valueStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    DetailRow(
                      label: "Hospital's Name",
                      value: hospitalName,
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      labelStyle: const TextStyle(fontSize: 13),
                      valueStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    DetailRow(
                      label: "Date & Slot",
                      value: "$appointmentDate & $appointmentSlot",
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      labelStyle: const TextStyle(fontSize: 13),
                      valueStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 12),

                    // BILL DETAILS
                    _buildSectionHeader("BILL DETAILS"),
                    const SizedBox(height: 8),

                    DetailRow(
                      label: "Consultation Fee",
                      value: "Rs.${consultationFee.toInt()}",
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      labelStyle: const TextStyle(fontSize: 13),
                      valueStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Proceed Payment Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Proceed Payment",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 20), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail, size: 20), label: "Inbox"),
          BottomNavigationBarItem(
              icon: Icon(Icons.help, size: 20), label: "Ask AI"),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            height: 1,
            color: Colors.grey[300],
          ),
        )
      ],
    );
  }
}
