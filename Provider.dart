import 'package:flutter/material.dart';
import 'package:flutter_application_3/MyBloggerData.dart';

class MyProviderLogin extends ChangeNotifier{
  final TextEditingController _tfemail = TextEditingController();
  final TextEditingController _tfpass = TextEditingController();

  TextEditingController get tfemail => _tfemail;
  TextEditingController get tfpass => _tfpass;

  bool _isEmailEmpty = false;
  bool _isPassEmpty = false;

  bool get isEmailEmpty => _isEmailEmpty;
  bool get isPassEmpty => _isPassEmpty;

  set setEmailEmpty(value){
    _isEmailEmpty = value;
    notifyListeners();
  }

  set setPassEmpty(value){
    _isPassEmpty = value;
    notifyListeners();
  }
}

class MyProviderRegister extends ChangeNotifier {
  final TextEditingController _tfemail1 = TextEditingController();
  final TextEditingController _tfusername = TextEditingController();
  final TextEditingController _tfname = TextEditingController();
  final TextEditingController _tfpass1 = TextEditingController();

  TextEditingController get tfname => _tfname;
  TextEditingController get tfusername => _tfusername;
  TextEditingController get tfemail1 => _tfemail1;
  TextEditingController get tfpass1 => _tfpass1;

  bool _isNameEmpty = false;
  bool _isUsernameEmpty = false;
  bool _isEmailEmpty1 = false;
  bool _isPassEmpty1 = false;

  bool get isNameEmpty => _isNameEmpty;
  bool get isUsernameEmpty => _isUsernameEmpty;
  bool get isEmailEmpty1 => _isEmailEmpty1;
  bool get isPassEmpty1 => _isPassEmpty1;

  set setNameEmpty(value){
    _isNameEmpty = value;
    notifyListeners();
  }

  set setUsernameEmpty(value){
    _isUsernameEmpty = value;
    notifyListeners();
  }

  set setEmailEmpty1(value){
    _isEmailEmpty1 = value;
    notifyListeners();
  }

  set setPassEmpty1(value){
    _isPassEmpty1 = value;
    notifyListeners();
  }
}

class MyProviderForgetPass extends ChangeNotifier{
  final TextEditingController _tfemail2 = TextEditingController();

  TextEditingController get tfemail2 => _tfemail2;

  bool _isEmailEmpty2 = false;

  bool get isEmailEmpty2 => _isEmailEmpty2;

  set setEmailEmpty2(value){
    _isEmailEmpty2 = value;
    notifyListeners();
  }
}

class MyProviderNewPass extends ChangeNotifier{
  final TextEditingController _tfpass1 = TextEditingController();
  final TextEditingController _tfpass2 = TextEditingController();

  TextEditingController get tfpass1 => _tfpass1;
  TextEditingController get tfpass2 => _tfpass2;

  bool _isPassEmpty1 = false;
  bool _isPassEmpty2 = false;

  bool get isPassEmpty1 => _isPassEmpty1;
  bool get isPassEmpty2 => _isPassEmpty2;

  set setPassEmpty1(value){
    _isPassEmpty1 = value;
    notifyListeners();
  }

  set setPassEmpty2(value){
    _isPassEmpty2 = value;
    notifyListeners();
  }
}

class FavoriteProvider extends ChangeNotifier {
  List<BlogPost> favoritePosts = [];

  void toggleFavorite(BlogPost post) {
    if (favoritePosts.contains(post)) {
      favoritePosts.remove(post);
    } else {
      favoritePosts.add(post);
    }
    notifyListeners();
  }
  
  void addToFavorite(BlogPost blogPost) {
    if (favoritePosts.contains(blogPost)) {
      removeFromFavorite(blogPost);
    } else {
      favoritePosts.add(blogPost);
      notifyListeners();
    }
  }

  void removeFromFavorite(BlogPost blogPost) {
    favoritePosts.remove(blogPost);
    notifyListeners();
  }

  bool isFavorite(BlogPost blogPost) {
    return favoritePosts.contains(blogPost);
  }
}

class SwitchProvider extends ChangeNotifier{
  bool _enabledark = false;

  get enabledark => _enabledark;
  set enabledark(value){
    _enabledark = value;
    notifyListeners();
  }
  bool get enablledar => _enabledark;
  var darktheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.dark
  );
  var lighttheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light
  );
}

class MyProviderChangeNewPass extends ChangeNotifier{
  final TextEditingController _tfpass1 = TextEditingController();
  final TextEditingController _tfpass2 = TextEditingController();

  TextEditingController get tfpass1 => _tfpass1;
  TextEditingController get tfpass2 => _tfpass2;

  bool _isPassEmpty1 = false;
  bool _isPassEmpty2 = false;

  bool get isPassEmpty1 => _isPassEmpty1;
  bool get isPassEmpty2 => _isPassEmpty2;

  set setPassEmpty1(value){
    _isPassEmpty1 = value;
    notifyListeners();
  }

  set setPassEmpty2(value){
    _isPassEmpty2 = value;
    notifyListeners();
  }
}

class MyProviderForgetNewPass extends ChangeNotifier{
  final TextEditingController _tfemail1 = TextEditingController();

  TextEditingController get tfemail1 => _tfemail1;

  bool _isEmailEmpty1 = false;

  bool get isEmailEmpty1 => _isEmailEmpty1;

  set setEmailEmpty1(value){
    _isEmailEmpty1 = value;
    notifyListeners();
  }
}

class MyProviderOldPass extends ChangeNotifier{
  final TextEditingController _tfpass1 = TextEditingController();

  TextEditingController get tfpass1 => _tfpass1;

  bool _isPassEmpty1 = false;

  bool get isPassEmpty1 => _isPassEmpty1;

  set setPassEmpty1(value){
    _isPassEmpty1 = value;
    notifyListeners();
  }
}

class FavoriteProvider1 extends ChangeNotifier {
  List<Blogger> favoritePosts = [];

  void toggleFavorite(Blogger post) {
    if (favoritePosts.contains(post)) {
      favoritePosts.remove(post);
    } else {
      favoritePosts.add(post);
    }
    notifyListeners();
  }
  
  void addToFavorite(Blogger blogger) {
    if (favoritePosts.contains(blogger)) {
      removeFromFavorite(blogger);
    } else {
      favoritePosts.add(blogger);
      notifyListeners();
    }
  }

  void removeFromFavorite(Blogger blogger) {
    favoritePosts.remove(blogger);
    notifyListeners();
  }

  bool isFavorite(Blogger blogger) {
    return favoritePosts.contains(blogger);
  }
}