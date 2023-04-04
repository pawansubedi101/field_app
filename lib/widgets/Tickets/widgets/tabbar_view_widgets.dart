import 'package:field_app/constants/global_variables.dart';
import 'package:field_app/modals/user_progress_ticket.dart';
import 'package:field_app/modals/user_solved_ticket.dart';
import 'package:field_app/modals/user_ticket.dart';
import 'package:field_app/modals/user_verified_ticket.dart';
import 'package:field_app/widgets/Tickets/widgets/ticket_card.dart';
import 'package:flutter/material.dart';

import '../../../screens/ticket_detail_screen.dart';

class SolvedTicketWidget extends StatelessWidget {
  const SolvedTicketWidget({
    Key? key,
    required this.userSolvedTickets,
    required this.username,
    required this.password,
  }) : super(key: key);
  final String username;
  final String password;

  final List<UserSolvedTicket> userSolvedTickets;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Solved Tickets",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: userSolvedTickets.isNotEmpty
              ? GridView.builder(
                  itemCount: userSolvedTickets.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 1,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    final UserSolvedTicket solvedTicket =
                        userSolvedTickets[index];
                    return TicketCard(
                      color: Colors.green,
                      customerName: solvedTicket.customerName,
                      instrumentName: solvedTicket.instrumentName!,
                      serviceType: solvedTicket.serviceType,
                      ticketType: solvedTicket.ticketType,
                      onpress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return TicketDetailScreen(
                              ticketId: solvedTicket.ticketId,
                              username: username,
                              password: password,
                            );
                          },
                        ));
                      },
                    );
                  },
                )
              : const Center(child: Text("There are no solved tickets.")),
        ),
      ],
    );
  }
}

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({
    Key? key,
    required this.userVerifiedTickets,
    required this.username,
    required this.password,
  }) : super(key: key);

  final List<UserVerifiedTicket> userVerifiedTickets;
  final String username;
  final String password;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Verified Tickets",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: userVerifiedTickets.isNotEmpty
              ? GridView.builder(
                  itemCount: userVerifiedTickets.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 1,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    final UserVerifiedTicket verifiedTicket =
                        userVerifiedTickets[index];
                    return TicketCard(
                      color: Colors.green,
                      customerName: verifiedTicket.customerName,
                      instrumentName: verifiedTicket.instrumentName!,
                      serviceType: verifiedTicket.serviceType,
                      ticketType: verifiedTicket.ticketType,
                      onpress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return TicketDetailScreen(
                              ticketId: verifiedTicket.ticketId,
                              username: username,
                              password: password,
                            );
                          },
                        ));
                      },
                    );
                  },
                )
              : const Center(child: Text("There are no verified tickets.")),
        ),
      ],
    );
  }
}

class InProgressWidget extends StatelessWidget {
  const InProgressWidget({
    Key? key,
    required this.userName,
    required this.password,
    required this.userInprogressTickets,
  }) : super(key: key);
  final String userName;
  final String password;
  final List<UserInprogressTicket> userInprogressTickets;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                "In Progress Tickets",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: userInprogressTickets.isNotEmpty
              ? GridView.builder(
                  itemCount: userInprogressTickets.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    final UserInprogressTicket inprogressTicket =
                        userInprogressTickets[index];
                    return TicketCard(
                        color: (inprogressTicket.ticketType == 'today')
                            ? primaryColor
                            : (inprogressTicket.ticketType == 'urgent')
                                ? Colors.red.shade900
                                : Colors.amber.shade700,
                        customerName: inprogressTicket.customerName,
                        instrumentName: inprogressTicket.instrumentName!,
                        ticketType: inprogressTicket.ticketType,
                        serviceType: inprogressTicket.serviceType,
                        onpress: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return TicketDetailScreen(
                              ticketId: inprogressTicket.ticketId,
                              username: userName,
                              password: password,
                            );
                          }));
                        });
                  },
                )
              : const Text("There are no in procgress tickets"),
        ),
      ],
    );
  }
}

class UserTicketWidget extends StatelessWidget {
  const UserTicketWidget({
    Key? key,
    required this.userName,
    required this.password,
    required this.userTickets,
  }) : super(key: key);
  final List<UserTicket> userTickets;
  final String userName;
  final String password;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(
                "User Tickets",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: userTickets.isNotEmpty
              ? GridView.builder(
                  itemCount: userTickets.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    final UserTicket userTicket = userTickets[index];
                    return TicketCard(
                      color: (userTicket.ticketType == 'today')
                          ? primaryColor
                          : (userTicket.ticketType == 'urgent')
                              ? Colors.red.shade900
                              : Colors.amber,
                      customerName: userTicket.customerName,
                      instrumentName: userTicket.instrumentName,
                      serviceType: userTicket.serviceType,
                      ticketType: userTicket.ticketType,
                      onpress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return TicketDetailScreen(
                              ticketId: userTicket.ticketId,
                              username: userName,
                              password: password,
                            );
                          },
                        ));
                      },
                    );
                  },
                )
              : const Text("There are no new tickets"),
        ),
      ],
    );
  }
}
