//
//  TitleTableVC.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/2/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class TitleTableVC: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TitleCell", bundle: nil), forCellReuseIdentifier: "TitleCell")
        let barButton = UIButton(frame: CGRect(x: 0,y: 0,width: 20,height: 20))
        barButton.setImage(UIImage(named: "toggle"), for: UIControlState())
        barButton.addTarget(self, action: #selector(self.clickToggle), for: .touchUpInside)
        let barItemButton = UIBarButtonItem(customView: barButton)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setRightBarButton(barItemButton, animated: true)
        self.navigationItem.title = "Thông báo"
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
        return self.appDelegate.listTitleDate.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
        cell.titleDate.text = self.appDelegate.listTitleDate[indexPath.row]
        cell.title.text = self.appDelegate.listTitle[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
