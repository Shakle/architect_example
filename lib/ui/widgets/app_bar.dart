import 'package:architect_example/config/theme/colors.dart';
import 'package:architect_example/constants/texts.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return appBar();
  }

  AppBar appBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: restartButton(),
      actions: [
        descriptionIcon(),
      ],
    );
  }

  Widget descriptionIcon() {
    return PopupMenuButton(
      itemBuilder: (context) => const [
        PopupMenuItem(
          child: Text(appDescriptionText),
        ),
      ],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.brown.withOpacity(0.3)),
      ),
      tooltip: 'Application description',
      color: lightPeach,
      icon: const Icon(
        Icons.info_outlined,
        color: Colors.brown,
      ),
    );
  }

  Widget restartButton() {
    return IconButton(
        onPressed: () {},
        iconSize: 27,
        color: Colors.brown,
        tooltip: 'Restart game',
        icon: const Icon(Icons.restart_alt)
    );
  }

}
