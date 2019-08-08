class ProfileModel {

  // Field
  String title, url;

  // Construtor
  ProfileModel(this.title, this.url);

  ProfileModel.fromAPI(Map<String, dynamic> fromJSON){
    title = fromJSON['title'];
    url = fromJSON['url'];
  }
  
}