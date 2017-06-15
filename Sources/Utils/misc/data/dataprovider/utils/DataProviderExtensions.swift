import Foundation

/*Parser*/
extension DataProvider{
    var xml:XML {return DataProviderParser.xml(self)}/*convenience*/
    /**
     * Returns the first item that has the PARAM: value at PARAM key
     */
    func item(_ value:String, _ key:String = "title")->[String:String]?{// :TODO: move this to DataProviderParser
        return self.items.first(where:{$0[key] == value})
    }
    /**
     * Returns the index of the first item that has the PARAM: value at PARAM: key
     */
    func index(_ key:String,_ value:String) -> Int?{
        return items.index(where: {$0[key] == value})
    }
    /**
     * Returns the item index passed through the PARAM item
     */
    func index(_ item:[String:String])->Int{
        return self.items.index{$0 == item} ?? -1//upgraded to swift 3 syntax
    }
    /**
     * Returns index for title
     */
    func index(_ title:String)->Int?{
        return self.items.index(where: {$0["title"] == title})
    }
    /**
     * Returns the count of the self.items
     */
    func value(_ index:Int,_ key:String)->String?{
        if let value = self.items[index][key]{
            return value
        }
        return nil
    }
}
/**
 * TODO: Implement support for xmlString as an init argument, is that needed? just do: string.xml
 */
extension DataProvider{/*Modifier*/
    /**
     * Adds an array to the exisiting items array
     * PARAM: items is an Array comprised of objects
     */
    func add(_ items:[[String:String]]) {
        self.items += items/*concats*/
        super.onEvent(DataProviderEvent(DataProviderEvent.add, self.items.count - items.count, self.items.count,self))
    }
    /**
     * Adds an item to the end of the Items Array
     * PARAM: item is an Object instance as {title:"title"}
     */
    func add(_ item:[String:String]) {
        self.items.append(item)
        super.onEvent(DataProviderEvent(DataProviderEvent.add,self.items.count-1,self.items.count,self))
    }
    /**
     * Adds an item to a spesific index
     * PARAM: item is an Object instance as {title:"title"}
     */
    func add(_ item:[String:String], _ index:Int, _ updateDP:Bool = true/*<-new ⚠️️ to facilitate bulk adding with 1 ui update*/){
        ArrayModifier.addAt(&self.items, item, index)
        if updateDP {super.onEvent(DataProviderEvent(DataProviderEvent.add,index,index+1,self))}
    }
    /**
     * Removes an item at a spesific index
     */
    func remove(_ index:Int)->[String:String] {
        guard let item:[String:String] = items[safe:index] else{
            (fatalError("\(ClassParser.type(self))" + " no item at the index of " + "\(index)"))
        }
        items.removeAt(index)
        super.onEvent(DataProviderEvent(DataProviderEvent.remove, index,index+1,self))// ⚠️️ We dont wan't this here, this is the responsibility of the caller no?
        return item
    }
    /**
     * Removes the item passed through the PARAM item
     * RETURNS: the removed item
     */
    func remove(_ item:[String:String]) -> [String:String]? {
        guard let index:Int = self.items.index(where: {$0 == item}) else {
            return nil
        }
        onEvent(DataProviderEvent(DataProviderEvent.remove, index,index+1,self))
        return self.items.remove(at: index)//was splice2(index,1)[0]
    }
    func removeAll(){
        let itemsCount = count
        self.items = []
        onEvent(DataProviderEvent(DataProviderEvent.removeAll,0,itemsCount,self));
    }
    typealias SortCondition = ([String:String], [String:String]) -> Bool
    /**
     * Sorts items by the key provided in ascending or descending order
     * EXAMPLE: DataProvider([["date":"0214","title":"a"],["date":"0216","title":"b"],["date":"0114","title":"c"]]).sort("date").items.forEach{Swift.print($0["title"])}//c,a,b
     */
    func sort(_ key:String, _ ascending:Bool = true){
        let condition:SortCondition = ascending ? {$0[key]! < $1[key]!} : {$0[key]! > $1[key]!}//Toggles ascending and descending
        self.items.sort(by:condition)
        onEvent(DataProviderEvent(DataProviderEvent.sort, 0,self.items.count,self));
    }
    /**
     * Update data in dataProvider item at PARAM index
     * TODO: We could use subScript here. if subScript is overridable
     */
    func setValue(_ index:Int,_ key:String, _ value:String){
        if(index < self.items.count){/*Make sure index is within range*/
            self.items[index][key] = value
            super.onEvent(DataProviderEvent(DataProviderEvent.dataChange/*,[item]*/,index,index,self))//<-new
        }
    }
    /**
     * Sets all values except at PARAM: exceptionIndex
     */
    func setValuesExceptAt(_ exceptionIndex:Int, _ key:String, _ value:String) {
        items.indices.forEach {
            if($0 != exceptionIndex){
                self.items[exceptionIndex][key] = value
            }
        }
    }
}
//DEPRECATED, legacy support
extension DataProvider{
    func getItemAt(_ index:Int) -> [String:String]? {return item(index)}
    func getItemIndex(_ item:[String:String])->Int{return index(item)}
    func getIndex(_ title:String)->Int?{return index(title)}
    func getItem(_ value:String, key:String = "title")->[String:String]?{return item(value,key)}
    func getValue(_ index:Int,_ key:String)->String?{return value(index,key)}
    func addItems(_ items:[[String:String]]) {add(items)}
    func addItem(_ item:[String:String]) {add(item)}
    func addItemAt(_ item:[String:String], _ index:Int){add(item,index)}
    func removeItemAt(_ index:Int)->[String:String] {return remove(index)}
    func removeItem(_ item:[String:String])->[String:String]? {return remove(item)}
}
