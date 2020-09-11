import 'package:memory_game_app/Model/tile_model.dart';

int points = 0;
int counter=0;
int clickCounter=0;
bool selected = false;
int selectedIndex;
List<TileModel> pairs = new List<TileModel>();

List<TileModel> getPairs() {
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel ;


//1
tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/1.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);
  tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/1.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);

 

  //2
   tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/2.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);
     tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/2.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);

  

  //3
  tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/3.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);
    tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/3.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);



  //4
    tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/4.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);
      tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/4.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);



  //5
   tileModel = new TileModel(); 
  tileModel.setImageAssetPath("assets/5.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);
     tileModel = new TileModel(); 
  tileModel.setImageAssetPath("assets/5.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);



  //6
    tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/6.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);
      tileModel = new TileModel();
  tileModel.setImageAssetPath("assets/6.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);



  //7
  tileModel = new TileModel();  
  tileModel.setImageAssetPath("assets/7.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);
    tileModel = new TileModel();  
  tileModel.setImageAssetPath("assets/7.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);



  //8
  tileModel = new TileModel();  
  tileModel.setImageAssetPath("assets/8.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);
    tileModel = new TileModel();  
  tileModel.setImageAssetPath("assets/8.png");
  tileModel.setIsSelected(false);tileModel.setOk(false);
  pairs.add(tileModel);



  return pairs;
}

List<TileModel> getQuestions() {
  List<TileModel> pairs = new List<TileModel>();
  TileModel tileModel = new TileModel();

//1
  tileModel.setImageAssetPath("assets/back.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //2
  tileModel.setImageAssetPath("assets/back.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //3
  tileModel.setImageAssetPath("assets/back.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //4
  tileModel.setImageAssetPath("assets/back.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //5
  tileModel.setImageAssetPath("assets/back.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //6
  tileModel.setImageAssetPath("assets/back.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //7
  tileModel.setImageAssetPath("assets/back.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  //8
  tileModel.setImageAssetPath("assets/back.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  return pairs;
}
