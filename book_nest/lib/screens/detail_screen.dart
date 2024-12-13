// import 'package:book_nest/models/home.dart';
// import 'package:flutter/material.dart';

// class DetailScreen extends StatelessWidget {
//   final Home varHome;
//   const DetailScreen({super.key, required this.varHome});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               //--------------atas-------------
//               Stack(
//                 children: [
//                   //image uatama
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(16),
//                       child: Image.asset(
//                         varHome.imageAsset,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: 250,
//                       ),
//                     ),
//                   )
//                   // tombol back
//                   Container(
//                     margin: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.5),
//                       shape: BoxShape.circle
//                     ),
//                     child: IconButton(
//                       onPressed: () { 
//                       }, icon: const Icon(Icons.arrow_back)),
//                   )
//                 ],
//               )
//               //judul dibawahnya image utama
//               Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   // judul
//                   Text(
//                     varHome.judul,
//                   style: const TextStyle(
//                     fontSize: 20, FontWeight: FontWeight.bold),
                  
//                   ),
//                 ],
//               ),)
//               //--------------tengah-----------
//               //--------------bawah------------
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
