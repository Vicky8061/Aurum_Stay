import 'dart:io';
import 'package:aurum_stay/model/villa_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/app_colors.dart';

class AddStayScreen extends StatefulWidget {
  const AddStayScreen({super.key});

  @override
  State<AddStayScreen> createState() => _AddStayScreenState();
}

class _AddStayScreenState extends State<AddStayScreen> {
  // Controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // Stay type
  String selectedType = 'Villa';
  final List<String> stayTypes = [
    'Villa',
    'Resort',
    'Apartment',
    'Hotel',
    'Cottage',
  ];

  // Image
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Pick Image from Gallery
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  // Submit Stay
  void submitStay() {
    if (_titleController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _locationController.text.isEmpty ||
        selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields and select an image'),
        ),
      );
      return;
    }

    // Create VillaModel instance (id can be generated in Firebase later)
    final villa = VillaModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      price: double.tryParse(_priceController.text.trim()) ?? 0,
      location: _locationController.text.trim(),
      type: selectedType,
      image: selectedImage!.path,
      rating: 0, // rating will be given by users
    );

    // TODO: Upload image to Firebase Storage & save villa data to Firestore

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Stay added successfully!')));

    // Clear fields
    _titleController.clear();
    _priceController.clear();
    _locationController.clear();
    setState(() {
      selectedImage = null;
      selectedType = stayTypes[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        title: const Text(
          'Add New Stay',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Image Picker
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white12,
                  border: Border.all(color: Colors.white38),
                ),
                child: selectedImage == null
                    ? const Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white54,
                          size: 50,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(selectedImage!, fit: BoxFit.cover),
                      ),
              ),
            ),
            const SizedBox(height: 16),

            // Title
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Stay Name',
                filled: true,
                fillColor: Colors.white12,
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Price
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price per night',
                filled: true,
                fillColor: Colors.white12,
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Location
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                filled: true,
                fillColor: Colors.white12,
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Stay Type
            DropdownButtonFormField<String>(
              value: selectedType,
              items: stayTypes
                  .map(
                    (type) => DropdownMenuItem(value: type, child: Text(type)),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedType = value;
                  });
                }
              },
              decoration: const InputDecoration(
                labelText: 'Stay Type',
                filled: true,
                fillColor: Colors.white12,
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
              ),
              dropdownColor: Colors.black87,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitStay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.goldText,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Add Stay',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
