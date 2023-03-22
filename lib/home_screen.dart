import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var textController = TextEditingController();
  var numberController = TextEditingController();

  bool isSpace = false;
  bool isNewLine = false;
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WaBuddy"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildInputbox(),
          _buildTextLine(),
          _buildNewLineOrSpaceButton(),
          _buildGenerateButton(),
          _buildGenerateButtonOnTap(),
          _buildTextAfterOnTabe(),
        ],
      ),
    );
  }
  Widget _buildInputbox(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),),
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
        controller: numberController,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Repetition Limit",
        ),
        ),
        ),
      ],
    );
  }
  Widget _buildTextLine(){
    return Text(
      "How many times you want to repeat thr text",
      textAlign: TextAlign.start,
    );
  }
  Widget _buildNewLineOrSpaceButton(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Checkbox(
                  value: isNewLine,
                  activeColor: Colors.cyan,
                  onChanged: (value) {
                    setState(() {
                      isNewLine = value!;
                    });
                  },
                ),
                Text("Include new line"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Checkbox(
                  value: isSpace,
                  // title: Text("Include new line"),
                  activeColor: Colors.cyan,
                  onChanged: (value) {
                    setState(() {
                      isSpace = value!;
                    });
                  },
                  // controlAffinity: ListTileControlAffinity.leading,
                ),
                Text("Include space"),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildGenerateButton(){
    return InkWell(
      onTap: () {
        String text = textController.text;

        int limit = int.parse(numberController.text);
        for (var i = 1; i <= limit; i++) {
          result =
          "$result${isSpace ? " " : ""}${isNewLine ? "\n" : ""}$text";
        }
        setState(() {
          result;
        });
      },
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.greenAccent),
        child: Center(
            child: Text(
              "GENERATE TEXT",
              style: TextStyle(
                color: Colors.black38,
              ),
            )),
      ),
    );
  }
  Widget _buildGenerateButtonOnTap(){
    return result==""?SizedBox():InkWell(
        onTap: () {
          Share.share(result);
        },
        child: Icon(Icons.share));
  }
  Widget _buildTextAfterOnTabe(){
    return  Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(result),
            ],
          ),
        ),
      ),
    );
  }

  }


