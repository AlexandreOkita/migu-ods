import 'package:flutter/material.dart';

class EmployeeListTile extends StatefulWidget {
  final String name;
  final String surname;
  final String area;
  final String email;
  final bool selected;
  final void Function()? onTap;
  const EmployeeListTile(
      {Key? key,
      this.selected = false,
      this.onTap,
      required this.name,
      required this.surname,
      required this.area,
      required this.email})
      : super(key: key);

  @override
  State<EmployeeListTile> createState() => _EmployeeListTileState();
}

class _EmployeeListTileState extends State<EmployeeListTile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      selected: widget.selected,
      onTap: widget.onTap,
      selectedTileColor: theme.primaryColor.withAlpha(40),
      title: Text(
        "${widget.name} ${widget.surname}",
        style: theme.textTheme.headline6,
      ),
      subtitle: Text(
        "${widget.email} | ${widget.area}",
        style: theme.textTheme.bodyText2,
      ),
      leading: Image.asset("asset/bear.png"),
    );
  }
}
