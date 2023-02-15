import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const Bandersnatch());
}

class Bandersnatch extends StatelessWidget {
  const Bandersnatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                height: double.infinity,
                'images/background.png',
                fit: BoxFit.cover,
              ),
              const StoryPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  storyBrain.getStory(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
              ),
              onPressed: () {
                setState(() {
                  storyBrain.nextStory(1);
                });
              },
              child: Text(
                storyBrain.getChoice1(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20))),
                onPressed: () {
                  setState(() {
                    storyBrain.nextStory(2);
                  });
                },
                child: Text(
                  storyBrain.getChoice2(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
