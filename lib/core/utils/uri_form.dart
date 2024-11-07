class UriForm {
  static Uri convertUri({required String url, required String path}) {
    final urlSource = Uri.parse(url);
    final hostSource = urlSource.host;
    final pathSource = urlSource.path;
    final pathPort = urlSource.port;
    var myPath = '';
    if(pathSource.isNotEmpty){
      myPath = '$pathSource$path';
    }
    else{
      myPath = path;
    }
    final myHostSource = '$hostSource:$pathPort';
    return Uri.https(myHostSource, myPath);
  }
}
