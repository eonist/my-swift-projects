#if os(iOS)
import UIKit
extension UITableView {
    /**
     * EXAMPLE: tableView.cells()//list of cells in a tableview
     */
    static var cells:[UITableViewCell]{
        var cells:[UITableViewCell] = []
        (0..<tableView.numberOfSections).indices.forEach { sectionIndex in
            (0..<tableView.numberOfRows(inSection: sectionIndex)).indices.forEach { rowIndex in
                if let cell:UITableViewCell = tableView.cellForRow(at: IndexPath(row: rowIndex, section: sectionIndex)) {
                    cells.append(cell)
                }
            }
        }
        return cells
    }
    /**
     * Returns totalRowHeight (height of all rows)
     */
    static var totalRowHeight:CGFloat = sections.enumerated().map { arg -> [(section:Int,row:Int)] in
        return arg.element.data.indices.map{ i in (section:arg.offset,row:i)}
        }.flatMap{$0}.reduce(0){
            return $0 + self.tableView(self, heightForRowAt: .init(row: $1.row, section: $1.section))
    }
}
#endif
