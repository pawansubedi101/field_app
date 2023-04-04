// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class UserSolvedTicket {
    UserSolvedTicket({
        required this.ticketId,
        required this.taskName,
        required this.serviceType,
        this.customerId,
        required this.issueDetails,
        required this.ticketType,
        this.iid,
        this.id,
        this.instrumentId,
        this.companyId,
        this.version,
        this.resellerName,
        this.serialNo,
        this.warrenty,
        this.averageSample,
        this.installDate,
        this.otherDetails,
        this.instrumentName,
        required this.customerName,
    });

    final String ticketId;
    final String taskName;
    final String serviceType;
    final String? customerId;
    final String issueDetails;
    final String ticketType;
    final String? iid;
    final String? id;
    final String? instrumentId;
    final String? companyId;
    final String? version;
    final String? resellerName;
    final String? serialNo;
    final String? warrenty;
    final String? averageSample;
    final String? installDate;
    final String? otherDetails;
    final String? instrumentName;
    final String customerName;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ticketId': ticketId,
      'taskName': taskName,
      'serviceType': serviceType,
      'customerId': customerId,
      'issueDetails': issueDetails,
      'ticketType': ticketType,
      'iid': iid,
      'id': id,
      'instrumentId': instrumentId,
      'companyId': companyId,
      'version': version,
      'resellerName': resellerName,
      'serialNo': serialNo,
      'warrenty': warrenty,
      'averageSample': averageSample,
      'installDate': installDate,
      'otherDetails': otherDetails,
      'instrumentName': instrumentName,
      'customerName': customerName,
    };
  }

  factory UserSolvedTicket.fromMap(Map<String, dynamic> map) {
    return UserSolvedTicket(
      ticketId: map['ticket_id'] ,
      taskName: map['task_name'] ,
      serviceType: map['service_type'] ,
      customerId: map['customer_id'] ?? '',
      issueDetails: map['issue_details'] ,
      ticketType: map['ticket_type'],
      iid: map['iid'] ?? '',
      id: map['id'] ?? '',
      instrumentId: map['instrument_id'] ?? '',
      companyId: map['company_id'] ?? '',
      version: map['version'] ?? '',
      resellerName: map['reseller_name'] ?? '',
      serialNo: map['serial_no'] ?? '',
      warrenty: map['warrenty'] ?? '',
      averageSample: map['average_sample'] ?? '',
      installDate: map['install_date'] ?? '',
      otherDetails: map['other_details'] ?? '',
      instrumentName: map['instrument_name'] ?? '',
      customerName: map['customer_name'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSolvedTicket.fromJson(String source) => UserSolvedTicket.fromMap(json.decode(source) as Map<String, dynamic>);
}
