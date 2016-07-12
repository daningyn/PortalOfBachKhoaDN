//
//  MainTableView.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/3/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class MainTableView: UITableViewController, TitleStore, LinkASPStore {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "MainCell")
        let barButton = UIButton(frame: CGRectMake(0,0,20,20))
        barButton.setImage(UIImage(named: "toggle"), forState: .Normal)
        barButton.addTarget(self, action: #selector(self.clickToggle), forControlEvents: .TouchUpInside)
        let barItemButton = UIBarButtonItem(customView: barButton)
        self.navigationController?.navigationBar.hidden = false
        self.navigationItem.setLeftBarButtonItem(barItemButton, animated: true)
        self.navigationItem.title = "University DaNang Portal"
        
        let parseLink = ParseTitle(url: Constant.kLINK_DAOTAO)
        parseLink.linkASPStoreDelegate = self
        parseLink.loadTitleOnDaoTao()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.appDelegate.currentDate = ""
        self.appDelegate.nextDate = ""
        self.appDelegate.currentLink = ""
        self.appDelegate.currentTitle = ""
        self.appDelegate.nextTitle = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UIScreen.mainScreen().bounds.width / 2.5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath) as! MainCell
        switch indexPath.row {
        case 0:
            cell.img.image = UIImage(named: "thong-bao-chung")
        case 1:
            cell.img.image = UIImage(named: "thong-bao-lop-hp")
        case 2:
            cell.img.image = UIImage(named: "thong-bao-khoa-moi")
        default:
            cell.img.image = UIImage(named: "thong-bao-do-an-tn")
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let parseThongBao = ParseThongBao(url: "\(Constant.kLINK_DAOTAO)\(self.appDelegate.listLinkASP[indexPath.row])")
        self.appDelegate.currentLink = "\(Constant.kLINK_DAOTAO)\(self.appDelegate.listLinkASP[indexPath.row])"
        parseThongBao.titleStoreDelegate = self
        parseThongBao.loadThongBaoOnDaoTao()
        self.performSegueWithIdentifier("MainToTitle", sender: nil)
    }
    
    //#MARK: - Define target
    
    func clickToggle() {
        toggleSideMenuView()
    }
    
    //#MARK: - Define protocol
    
    func getListTitleStore(listTitleDate: [String], listTitle: [String]) {
        self.appDelegate.listTitleDate = listTitleDate
        self.appDelegate.listTitle = listTitle
    }
    
    func getListLinkAPS(listLink: [String]) {
        self.appDelegate.listLinkASP = listLink
    }

}
