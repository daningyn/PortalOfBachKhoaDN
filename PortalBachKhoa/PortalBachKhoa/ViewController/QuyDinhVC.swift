//
//  QuyDinhVC.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/4/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class QuyDinhVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let barButton = UIButton(frame: CGRect(x: 0,y: 0,width: 20,height: 20))
        barButton.setImage(UIImage(named: "toggle"), for: UIControlState())
        barButton.addTarget(self, action: #selector(self.clickToggle), for: .touchUpInside)
        let barItemButton = UIBarButtonItem(customView: barButton)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setLeftBarButton(barItemButton, animated: true)
        self.navigationItem.title = "Quy chế và quy định"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            UIApplication.shared.openURL(URL(string: Constant.kLINK_QUYCHE_1)!)
        case 1:
            UIApplication.shared.openURL(URL(string: Constant.kLINK_QUYCHE_2)!)
        case 2:
            UIApplication.shared.openURL(URL(string: Constant.kLINK_QUYCHE_3)!)
        default:
            UIApplication.shared.openURL(URL(string: Constant.kLINK_QUYCHE_4)!)
        }
    }
    
    func clickToggle() {
        toggleSideMenuView()
    }
    
}
