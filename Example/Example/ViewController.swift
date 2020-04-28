//Created  on 2019/3/12 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */



import Foundation
import UIKit
import CaamDauIndexes
import CaamDauExtension
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    lazy var headers:[String] = {
        return ["选", "主"] + CD.atoz(true) + ["#"]
    }()
    
    lazy var indexesView: CD_IndexesView = {
        return CD_IndexesView()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.cd.add(indexesView)
        indexesView.snp.makeConstraints {
            $0.right.equalToSuperview().offset(10)
            $0.centerY.equalTo(tableView)
            $0.top.greaterThanOrEqualTo(tableView).offset(20)
        }
        indexesView.items = headers.map{ CD_IndexesView.Item(title:$0, color:.black)}
        //indexesView.firstIndex = 1
        indexesView.selectHandler = { [weak self](item, idx)in
            let i = self!.headers.index(of: item.title)!
            //self?.tableView.scrollToRow(at: IndexPath(row: 0, section: i), at: .top, animated: false)
        }
        
    }
}



