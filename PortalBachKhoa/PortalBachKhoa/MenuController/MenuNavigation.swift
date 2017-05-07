//
//  MenuNavigation.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/1/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class MenuNavigation: ENSideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewController(withIdentifier: "MenuTableVC") as! MenuTableVC
        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menu, menuPosition: .left, blurStyle: .light)
        
        sideMenu?.menuWidth = 180.0
        
        self.view.bringSubview(toFront: self.navigationBar)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
