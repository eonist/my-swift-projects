import Foundation

func testing(){
    let array3D: [[[Int]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
    print(array3D.count)
    
    //Arrays with dictionaries (method 1):
    var taskItems:[Dictionary<String,String>] = []
    taskItems.append(["color":"blue"])
    
    //Arrays with dictionaries (method 2):
    var taskItems2 = [[String:String]()]
    taskItems2.append(["color":"blue"])
}
