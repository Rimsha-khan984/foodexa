import 'package:center_action_navbar/center_action_navbar.dart';
import 'package:flutter/material.dart';
import 'package:foodexa/splash/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foodexa/home/index.dart';

void main (){
  runApp(const foodApp());

}

class foodApp extends StatelessWidget {
  const foodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodexa',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: splashScreen(),
    );
  }
}

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {

  int selectedIndex=0;
  final pages=[
     home(),
    const Center(child: Text('Profile page'),),
    const Center(child: Text('Order page'),),
    const Center(child: Text('Favourite page'),)

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Foodexa",style: GoogleFonts.lobster(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black

            ),),
            SizedBox(height: 5,),
            Text("Order your favourite food!",style:GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600

            ) ,
            )
          ],


        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              right: 20
            ),

            child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person,color: Colors.white,),

              )

          ),
        ],

      ),
      body: pages[selectedIndex],

        bottomNavigationBar: CenterActionNavbar(

          currentIndex: selectedIndex,

          theme: CenterActionNavbarTheme(
            backgroundColor:Color.fromARGB(218, 4, 151, 9),
            selectedColor: Colors.white,
            unselectedColor: Colors.white70,
            centerActionBackgroundColor: Color.fromARGB(218, 4, 151, 9),
            centerActionForegroundColor: Colors.white,
          ),

          items: const [
            CenterActionNavbarItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              label: 'Home',
            ),
            CenterActionNavbarItem(
              icon: Icons.person_outline_outlined,
              activeIcon: Icons.person,
              label: 'Profile',
            ),
            CenterActionNavbarItem(
              icon: Icons.receipt_long_outlined,
              activeIcon: Icons.receipt
              ,
              label: 'Orders',
            ),
            CenterActionNavbarItem(
              icon: Icons.favorite_outline,
              activeIcon: Icons.favorite,
              label: 'Favourite',
            ),
          ],
          centerAction: const Icon(Icons.add,color: Colors.white,),
          onCenterActionTap: () {
            // Handle center action.
          },
          onTap: (index) {
            setState(() => selectedIndex = index);
          },




    ),
    );
  }
}





