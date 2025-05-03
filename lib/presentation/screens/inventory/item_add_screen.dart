import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:l_mobilesales_mini/data/models/product_model.dart';
import 'package:l_mobilesales_mini/presentation/widgets/specific/image_picker.dart';

class ItemAddScreen extends StatefulWidget {
  const ItemAddScreen({Key? key}) : super(key: key);

  @override
  _ItemAddScreenState createState() => _ItemAddScreenState();
}

class _ItemAddScreenState extends State<ItemAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategory;
  String? _imageUrl;

  final List<String> _categories = ['Books', 'Electronics', 'Uniforms', 'Other'];

  bool _isSubmitting = false;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    if (_imageUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await FirebaseFirestore.instance.collection('inventory_items').add({
        'name': _itemNameController.text.trim(),
        'quantity': int.tryParse(_quantityController.text) ?? 0,
        'description': _descriptionController.text.trim(),
        'category': _selectedCategory ?? 'Uncategorized',
        'imageUrl': _imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item added successfully!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding item: $e')),
      );
    }

    setState(() => _isSubmitting = false);
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ImagePickerWidget(
                  onImagePicked: (url) {
                    setState(() {
                      _imageUrl = url;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _itemNameController,
                  decoration: const InputDecoration(labelText: 'Item Name'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter item name' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter quantity' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(cat),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() => _selectedCategory = value);
                  },
                  decoration: const InputDecoration(labelText: 'Category'),
                ),
                const SizedBox(height: 24),
                _isSubmitting
                    ? const CircularProgressIndicator()
                    : ElevatedButton.icon(
                        icon: const Icon(Icons.check),
                        label: const Text('Submit'),
                        onPressed: _submitForm,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

