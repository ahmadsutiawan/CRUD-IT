import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, constraints) {
      if (constraints.maxHeight > 700) {
        return TabletScreen();
      } else if (constraints.maxWidth >= 1100) {
        return DekstopScreen();
      } else {
        return MobileScreen();
      }
    });
  }
}
class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class DekstopScreen extends StatelessWidget {
  const DekstopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
