import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/presentation/home/widgets/home_app_bar_widget.dart';
import 'package:todo_app/presentation/home/widgets/home_user_welcome_widget.dart';
import 'package:todo_app/presentation/tasks/pages/group_task_page.dart';
import 'package:todo_app/presentation/tasks/widgets/card_group_task_widget.dart';
import 'package:todo_app/utils/colors/colors.dart';

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

  final _pageController = PageController(viewportFraction: .85);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: kThemeAnimationDuration,
        color: taskGroups.elementAt(_currentIndex).color,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBarWidget(),
              const SizedBox(height: 60.0),
              const HomePageUserWelcomeWidget(),
              const SizedBox(height: 12.0),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: PageView.builder(
                      onPageChanged: (value) => setState(() {
                        _currentIndex = value;
                      }),
                      itemCount: taskGroups.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        final taskGroup = taskGroups.elementAt(index);

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: OpenContainer(
                            closedColor: Colors.transparent,
                            openColor: Colors.transparent,
                            closedElevation: 0,
                            openElevation: 0,
                            openShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            closedBuilder: (context, action) => GestureDetector(
                              onTap: action,
                              child: CardGroupTaskWidget(
                                taskGroup: taskGroup,
                              ),
                            ),
                            openBuilder: (context, action) => GroupTaskPage(
                              taskGroup: taskGroup,
                            ),
                            transitionDuration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
