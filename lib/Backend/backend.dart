class Backend{
  Backend(){
  }

  String convert(String input_){
    var symbol = {'|omega':"\u03A9"};
    List formatted_string = input_.split(' ');
    for(var i = 0; i<formatted_string.length; i++){
      String current_word = formatted_string[i];
      if (current_word[0] == '|'){
        if (symbol.containsKey(current_word)){
          formatted_string[i] = symbol[current_word];
        }
      }
    }
    String output_ = formatted_string.join(" ");
    return output_;
  }

}

// void main()
// {
//   Backend BCK = new Backend();
//   print( BCK.convert("|omega this is Khritish") );
//
// }