// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
//
//
//
// Widget title(String text){
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 8.0),
//     child: Text("$text",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(
//         0xFF363537)),),
//   );
// }
//
// Widget title2B(String text){
//   return Text("$text",
//     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Color(
//         0xFF363537)),);
// }
//
// Widget smallestFont(String text){
//   return Text("$text",
//     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(
//         0xFF707070)),);
// }
//
// Widget smallestFont2B(String text){
//   return Text("$text",style:TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),);
// }
//
// Widget appBaretitle(String text){
//   return Text("$text",style:TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),);
// }
//
// Widget cardText(String text){
//   return Text("$text",style:TextStyle(fontSize: 14,color: Color(0xFF363537)),);
// }
//
// Widget canceledButton( String text, double Height,double Width){
//   return Container(
//     height:Height,
//     width: Width,
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: Color(0xFFF2F5F7),
//         border: Border.all(
//           color: Color(0xFFF5504C),
//           width: 0.5,
//         )
//
//       //color: Color(0xFFF5504C),
//
//     ),
//     child: Text("$text",style: TextStyle(fontSize: 16,color: Color(0xFFF5504C),fontWeight: FontWeight.bold),),
//   );
// }
//
// Widget acceptButton( String text, double Height,double Width){
//   return Container(
//     height:Height,
//     width: Width,
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Color(0xFF4DE671),
//
//
//       //color: Color(0xFFF5504C),
//
//     ),
//     child: Text("$text",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
//   );
// }
//
// /*accepAlert(context){
//
//   Alert(
//       context: context,
//       image: Image.asset("assets/images/Group 114.png",
//       height: 48,
//       width: 48,),
//       content: Column(
//         children: <Widget>[
//           Text("Choose Time",
//               style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
//           Text("Select which driver you want to",
//               style:TextStyle(color: Colors.black87,fontSize: 16,)),
//           Text("assign to this order",
//               style:TextStyle(color: Colors.black87,fontSize: 16,)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width:20,
//               ),
//               Text("50 : 00",
//                   style:TextStyle(color: Colors.black87,fontSize: 48,fontWeight: FontWeight.bold)),
//               Text(" Min",
//                   style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ],
//       ),
//       buttons: [
//         DialogButton(
//           onPressed: () {
//            /* Alert(
//                 context: context,
//                 image: Image.asset("assets/images/Driver.png",
//                   width: 48,
//                   height: 48,),
//                 content: Column(
//                   children: <Widget>[
//                     Text("Choose Driver",
//                         style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
//                     Text("Select which driver you want to",
//                         style:TextStyle(color: Colors.black87,fontSize: 16,)),
//                     Text("assign to this order",
//                         style:TextStyle(color: Colors.black87,fontSize: 16,)),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 16.0),
//                       child: TextFormField(
//                         minLines: 4,
//                         maxLines: 4,
//                         decoration:InputDecoration(
//                           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(10),),
//                             borderSide: BorderSide(
//                               color: Color(0xFFF2F5F7),
//                               width: 1.0,),),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                               color: Color(0xFFF2F5F7),
//                               width: 2.0,
//                             ),),
//                           fillColor: Color(0xFFF2F5F7),
//                           hintText: 'type here...',
//                           hintStyle: TextStyle(color:Colors.grey,fontSize:15,),
//
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//
//                       ],
//                     ),
//
//                   ],
//                 ),
//                 buttons: [
//                   DialogButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Text("Later",style: TextStyle(color: Color.fromRGBO(245, 80, 76, 1.0),),),
//                     color: Color(0xFFF2F5F7),
//
//                   ),
//                   DialogButton(
//
//                     onPressed: () => Navigator.pop(context),
//                     child: Text("Save",style: TextStyle(color: Colors.white),),
//                     color: Color.fromRGBO(245, 80, 76, 1.0),
//                   ),
//                 ]).show();*/
//             showDialog(context: context, builder: (BuildContext context)
//           {
//             return Center(
//               child: AlertDialog(
//                 content: Container(
//                   height: 300,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset("assets/images/Driver.png"),
//                       Text("Choose Driver",
//                           style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
//                       Text("Select which driver you want to",
//                           style:TextStyle(color: Colors.black87,fontSize: 16,)),
//                       Text("assign to this order",
//                           style:TextStyle(color: Colors.black87,fontSize: 16,)),
//                       DropdownButtonHideUnderline(
//                         child: DropdownButton2(
//                           isExpanded: true,
//                           hint: Row(
//                             children: const [
//                               Icon(
//                                 Icons.list,
//                                 size: 16,
//                                 color: Colors.yellow,
//                               ),
//                               SizedBox(
//                                 width: 4,
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   'Select Item',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.yellow,
//                                   ),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           items: items
//                               .map((item) => DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ))
//                               .toList(),
//                           value: selectedValue,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedValue = value as String;
//                             });
//                           },
//                           buttonStyleData: ButtonStyleData(
//                             height: 50,
//                             width: 160,
//                             padding: const EdgeInsets.only(left: 14, right: 14),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(14),
//                               border: Border.all(
//                                 color: Colors.black26,
//                               ),
//                               color: Colors.redAccent,
//                             ),
//                             elevation: 2,
//                           ),
//                           iconStyleData: const IconStyleData(
//                             icon: Icon(
//                               Icons.arrow_forward_ios_outlined,
//                             ),
//                             iconSize: 14,
//                             iconEnabledColor: Colors.yellow,
//                             iconDisabledColor: Colors.grey,
//                           ),
//                           dropdownStyleData: DropdownStyleData(
//                               maxHeight: 200,
//                               width: 200,
//                               padding: null,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(14),
//                                 color: Colors.redAccent,
//                               ),
//                               elevation: 8,
//                               offset: const Offset(-20, 0),
//                               scrollbarTheme: ScrollbarThemeData(
//                                 radius: const Radius.circular(40),
//                                 thickness: MaterialStateProperty.all(6),
//                                 thumbVisibility: MaterialStateProperty.all(true),
//                               )),
//                           menuItemStyleData: const MenuItemStyleData(
//                             height: 40,
//                             padding: EdgeInsets.only(left: 14, right: 14),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           canceledButton("Later", 48, 90),
//                             Container(
//                               height:48,
//                               width: 135,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 color: Color(0xFFF5504C),
//
//                               ),
//                               child: Text("save",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
//                   ),
//
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           });
//           },
//           child: Text("Save",style: TextStyle(color: Colors.white),),
//           color: Color.fromRGBO(245, 80, 76, 1.0),
//         ),
//       ]).show();
// }*/
//
// declineAlert(context,setState){
//   bool? check1 = false;
//
//   Alert(
//       context: context,
//       image: Image.asset("assets/images/cancel.png",
//       width: 48,
//       height: 48,),
//       content: Column(
//         children: <Widget>[
//           Text("Cancel order :(",
//               style:TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.bold)),
//           Text("Type reason for cancelation",
//               style:TextStyle(color: Colors.black87,fontSize: 16,)),
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: TextFormField(
//               minLines: 4,
//               maxLines: 4,
//               decoration:InputDecoration(
//                 contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(10),),
//                   borderSide: BorderSide(
//                     color: Color(0xFFF2F5F7),
//                     width: 1.0,),),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     color: Color(0xFFF2F5F7),
//                     width: 2.0,
//                   ),),
//                 fillColor: Color(0xFFF2F5F7),
//                 hintText: 'type here...',
//                 hintStyle: TextStyle(color:Colors.grey,fontSize:15,),
//
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               Checkbox(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   activeColor: Color.fromRGBO(245, 80, 76, 1.0),
//                   value: check1,
//                   onChanged: (bool? value){
//                     setState(() {
//                       check1 = value;
//                     });
//                   }
//               ),
//             ],
//           ),
//
//         ],
//       ),
//       buttons: [
//         DialogButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text("Save",style: TextStyle(color: Colors.white),),
//           color: Color.fromRGBO(245, 80, 76, 1.0),
//         ),
//       ]).show();
// }
//
//
//
