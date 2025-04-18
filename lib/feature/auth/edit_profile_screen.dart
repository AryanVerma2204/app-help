import 'package:flutter/material.dart';
import 'package:mental_health_app/utils/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedCountry = 'India';
  String selectedGender = 'Female';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorPalettes.darkOrangeColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Edit profile',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Full name", "Enter Full Name"),
              buildTextField("Nick name", "Enter Nick Name"),
              buildTextField("Email", "Enter Email Id"),
              buildTextField(
                "Phone number",
                "Enter Phone Number",
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: buildDropdownField(
                        "Country", ["India", "USA", "UK"], selectedCountry,
                        (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    }),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: buildDropdownField(
                        "Genre", ["Male", "Female", "Other"], selectedGender,
                        (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    }),
                  ),
                ],
              ),
              buildTextField("Address", "Enter Address"),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    String placeholder,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: fieldLabelStyle),
        SizedBox(height: 8),
        TextFormField(
          initialValue: placeholder,
          decoration: inputDecoration,
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildDropdownField(String label, List<String> items,
      String selectedItem, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: fieldLabelStyle),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: inputBoxDecoration,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedItem,
              isExpanded: true,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

final inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
);

final fieldLabelStyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black);

final inputBoxDecoration = BoxDecoration(
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(8),
);
