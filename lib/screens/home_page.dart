import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_test/models/user.dart';
import 'package:flutter_firebase_test/screens/chat_screen.dart';
import 'package:flutter_firebase_test/services/api.dart';
import 'package:flutter_firebase_test/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  User? user;
  HomePage({super.key, this.user});
  ValueNotifier<bool> openOptions = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  titleSection(),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: openOptions,
              builder: (context, isOpen, child) {
                return isOpen
                    ? Container(
                        color: Colors.black.withAlpha(70),
                        width: double.infinity,
                      )
                    : const SizedBox.shrink();
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
                valueListenable: openOptions,
                builder: (context, isOpen, child) {
                  return isOpen
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              floatingOptionButton(
                                  label: ["Schedule a session"]),
                              const SizedBox(height: 15),
                              floatingOptionButton(
                                  label: ["Speak with ", 'Mira'],
                                  isMira: true,
                                  onPressed: () async {
                                    try {
                                      await Api.speakWithMiraApi(user?.id ?? 0);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChatScreen()));
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(e.toString())));
                                    }
                                  }),
                              const SizedBox(height: 20),
                              floatingActionButton(),
                              const SizedBox(height: 45)
                            ],
                          ),
                        )
                      : const SizedBox.shrink();
                }),
          )
        ],
      ),
    );
  }

  ElevatedButton floatingOptionButton({
    List<String> label = const [],
    onPressed,
    isMira = false,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Colors.black26,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: onPressed ?? () {},
      icon: SvgPicture.asset(
        'assets/icons/${isMira ? "mira" : "schedule"}.svg',
        height: 21,
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label.first,
            style: TextStyle(color: dark),
          ),
          if (isMira)
            ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(colors: [
                  Color(0xFF388D4E),
                  Color(0xFF4FDFC2),
                  Color(0xFF3184D0)
                ]).createShader(
                  Rect.fromLTWH(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.srcIn,
              child: Text(label.last),
            ),
        ],
      ),
    );
  }

  //--------------------------------------------------------------------------------------------
  Row titleSection() {
    return Row(
      spacing: 20,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://s3-alpha-sig.figma.com/img/14ee/7633/e70dc79f0a6b5ee62c7a25817e5a05e0?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=c-LN9PgRz1yB8KHtNfqdaRrbKIn4TfCT1qnoxUN6BryR~0pen96RGiq-DenRvchlwxtxbVcjZLEEjWd49gqxDgRkGz-IgWqE2s9hNfu3xP7fLU7gH4nKshuqSeYNXDTp4EBhHp22aGNUl3pwtk68CvPhna~ppFEbocYdULXpThRtop9QTSbDkR899eNLY7pCJKCUDhviWtz5jiB2EHiCy3rnag7YzznIUZQNsmUhsb6LPrww6JCk237C4UM8KtufnA3dFaZKQnxTwgQ5-VWalGRD9I8V4x4RQn2MWbJ6lMyK69~dizLhzJqTSaJmpAliNyIzV9obwzpzy9ZxUkO66g__'),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Good morning,",
              style: TextStyle(fontSize: 19, color: dark),
            ),
            Text(
              user?.display_name ?? "~",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w600, color: dark),
            ),
          ],
        ))
      ],
    );
  }

  //--------------------------------------------------------------------------------------------
  BottomAppBar bottomNavBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      //? elevation shadow not showing, looks like it's a flutter error.
      elevation: 10,
      shadowColor: Colors.black,
      padding: EdgeInsets.zero,
      child: Row(
          children: ['Home', "Journal", "-", "Me", "More"]
              .map(
                (e) => e == '-'
                    ? const Spacer()
                    : Expanded(
                        child: GestureDetector(
                        onTap: () {
                          log('message');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/$e.svg'),
                            const SizedBox(height: 3),
                            Text(
                              e,
                              style: TextStyle(
                                  color: e.startsWith('H')
                                      ? dark
                                      : Colors.grey.shade600),
                            )
                          ],
                        ),
                      )),
              )
              .toList()),
    );
  }

  //--------------------------------------------------------------------------------------------
  Widget floatingActionButton() {
    //? The speed dial package doesn't work for the UI you provided.
    return ValueListenableBuilder(
        valueListenable: openOptions,
        builder: (context, isOpen, child) {
          return SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                openOptions.value = !openOptions.value;
              },
              backgroundColor: Colors.white,
              elevation: isOpen ? 0 : 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/chats_icon.svg',
                    height: 22,
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Chats",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
