// import 'package:calebrestaurant/widgets/custom_text.dart';
// import 'package:flutter/material.dart';

// class FoodItemWidget extends StatelessWidget {
  
//   const FoodItemWidget();

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // onTap: () {
//       //   Navigator.push(
//       //     context,
//       //     MaterialPageRoute(
//       //       builder: (context) => DetailScreen(food: food),
//       //     ),
//       //   );
//       //   Navigator.of(context).pushNamed(Routes.detail);
//       // },
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.30,
//         padding: EdgeInsets.all(6),
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 height: MediaQuery.of(context).size.height * 0.30,
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(color: Colors.white, offset: Offset(0, 0))
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30)),
//                 margin: EdgeInsets.all(4),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: TextWidget(
//                         text: "Veggie tomato mix",
//                         color: Colors.red,
//                         size: 22,
//                         fontweight: FontWeight.w600,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: TextWidget(
//                         text: "N1,900",
//                         color: Colors.red,
//                         size: 17,
//                         fontweight: FontWeight.bold,
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             CircleAvatar(
//               radius: 70,
//               backgroundImage: AssetImage(food!.image!),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// } 