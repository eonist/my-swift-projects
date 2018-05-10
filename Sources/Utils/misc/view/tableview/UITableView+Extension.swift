#if os(iOS)
import UIKit
extension UITableView {
    /**
     * EXAMPLE: UITableView.cells(tableView: tableView)//list of cells in a tableview
     */
    static func cells(tableView:UITableView) -> [UITableViewCell]{
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
}
#endif
