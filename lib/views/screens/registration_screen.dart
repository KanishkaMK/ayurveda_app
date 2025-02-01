import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _whatsappNumber;
  String? _address;
  String? _location;
  String? _branch;
  String? _selectedTreatment;
  int _maleCount = 0;
  int _femaleCount = 0;
  double _totalAmount = 0;
  double _discountAmount = 0;
 // PaymentOption _selectedPaymentOption = PaymentOption.cash;
  double _advanceAmount = 0;

 // enum PaymentOption { cash, card, upi }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your full name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Whatsapp Number',
                    hintText: 'Enter your whatsapp number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your whatsapp number';
                    }
                    return null;
                  },
                  onSaved: (value) => _whatsappNumber = value,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter your address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) => _address = value,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _location,
                  onChanged: (newValue) {
                    setState(() => _location = newValue);
                  },
                  items: <String>['Location 1', 'Location 2', 'Location 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Location',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _branch,
                  onChanged: (newValue) {
                    setState(() => _branch = newValue);
                  },
                  items: <String>['Branch 1', 'Branch 2', 'Branch 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Branch',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a branch';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedTreatment,
                  onChanged: (newValue) {
                    setState(() => _selectedTreatment = newValue);
                  },
                  items: <String>['Treatment 1', 'Treatment 2', 'Treatment 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Treatments',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a treatment';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Text('Male:'),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_maleCount > 0) {
                                  _maleCount--;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text('$_maleCount'),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _maleCount++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Text('Female:'),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_femaleCount > 0) {
                                  _femaleCount--;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text('$_femaleCount'),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _femaleCount++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Total Amount',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _totalAmount = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Discount Amount',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _discountAmount = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    // Radio<PaymentOption>(
                    //   value: PaymentOption.cash,
                    //   groupValue: _selectedPaymentOption,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selectedPaymentOption = value!;
                    //     });
                    //   },
                    // ),
                    const Text('Cash'),
                    // Radio<PaymentOption>(
                    //   value: PaymentOption.card,
                    //   groupValue: _selectedPaymentOption,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selectedPaymentOption = value!;
                    //     });
                    //   },
                    // ),
                    const Text('Card'),
                    // Radio<PaymentOption>(
                    //   value: PaymentOption.upi,
                    //   groupValue: _selectedPaymentOption,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selectedPaymentOption = value!;
                    //     });
                    //   },
                    // ),
                    const Text('UPI'),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Advance Amount',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _advanceAmount = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                const SizedBox(height: 16),
                // Add Treatment Date and Time fields here
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Process the form data here
                      // ...
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}