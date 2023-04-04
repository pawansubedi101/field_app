// import 'package:flutter/material.dart';

// import 'custom_button.dart';

// Future<T?> showSuccessDialog<T>(BuildContext context, String titleText,
//     String subtitleText, VoidCallback onContinue) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Stack(children: [
//           // Background widgets
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Center(
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         Text(titleText,
//                             style: Theme.of(context).textTheme.titleLarge),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           subtitleText,
//                           style: Theme.of(context).textTheme.bodyText2,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         CustomButton(
//                             onpress: onContinue, child: const Text("Continue")),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           // Positioned card
//           Positioned(
//               top: MediaQuery.of(context).size.height * 0.25,
//               left: MediaQuery.of(context).size.width * 0.2,
//               right: MediaQuery.of(context).size.width * 0.2,
//               child: const CircleAvatar(
//                 radius: 35,
//                 backgroundColor: Colors.white,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.green,
//                   radius: 28,
//                   child: Icon(
//                     Icons.check,
//                     size: 30,
//                     color: Colors.white,
//                   ),
//                 ),
//               ))
//         ]),
//       );
//     },
//   );
// }
