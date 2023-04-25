import 'package:assignment/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(

        // appBar: AppBar(
        //   backgroundColor: Colors,
        // ),
        body: Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          AppImages.background,
        ),
        fit: BoxFit.fill,
        opacity: 0.8,
      )),
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
      ),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://picsum.photos/200/300',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Hi Ade',
                style: theme.textTheme.headlineLarge,
              ),
              const Spacer(),
              const Icon(
                Icons.more_vert_outlined,
                size: 30,
              )
            ],
          ),
          Container(
            width: size.width,
            height: size.height * 0.13,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.workspace_premium_outlined,
                    size: 30,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Go Premium',
                        style: theme.textTheme.headlineMedium!.copyWith(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: size.width * 0.7,
                        child: Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                          maxLines: 2,
                          style: theme.textTheme.bodySmall!.copyWith(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  )

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         vertical: 5,
                  //         horizontal: 10,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: Colors.white.withOpacity(0.5),
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: Text(
                  //         '$left Left',
                  //         style: theme.textTheme.bodySmall!
                  //             .copyWith(color: color, fontSize: 12),
                  //       ),
                  //     )
                  //   ],
                  // )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 15),
            child: Text(
              'Tasks',
              style: theme.textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: size.height * 0.5,
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: const [
                  TaskGrid(
                    title: 'Assignment',
                    left: '2',
                    icon: Icons.assignment,
                    color: Colors.orange,
                  ),
                  TaskGrid(
                    title: 'Courses',
                    left: '2',
                    icon: Icons.notes,
                    color: Colors.pink,
                  ),
                  TaskGrid(
                    title: 'My Courses',
                    left: '2',
                    icon: Icons.now_widgets_outlined,
                    color: Colors.purple,
                  ),
                  TaskGrid(
                    title: 'My Result(Upcoming)',
                    left: '2',
                    icon: Icons.app_registration_outlined,
                    color: Colors.blue,
                  ),
                ]),
          )
        ],
      ),
    ));
  }
}

class TaskGrid extends StatelessWidget {
  final Color color;

  final String left;

  final String title;
  final IconData icon;

  const TaskGrid({
    Key? key,
    required this.title,
    required this.color,
    required this.left,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30,
              color: color.withOpacity(0.5),
            ),
            Text(
              title,
              style: theme.textTheme.headlineMedium!.copyWith(
                fontSize: 15,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$left Left',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: color, fontSize: 12),
                  ),
                )
              ],
            )
          ]),
    );
  }
}
