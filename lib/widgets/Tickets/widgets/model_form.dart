import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ModelForm extends StatefulWidget {
  const ModelForm({Key? key}) : super(key: key);

  @override
  ModelFormState createState() => ModelFormState();
}

class ModelFormState extends State<ModelForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String _acOption = "Yes";
  String _upsOption = "Normal";
  String _voltageOption = "Yes";
  String _plugOption = "Two pin";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: AlertDialog(
        alignment: Alignment.center,
        contentPadding: const EdgeInsets.all(0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText("Preliminary Investigations",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              const Divider(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("AC"),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Yes',
                        border: OutlineInputBorder(),
                      ),
                      value: _acOption,
                      items: const [
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        DropdownMenuItem(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _acOption = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text("Types of UPS"),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Normal',
                        border: OutlineInputBorder(),
                      ),
                      value: _upsOption,
                      items: const [
                        DropdownMenuItem(
                          value: 'Normal',
                          child: Text('Normal'),
                        ),
                        DropdownMenuItem(
                          value: 'Online',
                          child: Text('Online'),
                        ),
                        DropdownMenuItem(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _upsOption = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text("Voltage stable?"),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Yes',
                        border: OutlineInputBorder(),
                      ),
                      value: _voltageOption,
                      items: const [
                        DropdownMenuItem(
                          value: 'Yes',
                          child: Text('Yes'),
                        ),
                        DropdownMenuItem(
                          value: 'No',
                          child: Text('No'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _voltageOption = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text("Types of Plug"),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Two pin',
                        border: OutlineInputBorder(),
                      ),
                      value: _plugOption,
                      items: const [
                        DropdownMenuItem(
                          value: 'Two pin',
                          child: Text('Two pin'),
                        ),
                        DropdownMenuItem(
                          value: 'Three pin',
                          child: Text('Three pin'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _plugOption = value!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: _controller,
                      labelText: "Average Sample",
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: _controller,
                      labelText: "Neutral Earth value",
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: _controller,
                      labelText: "Line Neutral Value",
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: _controller,
                      labelText: "Voltage Value",
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFormField(
                      controller: _controller,
                      labelText: "Line Earth Value",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    {
                      if (_formKey.currentState!.validate()) {
                        log(_controller.text);

                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Material(
                    elevation: 5,
                    clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.black26,
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.green, Colors.greenAccent]),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cencel"),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required TextEditingController controller,
    required this.labelText,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        return null;
      },
    );
  }
}
