class BotClock{

  Future clock({int seconds = 1}){
    return Future.delayed(Duration(seconds: seconds));
  }

  Stream timeWorking({int interval = 1,int? maxCont}) async*{
    int i = 1;
    while(i != maxCont){
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
  }
}