//
//  MenuTableVC.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/1/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class MenuTableVC: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.scrollsToTop = false
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
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
            let destViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainTableView")
            sideMenuController()?.setContentViewController(destViewController)
        case 1:
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let destViewController = mainStoryboard.instantiateViewController(withIdentifier: "QuyDinhVC")
            sideMenuController()?.setContentViewController(destViewController)
        default:
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let destViewController = mainStoryboard.instantiateViewController(withIdentifier: "AboutUsVC")
            sideMenuController()?.setContentViewController(destViewController)
        }
    }
    
    //#MARK: - Protocol define
    
    

}
