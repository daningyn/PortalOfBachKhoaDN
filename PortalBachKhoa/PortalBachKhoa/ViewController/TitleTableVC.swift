//
//  TitleTableVC.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/2/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class TitleTableVC: UITableViewController {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        let barButton = UIButton(frame: CGRectMake(0,0,20,20))
        barButton.setImage(UIImage(named: "toggle"), forState: .Normal)
        barButton.addTarget(self, action: #selector(self.clickToggle), forControlEvents: .TouchUpInside)
        let barItemButton = UIBarButtonItem(customView: barButton)
        self.navigationController?.navigationBar.hidden = false
        self.navigationItem.setRightBarButtonItem(barItemButton, animated: true)
        self.navigationItem.title = "Thông báo"
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
        return self.appDelegate.listTitleDate.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TitleCell", forIndexPath: indexPath) as! TitleCell
        cell.titleDate.text = self.appDelegate.listTitleDate[indexPath.row]
        cell.title.text = self.appDelegate.listTitle[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.appDelegate.currentDate = self.appDelegate.listTitleDate[indexPath.row]
        if indexPath.row < self.appDelegate.listTitleDate.count - 1 {
            self.appDelegate.nextDate = self.appDelegate.listTitleDate[indexPath.row + 1]
            self.appDelegate.nextTitle = self.appDelegate.listTitle[indexPath.row + 1]
        }else {
            self.appDelegate.nextDate = ""
            self.appDelegate.nextTitle = ""
        }
        self.appDelegate.currentTitle = self.appDelegate.listTitle[indexPath.row]
        let newsVC = NewsScrollVC()
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    //#MARK: - Selector define
    
    func clickToggle() {
        toggleSideMenuView()
    }

}
