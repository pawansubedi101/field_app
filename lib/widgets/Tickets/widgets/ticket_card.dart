import 'package:auto_size_text/auto_size_text.dart';
import 'package:field_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    Key? key,
    required this.color,
    required this.onpress,
    required this.customerName,
    required this.serviceType,
    required this.ticketType,
    required this.instrumentName,
  }) : super(key: key);

  final Color color;
  final VoidCallback onpress;
  final String customerName;
  final String serviceType;
  final String ticketType;
  final String instrumentName;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.white30,
      borderRadius: BorderRadius.circular(12),
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromARGB(255, 248, 244, 244),
              )),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: instrumentName.isEmpty ? 30 : 15, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade50,
                          radius: 15,
                          child: const Icon(
                            Icons.person,
                            size: 20,
                            // color: Color.fromARGB(255, 62, 34, 139),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: AutoSizeText(
                              customerName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 62, 34, 139)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    instrumentName.isEmpty
                        ? const SizedBox()
                        : RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Service Type :  ',
                              style: Theme.of(context).textTheme.titleLarge,
                              children: [
                                TextSpan(
                                  text: instrumentName,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Chip(
                      backgroundColor: (ticketType == 'today')
                          ? primaryColor
                          : (ticketType == 'urgent')
                              ? Colors.red.shade900
                              : Colors.amber,
                      label: Text(ticketType,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: onpress,
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(8),
                        clipBehavior: Clip.antiAlias,
                        shadowColor: Colors.black26,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [color, color.withOpacity(0.4)]),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "View Details",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              Positioned(
                  right: -30,
                  top: -30,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                  ))
            ],
          )),
    );
  }
}
