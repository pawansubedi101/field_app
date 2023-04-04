// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class UserTicket {
    UserTicket({
        required this.ticketId,
        required this.taskName,
        required this.serviceType,
        required this.scheduleDateTime,
        required this.customerId,
        required this.issueDetails,
        required this.ticketType,
        required this.iid,
        required this.instrumentName,
        required this.customerName,
    });

    final String ticketId;
    final String taskName;
    final String serviceType;
    final String scheduleDateTime;
    final String customerId;
    final String issueDetails;
    final String ticketType;
    final String iid;
    final String instrumentName;
    final String customerName;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ticketId': ticketId,
      'taskName': taskName,
      'serviceType': serviceType,
      'scheduleDateTime': scheduleDateTime,
      'customerId': customerId,
      'issueDetails': issueDetails,
      'ticketType': ticketType,
      'iid': iid,
      'instrumentName': instrumentName,
      'customerName': customerName,
    };
  }

  factory UserTicket.fromMap(Map<String, dynamic> map) {
    return UserTicket(
      ticketId: map['ticket_id'],
      taskName: map['task_name'],
      serviceType: map['service_type'],
      scheduleDateTime: map['schedule_date_time'],
      customerId: map['customer_id'],
      issueDetails: map['issue_details'],
      ticketType: map['ticket_type'],
      iid: map['iid'],
      instrumentName: map['instrument_name'],
      customerName: map['customer_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTicket.fromJson(String source) => UserTicket.fromMap(json.decode(source) as Map<String, dynamic>);
}
