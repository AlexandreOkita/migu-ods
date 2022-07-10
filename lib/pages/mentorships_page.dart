import 'package:flutter/material.dart';
import 'package:migu/components/add_new_employee_button.dart';
import 'package:migu/components/employee_tile_list.dart';
import 'package:migu/components/mentor_mentorship_relation.dart';

class MentorshipsPage extends StatelessWidget {
  const MentorshipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: screen.height * 0.02, horizontal: screen.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "asset/logo2.png",
                      width: 200,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AddNewEmployeeButton(
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              child: PendingEmployees(),
            ),
            const Flexible(
              flex: 2,
              child: ActiveMentorships(),
            ),
          ],
        ),
      ),
    );
  }
}

class PendingEmployees extends StatelessWidget {
  const PendingEmployees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Funcionários Pendentes",
          style: theme.headline4,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Aguardando a resposta ao formulário de diversidade",
          style: theme.bodyText2,
        ),
        const SizedBox(
          height: 30,
        ),
        const EmployeeListTile(),
        const Divider(),
      ],
    );
  }
}

class ActiveMentorships extends StatelessWidget {
  const ActiveMentorships({Key? key}) : super(key: key);
  final relationList = const [
    MentorMentorshipRelation(),
    MentorMentorshipRelation(),
    MentorMentorshipRelation(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mentorias Ativas",
          style: theme.headline4,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Mentores",
              style: theme.bodyText2,
            ),
            Text(
              "Aprendizes",
              style: theme.bodyText2,
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return relationList[index];
            },
            padding: EdgeInsets.zero,
            itemCount: relationList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}
