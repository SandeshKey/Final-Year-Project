import 'package:dufuna/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(" Contact Seller"),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(PhosphorIcons.x))
              ],
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person_2_outlined),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Seller Name"),
                  Text("selleremail@gmail.com"),
                  Text("9812345678")
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.02,
                color: Colors.greenAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(PhosphorIcons.phone)),
                    Text("Contact")
                  ],
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                maxLines: 3,
                controller: _messageController,
                decoration: InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_emailController.text);
                  print(_fullNameController.text);
                  print(_phoneController.text);
                  print(_messageController.text);
                },
                child: Text('Submit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
