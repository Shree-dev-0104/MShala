import 'package:flutter/material.dart';
import 'package:medicalshala/pages/payment_process_screen.dart';

/*
NAVIGATION - SCHEDULE APPOINTMENT PAGE TO PAYMENT PROCESS SCREEN
*/

class ScheduleAppointmentPage extends StatefulWidget {
  const ScheduleAppointmentPage({super.key});

  @override
  State<ScheduleAppointmentPage> createState() =>
      _ScheduleAppointmentPageState();
}

class _ScheduleAppointmentPageState extends State<ScheduleAppointmentPage> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  // State for gender selection
  String? _selectedGender;

  // State for doctor and hospital selection
  String? _selectedDoctor;
  String? _selectedHospital;
  String? _selectedTimeSlot;

  // Function to check if all fields are filled
  bool _areAllFieldsFilled() {
    return _nameController.text.isNotEmpty &&
        _ageController.text.isNotEmpty &&
        _reasonController.text.isNotEmpty &&
        _selectedGender != null &&
        _selectedDoctor != null &&
        _selectedHospital != null &&
        _dateController.text.isNotEmpty &&
        _selectedTimeSlot != null &&
        _contactController.text.isNotEmpty;
  }

  // Function to open date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Schedule Appointment",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Patient Details Section
              const Text("Patient Details",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  fillColor:
                      const Color(0xFFE5F4FF), // Set the background color
                  filled: true, // Enable filling the background color
                  hintText: "Patient's Name",
                  hintStyle: const TextStyle(fontSize: 12),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Colors.blue.shade100, width: 1),
                  ),
                  isDense: true,
                ),
                style: const TextStyle(fontSize: 14),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        fillColor:
                            const Color(0xFFE5F4FF), // Set the background color
                        filled: true, // Enable filling the background color
                        hintText: "Age",
                        hintStyle: const TextStyle(fontSize: 12),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.blue.shade100, width: 1),
                        ),
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 14),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Radio(
                        value: "Male",
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value as String?;
                          });
                        },
                      ),
                      const Text("Male", style: TextStyle(fontSize: 12)),
                      Radio(
                        value: "Female",
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value as String?;
                          });
                        },
                      ),
                      const Text("Female", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              TextField(
                controller: _reasonController,
                maxLines: 2,
                decoration: InputDecoration(
                  fillColor:
                      const Color(0xFFE5F4FF), // Set the background color
                  filled: true, // Enable filling the background color
                  hintText: "Reason for appointment",
                  hintStyle: const TextStyle(fontSize: 12),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Colors.blue.shade100, width: 1),
                  ),
                  isDense: true,
                ),
                style: const TextStyle(fontSize: 14),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),

              // Doctor Details Section
              const Text("Doctor Details",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              DropdownButtonFormField(
                dropdownColor: Color(0xFFE5F4FF),
                value: _selectedDoctor,
                items: const [
                  DropdownMenuItem(
                      value: "Dr. Smith", child: Text("Dr. Smith")),
                  DropdownMenuItem(value: "Dr. Alex", child: Text("Dr. Alex")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedDoctor = value as String?;
                  });
                },
                decoration: InputDecoration(
                  fillColor:
                      const Color(0xFFE5F4FF), // Set the background color
                  filled: true, // Enable filling the background color
                  hintText: "Doctor's Name",
                  hintStyle: const TextStyle(fontSize: 12),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xFFE5F4FF), width: 1),
                  ),
                  isDense: true,
                ),
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField(
                value: _selectedHospital,
                dropdownColor: Color(0xFFE5F4FF),
                items: const [
                  DropdownMenuItem(
                      value: "City Hospital", child: Text("City Hospital")),
                  DropdownMenuItem(value: "AIIMS", child: Text("AIIMS"))
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedHospital = value as String?;
                  });
                },
                decoration: InputDecoration(
                  fillColor:
                      const Color(0xFFE5F4FF), // Set the background color
                  filled: true, // Enable filling the background color
                  hintText: "Hospital's Name",
                  hintStyle: const TextStyle(fontSize: 12),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xFFE5F4FF), width: 1),
                  ),
                  isDense: true,
                ),
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        fillColor:
                            const Color(0xFFE5F4FF), // Set the background color
                        filled: true, // Enable filling the background color
                        hintText: "dd/mm/yyyy",
                        hintStyle: const TextStyle(fontSize: 12),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Color(0xFFE5F4FF), width: 1),
                        ),
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 14),
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        _selectDate(context);
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedTimeSlot,
                      items: const [
                        DropdownMenuItem(
                            value: "10:00 AM", child: Text("10:00 AM")),
                        DropdownMenuItem(
                            value: "12:00 AM", child: Text("12:00 AM"))
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedTimeSlot = value as String?;
                        });
                      },
                      dropdownColor: Color(0xFFE5F4FF),
                      decoration: InputDecoration(
                        fillColor:
                            const Color(0xFFE5F4FF), // Set the background color
                        filled: true, // Enable filling the background color
                        hintText: "Select Slot",
                        hintStyle: const TextStyle(fontSize: 12),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Color(0xFFE5F4FF), width: 1),
                        ),
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Contact Number Section
              const Text("Contact Number",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              TextField(
                controller: _contactController,
                decoration: InputDecoration(
                  fillColor:
                      const Color(0xFFE5F4FF), // Set the background color
                  filled: true, // Enable filling the background color
                  prefixIcon: const Icon(Icons.phone, size: 18),
                  hintText: "+91 ",
                  hintStyle: const TextStyle(fontSize: 12),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xFFE5F4FF), width: 1),
                  ),
                  isDense: true,
                ),
                style: const TextStyle(fontSize: 14),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),

              // Support Section
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline,
                        color: Colors.blue, size: 20),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Our support team is here to help with appointment scheduling. Reach out anytime for quick assistance!",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.call, color: Colors.blue, size: 20),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.chat, color: Colors.blue, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Schedule Appointment Button
              GestureDetector(
                onTap: _areAllFieldsFilled()
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentProcessScreen(
                              patientName: _nameController.text,
                              patientAge: _ageController.text,
                              patientGender: _selectedGender ?? "Not specified",
                              contactNumber: _contactController.text,
                              doctorName: _selectedDoctor ?? "Not specified",
                              hospitalName:
                                  _selectedHospital ?? "Not specified",
                              appointmentDate: _dateController.text,
                              appointmentSlot:
                                  _selectedTimeSlot ?? "Not specified",
                              consultationFee: 500,
                            ),
                          ),
                        );
                      }
                    : null,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200, // More compact width
                    height: 40, // More compact height
                    decoration: BoxDecoration(
                      color: _areAllFieldsFilled()
                          ? Colors.blue
                          : Colors.grey[300],
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Schedule Appointment",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _areAllFieldsFilled()
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Inbox"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Ask AI"),
        ],
      ),
    );
  }
}
