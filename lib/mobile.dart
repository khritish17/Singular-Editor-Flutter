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
              Editor(),
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
                heroTag: 'compile btn',
                onPressed: (){

                  // print(inputController.text);
                  Backend BCK = Backend();
                  // print(BCK.convert(inputController.text));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Mobile_Viewer(BCK.convert(inputController.text))),
                  );
                  },
                label: Text('COMPILE'),
                backgroundColor: Colors.pink,
                icon: Icon(Icons.play_arrow),
              ),FloatingActionButton.extended(
                heroTag: 'save btn',
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

class Mobile_Viewer extends StatelessWidget {
  // const Mobile_Viewer({Key? key}) : super(key: key);
  // const Mobile_Viewer(String input_ ,{Key? key}) : super(key: key);
  final String input_;
  const Mobile_Viewer(this.input_);
  @override
  Widget build(BuildContext context) {
    // print(input_);
    String output_;
    output_ = input_;
    if (input_ == ""){
      output_ = "Please write something";
    }
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Singular Viewer'),
      ),
      body: Container(
        height: screen_height * (92.9/100),
        width: screen_width,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Container(
            width: screen_width,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black,
              // border: Border.all(color: Colors.white,width: 2.5),
              // borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            
            child: Text(output_, style: TextStyle(color: Colors.white, fontSize: 21),),
          ),
        ),
      )
    );
  }
}





