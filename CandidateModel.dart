class Candidate_Model{
  String ? uid;
  String ? candidatename;
  String ? position;
  String ? politicalAffiliation;
  String ? partyController;
  String ? manifestoController;
  Candidate_Model({this.uid,this.candidatename,this.position,
    this.politicalAffiliation,this.partyController,this.manifestoController});
  factory Candidate_Model.fromMap(map){
    return Candidate_Model(
      uid: map['uid'],
      candidatename: map['candidatename'],
      position: map['position'],
      politicalAffiliation: map['politicalAffiliation'],
      partyController: map['partyController'],
      manifestoController: map['manifestoController'],
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'uid' : uid,
      'candidatename':candidatename,

      'position':position,
      'politicalAffiliation':politicalAffiliation,
      'partyController' :partyController,
      ' manifestoController' : manifestoController,
    };

  }
}


