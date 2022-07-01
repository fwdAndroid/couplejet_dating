import 'package:couple_jet/ui/reusable/card_container.dart';
import 'package:couple_jet/ui/reusable/dotted_container.dart';
import 'package:couple_jet/ui/reusable/main_button.dart';
import 'package:couple_jet/ui/reusable/picture_container.dart';
import 'package:couple_jet/ui/reusable/title_text.dart';
import 'package:couple_jet/ui/reusable/top_app_bar.dart';
import 'package:couple_jet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthScale = MediaQuery.of(context).size.width / 414;
    final double heightScale = MediaQuery.of(context).size.height / 896;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        // app bar
        TopAppBar(
          onBackPress: () {
            Navigator.pop(context);
          },
          title: 'Create post',
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 18.0 * widthScale,
              right: 18 * widthScale,
              top: 20 * heightScale,
              bottom: 5 * heightScale),
          child: Row(
            children: [
              PictureContainer(
                image: 'images/dummy_profile3.png',
                onDelPress: () {},
              ),
              PictureContainer(
                image: 'images/dummy_profile.png',
                onDelPress: () {},
              ),
              DottedContainer(
                onPress: () {},
              )
            ],
          ),
        ),
        // email pwd container
        CardContainer(
          paddingVertical: 22,
          paddingHorizontal: 22,
          child: Column(
              children: [
                TitleText(title: 'Tell your story...'),
                SizedBox(height: 18*heightScale,),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(10*widthScale))
                  ),
                  child: TextField(
                    cursorColor: kTeal,
                    style: GoogleFonts.outfit(fontSize: 14 * widthScale),
                    maxLines: 6,
                    decoration: InputDecoration(
                      border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 27*heightScale,),
                MainButton(title: 'Post it! (- 1.000 diamonds)', onPress: (){})
              ]),
        ),
      ]),
    );
  }
}
