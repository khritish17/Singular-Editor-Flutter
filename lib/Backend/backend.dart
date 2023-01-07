class Backend{
  Backend(){
  }

  String convert(String input_){
    if (input_ == ""){
      return input_;
    }
    var symbol = {'|alpha':"\u03B1",'|Delta': "\u0394", '|Omega': "\u03A9", '|pi': "\u03C0", '|Theta': "\u03F4", '|lambda': "\u03BB", '|theta': "\u03B8", '|degree': "\u03B1", '|hat': "\u0302"};
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