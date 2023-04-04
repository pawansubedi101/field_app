import 'dart:convert';

import 'package:field_app/modals/user_verified_ticket.dart';

import 'user_progress_ticket.dart';
import 'user_solved_ticket.dart';
import 'user_ticket.dart';

class Tickets {
  Tickets({
    required this.userTickets,
    required this.userInprogressTickets,
    required this.userSolvedTickets,
    required this.userVerifiedTickets,
  });

  final List<UserTicket> userTickets;
  final List<UserInprogressTicket> userInprogressTickets;
  final List<UserSolvedTicket> userSolvedTickets;
  final List<UserVerifiedTicket> userVerifiedTickets;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_tickets': userTickets.map((x) => x.toMap()).toList(),
      'user_inprogress_tickets':
          userInprogressTickets.map((x) => x.toMap()).toList(),
      'user_solvedTickets': userSolvedTickets.map((x) => x.toMap()).toList(),
      'user_verifiedTickets':
          userVerifiedTickets.map((x) => x.toMap()).toList(),
    };
  }

  factory Tickets.fromMap(Map<String, dynamic> map) {
    return Tickets(
      userTickets: List.from(
        (map['user_tickets']).map<UserTicket>(
          (x) => UserTicket.fromMap(x),
        ),
      ),
      userInprogressTickets: List.from(
        (map['user_inprogress_tickets']).map<UserInprogressTicket>(
          (x) => UserInprogressTicket.fromMap(x),
        ),
      ),
      userSolvedTickets: List.from(
        (map['user_solved_tickets']).map<UserSolvedTicket>(
          (x) => UserSolvedTicket.fromMap(x),
        ),
      ),
      userVerifiedTickets: List.from(
        (map['user_verified_tickets']).map<UserVerifiedTicket>(
          (x) => UserVerifiedTicket.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tickets.fromJson(String source) =>
      Tickets.fromMap(json.decode(source) as Map<String, dynamic>);
}
