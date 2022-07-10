import 'package:flutter/material.dart';

class EmployeeListTile extends StatelessWidget {
  const EmployeeListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(
        "Nome e Sobrenome",
        style: theme.headline6,
      ),
      subtitle: Text(
        "nome@email | area",
        style: theme.bodyText2,
      ),
      leading: Image.asset("asset/bear.png"),
    );
  }
}
