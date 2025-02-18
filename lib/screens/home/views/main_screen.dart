import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/data.dart';
import '../../../app_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200]
                      ),
                    ),
                    Icon(CupertinoIcons.person_fill,
                    color: Colors.grey[800]
                    )
                  ],
                ),
                SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome!",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.outline,
                    ),),
                    Text("John Doe"
                    ,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    ),
                  ]
                ),
              ],
            ),
                PopupMenuButton<int>(
                  icon: Icon(CupertinoIcons.settings),
                  onSelected: (value) {
                    if (value == 1) {
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.brightness_2, color: Theme.of(context).iconTheme.color),
                          SizedBox(width: 8),
                          Text("Toggle Light/Dark Mode"),
                        ],
                      ),
                    ),
                  ],
                ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width:  MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.tertiary,
              ],
              transform: const GradientRotation(pi/4),
               ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
              blurRadius: 4,
              color: Colors.grey.shade300,
              offset: const Offset(5, 5),
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Total Balance',
              style:TextStyle(fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold)
              ),
              const SizedBox(height:12),
              const Text ('\$4,800.00',
              style:TextStyle(fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            color:Colors.white30,
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Icon(CupertinoIcons.arrow_down,
                            size: 12,
                            color: Colors.greenAccent),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Income',
                             style:TextStyle(fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                             Text ('\$2,500.00',
                            style:TextStyle(fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                     Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            color:Colors.white30,
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Icon(CupertinoIcons.arrow_down,
                            size: 12,
                            color: Colors.red),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Expenses',
                             style:TextStyle(fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                             Text ('\$800.00',
                            style:TextStyle(fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                          ],
                        ),
                  ]
                ),
                  ]
                ),

              )
            ],
          )
        ),
        SizedBox(height: 40),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Transactions',
            style:TextStyle(fontSize: 16,
            color:Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {

              },
            
            child: Text('',
            style:TextStyle(fontSize: 14,
            color:Theme.of(context).colorScheme.outline,
            fontWeight: FontWeight.w400
            ),
            ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
        child:
        ListView.builder(
          itemCount: transactionsData.length,
          itemBuilder: (context, int i){
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width:50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: transactionsData[i]['color'],
                                  shape: BoxShape.circle
                                ),
                              ),
                              (transactionsData[i]['icon']),
                            ],
                          ),
                          SizedBox(width: 12,),
                      Column(
                                      crossAxisAlignment: CrossAxisAlignment.start, 
                                      children: [ 
                                        Text(transactionsData[i]['name'],
                                            style: TextStyle( 
                                                fontSize: 14,
                                                color: Theme.of(context).colorScheme.onSurface,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(height: 4), 
                                        Text(transactionsData[i]['description'] ?? "No Description",
                                            style: TextStyle(
                                                fontSize: 12, 
                                                color: Theme.of(context).colorScheme.outline, 
                                                fontWeight: FontWeight.w400)
                                                ),
                                      ], 
                                    ), 
                        ],
                        ),
                             Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                            Text(transactionsData[i]['totalAmount'],
                          style: TextStyle(
                          fontSize: 14,
                          color:Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w400
                          )
                          ),
                          Text(transactionsData[i]['date'],
                          style: TextStyle(
                          fontSize: 14,
                          color:Theme.of(context).colorScheme.outline,
                          fontWeight: FontWeight.w400
                          )
                          )
                          ],
                          )
                    ],
                  ),
                )
              ),
            );
          }
        ),
        ),
      ],
      ),
      ),
    );
  }
}