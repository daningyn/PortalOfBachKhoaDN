//
//  MainTableView.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/3/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class MainTableView: UITableViewController, TitleStore, LinkASPStore {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "MainCell")
        let barButton = UIButton(frame: CGRect(x: 0,y: 0,width: 20,height: 20))
        barButton.setImage(UIImage(named: "toggle"), for: UIControlState())
        barButton.addTarget(self, action: #selector(self.clickToggle), for: .touchUpInside)
        let barItemButton = UIBarButtonItem(customView: barButton)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setLeftBarButton(barItemButton, animated: true)
        self.navigationItem.title = "University DaNang Portal"
        
        let parseLink = ParseTitle(url: Constant.kLINK_DAOTAO)
        parseLink.linkASPStoreDelegate = self
        parseLink.loadTitleOnDaoTao()
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width / 2.5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let parseThongBao = ParseThongBao(url: "\(Constant.kLINK_DAOTAO)\(self.appDelegate.listLinkASP[indexPath.row])")
        self.appDelegate.currentLink = "\(Constant.kLINK_DAOTAO)\(self.appDelegate.listLinkASP[indexPath.row])"
        parseThongBao.titleStoreDelegate = self
        parseThongBao.loadThongBaoOnDaoTao()
        self.performSegue(withIdentifier: "MainToTitle", sender: nil)
    }
    
    //#MARK: - Define target
    
    func clickToggle() {
        toggleSideMenuView()
    }
    
    //#MARK: - Define protocol
    
    func getListTitleStore(_ listTitleDate: [String], listTitle: [String]) {
        self.appDelegate.listTitleDate = listTitleDate
        self.appDelegate.listTitle = listTitle
    }
    
    func getListLinkAPS(_ listLink: [String]) {
        self.appDelegate.listLinkASP = listLink
    }

}
