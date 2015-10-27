// example of tableview with custom design? https://developer.apple.com/library/mac/samplecode/TableViewPlayground/TableViewPlayground.zip

//and this //http://stackoverflow.com/questions/4599747/programmatically-creating-an-nstableview-trouble-getting-the-nsheaderview-to-sh?rq=1


//in ib: http://www.raywenderlich.com/87002/getting-started-with-os-x-and-swift-tutorial-part-1

//apple: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSTableView_Class/


//https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Protocols/NSTableDataSource_Protocol/index.html#//apple_ref/occ/intfm/NSTableViewDataSource/tableView:objectValueForTableColumn:row:

//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/TableView/Introduction/Introduction.html#//apple_ref/doc/uid/10000026i

/**
Drag and droping in NSViewTable: (Awesome)
https://www.youtube.com/watch?v=V0yLZnVFJjw

Row Groups:
Cocoa Programming L53 - Groups in NSTableView
*/




//Add the tableView(viewForTableColumn:row:) method to AppDelegate. This method returns an NSView that will appear in the table view cell, based on the row number and column used:
func test(){
	 func tableView(tableView: NSTableView!, viewForTableColumn tableColumn: NSTableColumn!, row: Int) -> NSView!  {

        let cell = tableView.makeViewWithIdentifier(tableColumn.identifier, owner: self) as NSTableCellView

        let textField = cell.textField
        let song = self.songs[row]

        if tableColumn.identifier == "Title" {
            textField?.stringValue = song.title
			} else if tableColumn.identifier == "Duration" {
            let durationText = NSString(format: "%i:%02i",Int(song.duration) / 60,Int(song.duration) % 60)
            textField?.stringValue = durationText
        }
        return cell
    }
	 
	 
	 //Sorting:
	 /*
	 Sorting a Table View

		When you click a table view header, you’re indicating to the table view that it should re-sort the contents of the table. To do this, the table columns need to know what specific property they’re responsible for showing.
		This is implemented by providing sort keys to each of the columns. Sort keys indicate what property should be used for sorting.
		To add sort keys, select the “Title” table column in the outline. Open the Attributes Inspector and set the sort key to title. Leave the selector as compare: and the order as Ascending. Then, select the “Duration” table column in the outline, and change the sort key to duration.
		When a table column header is clicked, the table view’s data source receives a tableView(sortDescriptorsDidChange:) message. A sort descriptor is an instance of the NSSortDescriptor class, which provides information on how a collection of objects should be sorted.
		To sort an array using sort descriptors, you take the array, and use the sort method. This method takes a closure that it uses to work out how a pair of objects is ordered; you can simple take each sort descriptor, and use its compareObject(toObject:)”

		
	 */
	 //To implement the tableView(sortDescriptorsDidChange:) method, add the following method to AppDelegate:
    func tableView(tableView: NSTableView!,
                    sortDescriptorsDidChange oldDescriptors: [AnyObject]!)  {

        // Apply each sort descriptor, in reverse order

        for sortDescriptor in tableView.sortDescriptors.reverse()
            as [NSSortDescriptor] {
            songs.sort() {
                (item1, item2) in
                return sortDescriptor.compareObject(item1, toObject: item2)
                    == NSComparisonResult.OrderedAscending
            }
        }

        tableView.reloadData()
    }
}
    