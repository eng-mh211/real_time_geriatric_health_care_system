class info{
  String? key;
  NodeData? nodeData;

  info({this.key,this.nodeData});
}

class NodeData{
  String? Temperature;
  String? BPM;
  String? AverageBPM;

  NodeData({this.Temperature,this.BPM,this.AverageBPM});

  NodeData.fromJson(Map<dynamic,dynamic> json){
    Temperature = json["Temperature"];
    BPM = json["BPM"];
    AverageBPM = json["Average BPM"];
  }
}