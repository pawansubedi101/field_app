import 'dart:convert';

import 'package:field_app/widgets/Tickets/widgets/model_form.dart';
import 'package:field_app/widgets/common/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TicketDetailScreen extends StatefulWidget {
  const TicketDetailScreen(
      {super.key,
      required this.ticketId,
      required this.username,
      required this.password});
  final String ticketId;
  final String username;
  final String password;

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _averageController = TextEditingController();
  final TextEditingController _nearthController = TextEditingController();
  final TextEditingController _neutralController = TextEditingController();
  final TextEditingController _voltageController = TextEditingController();
  final TextEditingController _learthController = TextEditingController();

  String _acOption = "Yes";
  String _upsOption = "Normal";
  String _voltageOption = "Yes";
  String _plugOption = "Two pin";
  String ticketDetail = '';
  String audioUrl =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  Future<void> fetchData() async {
    String bearerToken = 'pratik';
    final url =
        Uri.parse('https://fieldapp.axismeditech.com.np/api/Mobileapp/2');

    final requestBody = {'ticket_id': widget.ticketId};

    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $bearerToken',
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: requestBody,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("========================");

        print(data.toString());
        setState(() {
          ticketDetail = data.toString();
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 250, 248),
      appBar: AppBar(
        title: const Text("MultiPCR BioFire"),
      ),
      body: ticketDetail.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  Card(
                      shadowColor: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.ticketId),
                            Text(widget.username),
                            Text(widget.password),
                          ],
                        ),
                      )),
                  Card(
                    shadowColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AudioPlayerWidget(url: audioUrl),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 50),
                                    child: AlertDialog(
                                      alignment: Alignment.center,
                                      contentPadding: const EdgeInsets.all(0),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                                "Preliminary Investigations",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600)),
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
                                                padding:
                                                    const EdgeInsets.all(20),
                                                // mainAxisSize: MainAxisSize.min,
                                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  const Text("AC"),
                                                  DropdownButtonFormField<
                                                      String>(
                                                    decoration:
                                                        const InputDecoration(
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelText: 'Yes',
                                                      border:
                                                          OutlineInputBorder(),
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
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please select an option';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  const Text("Types of UPS"),
                                                  DropdownButtonFormField<
                                                      String>(
                                                    decoration:
                                                        const InputDecoration(
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelText: 'Normal',
                                                      border:
                                                          OutlineInputBorder(),
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
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please select an option';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  const Text("Voltage stable?"),
                                                  DropdownButtonFormField<
                                                      String>(
                                                    decoration:
                                                        const InputDecoration(
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelText: 'Yes',
                                                      border:
                                                          OutlineInputBorder(),
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
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please select an option';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  const Text("Types of Plug"),
                                                  DropdownButtonFormField<
                                                      String>(
                                                    decoration:
                                                        const InputDecoration(
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .never,
                                                      labelText: 'Two pin',
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                    value: _plugOption,
                                                    items: const [
                                                      DropdownMenuItem(
                                                        value: 'Two pin',
                                                        child: Text('Two pin'),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: 'Three pin',
                                                        child:
                                                            Text('Three pin'),
                                                      ),
                                                    ],
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _plugOption = value!;
                                                      });
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please select an option';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  CustomTextFormField(
                                                    controller:
                                                        _averageController,
                                                    labelText: "Average Sample",
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  CustomTextFormField(
                                                    controller:
                                                        _nearthController,
                                                    labelText:
                                                        "Neutral Earth value",
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  CustomTextFormField(
                                                    controller:
                                                        _neutralController,
                                                    labelText:
                                                        "Line Neutral Value",
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  CustomTextFormField(
                                                    controller:
                                                        _voltageController,
                                                    labelText: "Voltage Value",
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  CustomTextFormField(
                                                    controller:
                                                        _learthController,
                                                    labelText:
                                                        "Line Earth Value",
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
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      print(_averageController
                                                          .text);

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
                                                    decoration:
                                                        const BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Colors.green,
                                                            Colors.greenAccent
                                                          ]),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text(
                                                          "Submit",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2.0,
                                                        horizontal: 12),
                                                child: SizedBox(
                                                  height: 40,
                                                  width: double.infinity,
                                                  child: OutlinedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                },
                              );
                            },
                            child: Material(
                              elevation: 5,
                              shadowColor: Colors.black26,
                              child: Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.green,
                                    Colors.greenAccent
                                  ]),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Preliminary investigations",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Text(ticketDetail)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
