import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors/colors.dart';

class TaskGroup {
  TaskGroup({
    required this.color,
    required this.icon,
    required this.name,
    required this.tasks,
    required this.percentageDone,
  });

  final Color color;
  final IconData icon;
  final String name;
  final List<Task> tasks;
  final int percentageDone;
}

class Task {}

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

class _MyHomePageState extends State<MyHomePage> {
  final taskGroups = [
    TaskGroup(
      color: ColorConstants.lightOrange,
      icon: Icons.person,
      name: 'Personal',
      tasks: [
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
      ],
      percentageDone: 83,
    ),
    TaskGroup(
      color: Colors.blue,
      icon: Icons.work,
      name: 'Work',
      tasks: [
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
      ],
      percentageDone: 24,
    ),
    TaskGroup(
      color: Colors.green,
      icon: Icons.home_rounded,
      name: 'Home',
      tasks: [
        Task(),
        Task(),
        Task(),
        Task(),
        Task(),
      ],
      percentageDone: 32,
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
                    padding: const EdgeInsets.only(left: 52),
                    itemCount: taskGroups.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final taskGroup = taskGroups.elementAt(index);

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: ColorConstants.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorConstants.lightGrey,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Icon(
                                          taskGroup.icon,
                                          size: 32.0,
                                          color: taskGroup.color,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.more_vert_outlined,
                                      color: ColorConstants.lightGrey,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${taskGroup.tasks.length} Tasks',
                                      style: TextStyle(
                                        color: ColorConstants.darkGrey
                                            .withOpacity(.6),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      taskGroup.name,
                                      style: TextStyle(
                                        color: ColorConstants.darkGrey
                                            .withOpacity(.9),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 36.0,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: LinearProgressIndicator(
                                            value: .83,
                                            backgroundColor:
                                                ColorConstants.lightGrey,
                                            valueColor: AlwaysStoppedAnimation(
                                              taskGroup.color,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          '${taskGroup.percentageDone}%',
                                          style: TextStyle(
                                            color: ColorConstants.darkGrey
                                                .withOpacity(.6),
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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
