#if os(iOS)
import UIKit
extension UITableView:UITableViewDataSource {}
extension UITableViewDataSource where Self:UITableView {
    /**
     * EXAMPLE: tableView.cells//list of cells in a tableview
     */
    var cells:[UITableViewCell] {
        return (0..<self.numberOfSections).indices.map { (sectionIndex:Int) -> [UITableViewCell] in
            return (0..<self.numberOfRows(inSection: sectionIndex)).indices.compactMap{ (rowIndex:Int) -> UITableViewCell? in
                return self.cellForRow(at: IndexPath(row: rowIndex, section: sectionIndex))
            }
        }.flatMap{$0}
    }
}
#endif

/**
 * Returns totalRowHeight (height of all rows)
 * TODO: ⚠️️ Upgrade this with NumberOfSections instead
 */
//    var totalRowHeight:CGFloat {
//        return sections.enumerated().map { arg -> [(section:Int,row:Int)] in
//            return arg.element.data.indices.map{ i in return (section:arg.offset,row:i)}
//            }.flatMap{$0}.reduce(0){
//                return $0 + self(self, heightForRowAt: .init(row: $1.row, section: $1.section))
//        }
//    }



/**
 * EXAMPLE: tableView.cells()//list of cells in a tableview
 */
//    static var cells:[UITableViewCell]{
//        var cells:[UITableViewCell] = []
//        (0..<tableView.numberOfSections).indices.forEach { sectionIndex in
//            (0..<tableView.numberOfRows(inSection: sectionIndex)).indices.forEach { rowIndex in
//                if let cell:UITableViewCell = tableView.cellForRow(at: IndexPath(row: rowIndex, section: sectionIndex)) {
//                    cells.append(cell)
//                }
//            }
//        }
//    }
