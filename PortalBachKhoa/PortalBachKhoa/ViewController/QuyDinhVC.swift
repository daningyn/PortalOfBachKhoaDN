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

        let barButton = UIButton(frame: CGRectMake(0,0,20,20))
        barButton.setImage(UIImage(named: "toggle"), forState: .Normal)
        barButton.addTarget(self, action: #selector(self.clickToggle), forControlEvents: .TouchUpInside)
        let barItemButton = UIBarButtonItem(customView: barButton)
        self.navigationController?.navigationBar.hidden = false
        self.navigationItem.setLeftBarButtonItem(barItemButton, animated: true)
        self.navigationItem.title = "Quy chế và quy định"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            UIApplication.sharedApplication().openURL(NSURL(string: Constant.kLINK_QUYCHE_1)!)
        case 1:
            UIApplication.sharedApplication().openURL(NSURL(string: Constant.kLINK_QUYCHE_2)!)
        case 2:
            UIApplication.sharedApplication().openURL(NSURL(string: Constant.kLINK_QUYCHE_3)!)
        default:
            UIApplication.sharedApplication().openURL(NSURL(string: Constant.kLINK_QUYCHE_4)!)
        }
    }
    
    func clickToggle() {
        toggleSideMenuView()
    }
    
}
