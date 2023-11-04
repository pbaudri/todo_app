import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/card_group_task.dart';
import 'package:todo_app/group_task_view.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/utils/colors/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final taskGroups = [
    TaskGroup(
      color: ColorConstants.lightOrange,
      icon: Icons.person,
      name: 'Personal',
      tasks: [
        Task(name: 'Meet Clients'),
        Task(
          name: 'Design Sprints',
          isDone: true,
        ),
        Task(
          name: 'Icon Set Design for Mobile App',
          isDone: true,
        ),
        Task(name: 'HTML/CSS tudy'),
      ],
    ),
    TaskGroup(
      color: Colors.blue,
      icon: Icons.work,
      name: 'Work',
      tasks: [],
    ),
    TaskGroup(
      color: Colors.green,
      icon: Icons.home_rounded,
      name: 'Home',
      tasks: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightOrange,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.menu,
                    color: ColorConstants.white,
                  ),
                  Text(
                    'TODO',
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.search_outlined,
                    color: ColorConstants.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 52.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    foregroundImage: NetworkImage(
                      'https://images.saatchiart.com/saatchi/938321/art/6005221/5075013-HSC00001-7.jpg',
                    ),
                    radius: 28.0,
                    backgroundColor: ColorConstants.darkGrey,
                  ),
                  SizedBox(height: 36.0),
                  Text(
                    'Hello, Jane.',
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 32.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Look like feel good. \nYou have 3 tasks to do today.',
                    style: TextStyle(
                      color: ColorConstants.lightGrey,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 44.0),
                  Text(
                    'Today : SEPTEMBER 12, 2017',
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 52),
                    itemCount: taskGroups.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final taskGroup = taskGroups.elementAt(index);

                      return OpenContainer(
                        closedColor: Colors.transparent,
                        openColor: Colors.transparent,
                        closedElevation: 0,
                        openElevation: 0,
                        openShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        closedBuilder: (context, action) => InkWell(
                          onTap: action,
                          child: CardGroupTask(
                            taskGroup: taskGroup,
                          ),
                        ),
                        openBuilder: (context, action) => GroupTaskView(
                          taskGroup: taskGroup,
                        ),
                        transitionDuration: const Duration(seconds: 1),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
