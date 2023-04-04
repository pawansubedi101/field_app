import 'dart:convert';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:field_app/constants/global_variables.dart';
import 'package:field_app/constants/utils.dart';
import 'package:field_app/modals/ticket_collection.dart';

import 'package:field_app/widgets/common/custom_appbar.dart';
import 'package:field_app/widgets/common/custom_drawer.dart';
import 'package:field_app/widgets/common/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;

import '../widgets/Tickets/widgets/tabbar_view_widgets.dart';
import '../widgets/common/sign_in_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.username,
      required this.password,
      required this.ticketId});
  static const String routeName = '/home-screen';

  final String username;
  final String password;
  final String ticketId;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _noteController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;
  bool isUserLoggedIn = false;
  late String _username;
  late String _password;
  late String userId;
  bool isLoading = true;
  late TabController _tabController;
  late TicketCollection ticketCollection;
  Future<void> makePostRequestWithBody() async {
    String bearerToken = 'pratik';
    final url =
        Uri.parse('https://fieldapp.axismeditech.com.np/api/Mobileapp/2');

    final requestBody = {
      'username': widget.username.toString(),
      'password': widget.password,
      'ticket_id': widget.ticketId
    };

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
        final decodedData = jsonDecode(response.body);

        final TicketCollection ticketCollections =
            TicketCollection.fromMap(decodedData);

        log("working");

        setState(() {
          userId = ticketCollections.tickets.userTickets.first.customerId;
          ticketCollection = ticketCollections;
          isLoading = false;
        });
      } else {
        log('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<bool> checkLoginStatus() async {
    final url =
        Uri.parse('https://fieldapp.axismeditech.com.np/api/Mobileapp/5');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // The user is logged in
      if (response.body.toLowerCase() == 'true') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  final List<Widget> tabs = [
    Container(
        height: 35,
        alignment: Alignment.center,
        child: const AutoSizeText("User")),
    Container(
        height: 35,
        alignment: Alignment.center,
        child: const AutoSizeText("Inprogress")),
    Container(
        height: 35,
        alignment: Alignment.center,
        child: const AutoSizeText("Verified")),
    Container(
        height: 35,
        alignment: Alignment.center,
        child: const AutoSizeText("Solved")),
  ];

  @override
  void initState() {
    makePostRequestWithBody();
    _tabController = TabController(length: 4, vsync: this);
    log(isUserLoggedIn.toString());
    setState(() {
      _username = widget.username;
      _password = widget.password;
    });
    super.initState();
  }

  @override
  void dispose() {
    _noteController.dispose();
    _noteController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(scaffoldKey: _scaffoldKey),
            Card(
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("${getGreetingText()} \nYadav Kumar Dhakal",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(
                      height: 10,
                    ),
                    !isUserLoggedIn
                        ? Row(
                            children: [
                              SignInButton(onpress: () {
                                showSignInAlertDialog(context);
                              }),
                            ],
                          )
                        : Row(
                            children: [
                              SignOutButton(
                                onpress: () {
                                  showSignOutAlertDialog(context);
                                },
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                child: Text("Tickets",
                    style: Theme.of(context).textTheme.headline6)),
            SizedBox(
              width: double.infinity,
              child: Material(
                // elevation: 10,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(50)),
                    child: TabBar(
                      controller: _tabController,
                      tabs: tabs,
                      isScrollable: true,
                      labelColor: Colors.white,
                      unselectedLabelColor:
                          Theme.of(context).indicatorColor.withOpacity(0.7),
                      indicatorColor: primaryColor,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.labelLarge,
                      splashBorderRadius: BorderRadius.circular(50),
                      indicatorWeight: 0,
                      indicator: BoxDecoration(
                          // color: primaryColor,
                          gradient: LinearGradient(
                              colors: [primaryColor, Colors.green.shade200]),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            !isLoading
                ? Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        UserTicketWidget(
                            userName: _username,
                            password: _password,
                            userTickets: ticketCollection.tickets.userTickets),
                        InProgressWidget(
                            userName: _username,
                            password: _password,
                            userInprogressTickets:
                                ticketCollection.tickets.userInprogressTickets),
                        VerifiedWidget(
                            username: _username,
                            password: _password,
                            userVerifiedTickets:
                                ticketCollection.tickets.userVerifiedTickets),
                        SolvedTicketWidget(
                            username: _username,
                            password: _password,
                            userSolvedTickets:
                                ticketCollection.tickets.userSolvedTickets),
                      ],
                    ),
                  )
                : const SpinKitFadingFour(
                    size: 60,
                    color: Colors.indigo,
                  )
          ],
        ),
      ),
    );
  }
}
