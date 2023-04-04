import 'package:field_app/widgets/Tickets/widgets/model_form.dart';
import 'package:field_app/widgets/common/audio_player.dart';
import 'package:flutter/material.dart';

class InvestigationForm extends StatefulWidget {
  const InvestigationForm({super.key});

  @override
  State<InvestigationForm> createState() => _InvestigationFormState();
}

class _InvestigationFormState extends State<InvestigationForm> {
  String audioUrl =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MultiPCR BioFire"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aarogya Nilayam Diagnostic",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Issue Details:",
                    ),
                    const Text(
                      "Service Type: others",
                    ),
                    const Text(
                      "Manufacturer: BioMérieux",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AudioPlayerWidget(url: audioUrl),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const ModelForm();
                          },
                        );
                      },
                      child: Material(
                        elevation: 5,
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
                                "Preliminary investigations",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
