import 'dart:convert';

import 'tickets.dart';

class TicketCollection {
  TicketCollection({
    required this.tickets,
    required this.message,
  });

  final Tickets tickets;
  final String message;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tickets': tickets.toMap(),
      'message': message,
    };
  }

  factory TicketCollection.fromMap(Map<String, dynamic> map) {
    return TicketCollection(
      tickets: Tickets.fromMap(map['tickets']),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketCollection.fromJson(String source) =>
      TicketCollection.fromMap(json.decode(source) as Map<String, dynamic>);
}
