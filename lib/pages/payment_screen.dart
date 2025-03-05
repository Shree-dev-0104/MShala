import 'package:flutter/material.dart';
import 'package:medicalshala/components/payment_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Wrap everything to make it scrollable
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context)
                .size
                .height, // Ensure minimum screen height
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Secure Your Payments\nSeamlessly',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Complete the transaction through our encrypted payment gateway to ensure maximum safety.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'BILLED TO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 16),
                const Text(
                  'PAYMENT METHOD',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PaymentMethodButton(
                      imagePath: 'assets/credit.png',
                      label: 'Credit Card',
                      isSelected: selectedPaymentMethod == 'credit_card',
                      onTap: () => setState(() {
                        selectedPaymentMethod = 'credit_card';
                      }),
                    ),
                    PaymentMethodButton(
                      imagePath: 'assets/india.png',
                      label: 'Bank Transfer',
                      isSelected: selectedPaymentMethod == 'bank_transfer',
                      onTap: () => setState(() {
                        selectedPaymentMethod = 'bank_transfer';
                      }),
                    ),
                    PaymentMethodButton(
                      imagePath: 'assets/upi.png',
                      label: 'UPI Payments',
                      isSelected: selectedPaymentMethod == 'upi',
                      onTap: () => setState(() {
                        selectedPaymentMethod = 'upi';
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                if (selectedPaymentMethod == 'credit_card') ...[
                  const Text(
                    'CREDIT CARD DETAILS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Card Number',
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'MM / YY',
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'CVC',
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          height:
                              45, // Adjust height to make it more rectangular
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                                6), // Less rounded for a rectangular shape
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Cancel',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Proceed to pay logic
                        },
                        child: Container(
                          height: 45, // Adjust height to make it more compact
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(
                                6), // Less rounded for a rectangular shape
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Proceed to Pay',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 16), // Extra spacing for bottom navigation
              ],
            ),
          ),
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
}
