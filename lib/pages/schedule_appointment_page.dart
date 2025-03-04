import 'package:flutter/material.dart';
import 'package:medicalshala/pages/payment_process_screen.dart';

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
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Patient's Name",
                  filled: true,
                  fillColor: const Color(0xFFE5F4FF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {
                  setState(() {}); // Update state to enable/disable button
                },
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        labelText: "Age",
                        filled: true,
                        fillColor: const Color(0xFFE5F4FF),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(
                            () {}); // Update state to enable/disable button
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
                      const Text("Male"),
                      Radio(
                        value: "Female",
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value as String?;
                          });
                        },
                      ),
                      const Text("Female"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              TextField(
                controller: _reasonController,
                maxLines: 2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE5F4FF),
                  labelText: "Reason for appointment",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {
                  setState(() {}); // Update state to enable/disable button
                },
              ),
              const SizedBox(height: 20),

              // Doctor Details Section
              const Text("Doctor Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              DropdownButtonFormField(
                value: _selectedDoctor,
                dropdownColor: const Color(0xFFE5F4FF),
                items: const [
                  DropdownMenuItem(value: "Dr. Smith", child: Text("Dr. Smith"))
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedDoctor = value as String?;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE5F4FF),
                  labelText: "Doctor's Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField(
                value: _selectedHospital,
                items: const [
                  DropdownMenuItem(
                      value: "City Hospital", child: Text("City Hospital"))
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedHospital = value as String?;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE5F4FF),
                  labelText: "Hospital's Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE5F4FF),
                        labelText: "dd/mm/yyyy",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        _selectDate(context); // Open date picker
                      },
                      onChanged: (value) {
                        setState(
                            () {}); // Update state to enable/disable button
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedTimeSlot,
                      items: const [
                        DropdownMenuItem(
                            value: "10:00 AM", child: Text("10:00 AM"))
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedTimeSlot = value as String?;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE5F4FF),
                        labelText: "Select Slot",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Contact Number Section
              const Text("Contact Number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              TextField(
                controller: _contactController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE5F4FF),
                  prefixIcon: const Icon(Icons.phone),
                  labelText: "+91 ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {}); // Update state to enable/disable button
                },
              ),
              const SizedBox(height: 20),

              // Support Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.blue),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Our support team is here to help with appointment scheduling. Reach out anytime for quick assistance!",
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.call, color: Colors.blue),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.chat, color: Colors.blue),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Schedule Appointment Button
              ElevatedButton(
                onPressed: _areAllFieldsFilled()
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
                              consultationFee:
                                  500, // Default value or you could make this dynamic
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _areAllFieldsFilled()
                      ? Colors.blue
                      : Colors.grey[300], // Change color based on validation
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Schedule Appointment"),
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
