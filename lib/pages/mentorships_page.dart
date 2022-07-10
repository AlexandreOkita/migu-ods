// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:migu/components/add_new_employee_button.dart';
import 'package:migu/components/employee_tile_list.dart';
import 'package:migu/components/mentor_mentorship_relation.dart';
import 'package:collection/collection.dart';
import 'package:migu/models/employee.dart';
import 'package:migu/services/firestore.dart';

class MentorshipsPage extends StatefulWidget {
  const MentorshipsPage({Key? key}) : super(key: key);

  @override
  State<MentorshipsPage> createState() => _MentorshipsPageState();
}

class _MentorshipsPageState extends State<MentorshipsPage> {
  bool loading = true;
  List<Employee> pendingEmployeesList = [];
  List<String> matchList = [];
  List<List<Employee>> mentorshipsList = [];

  setup() async {
    super.initState();
    final firestore = Firestore();
    final employees = await firestore.getAllEmployee();
    final mentorships = await firestore.getAllMentorships();
    final pendings = await firestore.getAllPending();

    pendingEmployeesList = pendings
        .map((e) => employees.where((element) => element.id == e).toList())
        .toList()
        .flattened
        .toList();

    mentorshipsList = mentorships
        .map((e) => e
            .map((el) => employees.where((element) => element.id == el).toList())
            .toList()
            .flattened
            .toList())
        .toList();

    print(mentorships);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    setup();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screen.height * 0.02, horizontal: screen.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Adicionar novo funcionário",
                                      style: theme.textTheme.bodyText1,
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Form(
                                            child: Column(
                                          children: [
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                  labelText: "Nome do Funcionário"),
                                            ),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                  labelText: "Email do Funcionário"),
                                            ),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                  labelText: "Área do Funcionário"),
                                            ),
                                          ],
                                        ))
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            pendingEmployeesList.add(Employee(
                                                id: "",
                                                name: "Seu",
                                                surname: "Jorge",
                                                area: "Engenharia",
                                                email: "seujorge@terra.com.br"));
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    matchList.isNotEmpty ? MatchMentorships(matchList: matchList) : Container(),
                    pendingEmployeesList.isNotEmpty
                        ? PendingEmployees(
                            pendingEmployeesList: pendingEmployeesList,
                          )
                        : Container(),
                    ActiveMentorships(
                      mentorshipList: mentorshipsList,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class PendingEmployees extends StatelessWidget {
  const PendingEmployees({Key? key, required this.pendingEmployeesList}) : super(key: key);

  final List<Employee> pendingEmployeesList;

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
        Column(
            children: pendingEmployeesList
                .map((e) => Column(
                      children: [
                        EmployeeListTile(
                          area: e.area,
                          email: e.email,
                          name: e.name,
                          surname: e.surname,
                        ),
                        Divider(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ))
                .toList()),
      ],
    );
  }
}

class ActiveMentorships extends StatelessWidget {
  const ActiveMentorships({Key? key, required this.mentorshipList}) : super(key: key);
  final List<List<Employee>> mentorshipList;

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mentorshipList
              .map((e) => MentorMentorshipRelation(mentor: e[1], mentee: e[0]))
              .map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    e,
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class MatchMentorships extends StatefulWidget {
  final List<String> matchList;
  const MatchMentorships({Key? key, required this.matchList}) : super(key: key);

  @override
  State<MatchMentorships> createState() => _MatchMentorshipsState();
}

class _MatchMentorshipsState extends State<MatchMentorships> {
  var _selectedIndex = -1;

  updatedSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Match!",
          style: textTheme.headline4,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Veja os mentores recomendados para os seguintes aprendizes",
          style: textTheme.bodyText2,
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Flexible(
                      child: EmployeeListTile(
                    area: 'area',
                    email: 'email',
                    name: 'Nome',
                    surname: 'Sobrenome',
                  )),
                  Flexible(
                    child: Icon(
                      Icons.compare_arrows,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: widget.matchList
                          .sublist(0, 2)
                          .mapIndexed((index, e) => EmployeeListTile(
                                selected: index == _selectedIndex,
                                onTap: () => updatedSelectedIndex(index),
                                area: 'area',
                                email: 'email',
                                name: 'Nome',
                                surname: 'Sobrenome',
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _selectedIndex >= 0
            ? Center(child: ElevatedButton(onPressed: () {}, child: const Text("Confirmar")))
            : Container(),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
