import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBFBFB),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xffFBFBFB),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.only(
            left: 15,
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/home.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good morning',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xff252525),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            const Text(
              'Chana',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xff252525),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 15,
            ),
            child: Icon(
              Iconsax.notification,
              size: 25,
              color: Color(0xff252525),
            ),
          ),
        ],
      ),
    );
  }
}
