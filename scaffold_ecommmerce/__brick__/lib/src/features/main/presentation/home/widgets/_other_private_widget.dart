/// Private widgets that are belong to a screen widget
/// (in this case [HomeScreen])
/// and will not be used in other places should marked as privated

part of '../home_screen.dart';

class _OtherPrivateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
