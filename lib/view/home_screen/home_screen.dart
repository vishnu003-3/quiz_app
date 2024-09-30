import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_db.dart';
import 'package:quiz_app/utils/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int currentQstNo = 1;
  int currentLast = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.lightBlack,
        appBar: AppBar(
          backgroundColor: ColorConstants.lightBlack,
          actions: [
            Text(
              "$currentQstNo/$currentLast",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 450,
                  width: 700,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      DummyDb.questionList[currentIndex]["questions"],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                  4,
                  (index) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      width: 700,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(48, 39, 29, 29),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DummyDb.questionList[currentIndex]["options"],
                              style: TextStyle(color: Colors.white)),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {});

                    currentIndex++;
                    currentQstNo = currentIndex + 1;
                    currentQstNo <= currentLast;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    width: 700,
                    decoration: BoxDecoration(
                        color: ColorConstants.lightGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: Center(
                        child: Text("Next",
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
