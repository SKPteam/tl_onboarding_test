import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_firebase_test/home_page/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  bool _isExpanded = false;

  void _toggleButtons() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _pages = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isExpanded) _toggleButtons();
      },
      child: Scaffold(
        backgroundColor:
            _isExpanded ? const Color(0xffFBFBFB) : const Color(0xffFBFBFB),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          color:
              _isExpanded ? const Color(0x00000fff) : const Color(0xffFFFFFF),
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _selectedIndex == 0 ? Iconsax.home_15 : Iconsax.home,
                      color: _selectedIndex == 0
                          ? const Color(0xff388D4E)
                          : const Color(0xff828282),
                      size: 22,
                    ),
                    onPressed: () => _onItemTapped(0),
                  ),
                  Text("Home",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _selectedIndex == 0
                            ? const Color(0xff388D4E)
                            : const Color(0xff828282),
                      )),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _selectedIndex == 1
                          ? Iconsax.book_saved5
                          : Iconsax.book_1,
                      color: _selectedIndex == 1
                          ? const Color(0xff388D4E)
                          : const Color(0xff828282),
                      size: 22,
                    ),
                    onPressed: () => _onItemTapped(1),
                  ),
                  Text("Journal",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _selectedIndex == 1
                            ? const Color(0xff388D4E)
                            : const Color(0xff828282),
                      )),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _selectedIndex == 2
                          ? Iconsax.profile_add5
                          : Iconsax.profile_add,
                      color: _selectedIndex == 2
                          ? const Color(0xff388D4E)
                          : const Color(0xff828282),
                      size: 22,
                    ),
                    onPressed: () => _onItemTapped(2),
                  ),
                  Text("Me",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _selectedIndex == 2
                            ? const Color(0xff388D4E)
                            : const Color(0xff828282),
                      )),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _selectedIndex == 3 ? Iconsax.menu5 : Iconsax.menu,
                      color: _selectedIndex == 3
                          ? const Color(0xff388D4E)
                          : const Color(0xff828282),
                      size: 22,
                    ),
                    onPressed: () => _onItemTapped(3),
                  ),
                  Text("More",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _selectedIndex == 3
                            ? const Color(0xff388D4E)
                            : const Color(0xff828282),
                      )),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (_isExpanded)
              Padding(
                padding: EdgeInsets.only(
                  bottom: 200.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(22),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      icon: const Icon(Iconsax.profile_2user,
                          color: Color(0xff555555)),
                      label: const Text(
                        'Schedule a session',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.w400,
                            color: Color(0xff555555)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(25),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      icon: const Icon(Iconsax.message_add,
                          color: Color(0xff555555)),
                      label: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'JosefinSans',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff555555)),
                          children: [
                            WidgetSpan(
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  colors: [
                                    Color(0xff555555),
                                    Color(0xff555555)
                                  ], // Adjust colors as needed
                                ).createShader(bounds),
                                child: const Text(
                                  "Speak with",
                                  style: TextStyle(
                                    fontFamily: 'JosefinSans',

                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Colors.white, // Required for ShaderMask
                                  ),
                                ),
                              ),
                            ),
                            WidgetSpan(
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Colors.green
                                  ], // Adjust colors as needed
                                ).createShader(bounds),
                                child: const Text(
                                  " Mira",
                                  style: TextStyle(
                                    fontFamily: 'JosefinSans',

                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Colors.white, // Required for ShaderMask
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            FloatingActionButton(
              backgroundColor: _isExpanded
                  ? const Color(0xff388D4E)
                  : const Color(0xffFFFFFF),
              shape: const CircleBorder(),
              onPressed: _toggleButtons,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    _isExpanded ? Iconsax.messages_1 : Iconsax.messages_1,
                    color: _isExpanded
                        ? const Color(0xffFFFFFF)
                        : const Color(0xff828282),
                    size: 22,
                  ),
                  Text("Chats",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _isExpanded
                            ? const Color(0xffFFFFFF)
                            : const Color(0xff828282),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String text) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: _toggleButtons,
      icon: Icon(icon, color: Colors.black),
      label: Text(text),
    );
  }
}
