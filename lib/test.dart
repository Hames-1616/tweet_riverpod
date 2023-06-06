import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_learning/constants/assets_constants.dart';

class desgin extends StatefulWidget {
  const desgin({super.key});

  @override
  State<desgin> createState() => _desginState();
}

class _desginState extends State<desgin> {
  @override
  Widget build(BuildContext context) {
    Icon i  =  Icon(Icons.add_box_outlined);
    Icon k = Icon(Icons.add_box_rounded);
    Icon ikon = i;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
        actions: [
          Container(
            padding:EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.share)))
        ],
      ),
      body: Column(
        // mainAxisAlignment:  MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(right: 50),
                width: 200,
                height: 250,
                child: Image.asset("assets/svgs/tweet.png")),

                 const Column(
                  children: [
                    Text("Category",style: TextStyle(color: Colors.white54),),
                    SizedBox(height: 5,),    
                    Text("Indoors",style: TextStyle(color: Colors.white),),
                    SizedBox(height: 10,),
                    Text("Size",style: TextStyle(color: Colors.white54),),
                    SizedBox(height: 5,),    
                    Text("Small",style: TextStyle(color: Colors.white),),
                    SizedBox(height: 10,),
                    Text("Plant",style: TextStyle(color: Colors.white54),),
                    SizedBox(height: 5,),    
                    Text("Tweeter",style: TextStyle(color: Colors.white),),

                  ],
                )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tweeter",style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){
                      setState(() {
                        ikon =Icon(Icons.add_box_rounded) ;
                        print("called");
                      });
                    }, icon: ikon)
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Text("hey there how are you hope you are doing well I'm sorry, but I'm unable to provide direct links to copyrighted materials such as PDFs of books. Sharing or distributing copyrighted content without proper authorization would be against OpenAI's use case policy. However, you can consider checking with your local library or educational institutions as they may have access to digital copies of the book through their subscriptions or databases. Additionally, you can explore online platforms and retailers that offer legal e-book purchases or rentals.Remember, it is important to respect the intellectual property rights of authors and publishers by obtaining books through legitimate means."))
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.sunny)),
                        const Text(
                         "SunLight"
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.water)),
                        const Text(
                         "1L/month"
                        ),
                        
                      ],
                      
                    ),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.light)),
                        const Text(
                         "29C - 40C"
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.place)),
                        const Text(
                         "30cm - 40cm"
                        )
                      ],
                    )
                  ],

                )
              ],
            ),
          )
          ],
      ),
    );
  }
}