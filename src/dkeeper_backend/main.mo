
import List "mo:base/List";
import Debug "mo:base/Debug";
import Array "mo:base/Array";


actor dkeeper {

 type Note = {
title: Text;
content: Text;

};

stable var notes: List.List<Note> = List.nil<Note>();


public func createNote(titleText: Text, contentText: Text) {


  let newNote: Note = {
    title = titleText;
    content = contentText;
    


  };

  notes := List.push(newNote,  notes);
   Debug.print(debug_show(notes));


};

public query func readNotes(): async [Note] {



return List.toArray(notes);



};

public func removeNote(id: Nat){


let keepPrior = List.drop(notes, id+1);
let keepAfter = List.take(notes, id);

var newNote1 = List.push(keepPrior,  notes);

var newNote2 = List.push(keepAfter,  notes);


notes := List.append(keepAfter, keepPrior);

Debug.print(debug_show(notes));

};


}