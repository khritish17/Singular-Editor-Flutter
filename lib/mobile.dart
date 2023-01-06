import 'package:flutter/material.dart';
import 'package:singular_editor/Backend/backend.dart';


class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Singular Editor'),
      ),
      body: SingleChildScrollView(
        child:
            Column(
            children: [
              // TextFormField(
              //     decoration: InputDecoration(
              //       hintText: 'Untitled file',
              //       hintStyle: TextStyle(color: Colors.white.withAlpha(150), fontSize: 16,),
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(color: Colors.lightGreenAccent, width: 3.0),
              //         borderRadius: BorderRadius.circular(15.0),
              //       ),
              //       focusedBorder:OutlineInputBorder(
              //         borderSide: const BorderSide(color: Colors.pink, width: 3.0),
              //         borderRadius: BorderRadius.circular(25.0),
              //       ),
              //     ),
              //   ),
              Editor(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [FloatingActionButton.extended(
              //     onPressed: (){},
              //     label: Text('COMPILE'),
              //     backgroundColor: Colors.pink,
              //     icon: Icon(Icons.play_arrow),
              //   ),FloatingActionButton.extended(
              //     onPressed: (){},
              //     label: Text('SAVE'),
              //     backgroundColor: Colors.green,
              //     icon: Icon(Icons.thumb_up),
              //   ),],
              // ),


            ],
          )
        ),

    );
  }
}

class Editor extends StatefulWidget {
  const Editor({Key? key}) : super(key: key);


  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  final TextEditingController inputController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Container(
      // width: screen_width,
      // height: screen_height * (91.29/100),
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: inputController,
              // onChanged: (value){print(value);},
              onSubmitted: (value){print(value);},
              minLines: 1,
              maxLines: 100,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 20),
              decoration: InputDecoration(
                // labelText: 'Click to edit your text',
                hintText: 'Click to edit your text',
                hintStyle: TextStyle(color: Colors.white.withAlpha(150), fontSize: 16,),
                // labelStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink, width: 3.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),

              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [FloatingActionButton.extended(
                onPressed: (){
                  print(inputController.text);
                  Backend BCK = Backend();
                  print(BCK.convert(inputController.text));
                  },
                label: Text('COMPILE'),
                backgroundColor: Colors.pink,
                icon: Icon(Icons.play_arrow),
              ),FloatingActionButton.extended(
                onPressed: (){},
                label: Text('SAVE'),
                backgroundColor: Colors.green,
                icon: Icon(Icons.thumb_up),
              ),],
            ),
        ]
        ),
      ),

    );
  }
}




