
import 'package:flutter/material.dart';
import 'package:own_destiny/story%20brain.dart';


StoryBrain storyBrain = StoryBrain();
void main()=> runApp(MaterialApp(

  debugShowCheckedModeBanner: false,
  title:  "OWN DESTINY",
  theme: ThemeData.dark(),
  home: Homepage(),
));

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                  child: Center(child: Text(storyBrain.getStory()!,
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center),)),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(storyBrain.getChoice1()!,style: TextStyle(fontSize: 20),),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                ),
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: (){
                     setState(() {
                       storyBrain.nextStory(2);
                     });
                    },
                    child: Text(storyBrain.getChoice2()!,style: TextStyle(fontSize: 20),),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
