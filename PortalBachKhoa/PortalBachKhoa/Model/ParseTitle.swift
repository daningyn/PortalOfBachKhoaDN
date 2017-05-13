//
//  ParseTitle.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/1/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import Foundation
import UIKit

protocol LinkASPStore {
    func getListLinkAPS(_ listLink: [String])
}

class ParseTitle {
    
    var contributorsUrl: URL?
    var linkASPStoreDelegate: LinkASPStore?
    
    init(url: String) {
        self.contributorsUrl = URL(string: url)!
    }
    
    init() {
        self.contributorsUrl = nil
    }
    
    func setURL(_ url: String) {
        self.contributorsUrl = URL(string: url)
    }
    
    func loadTitleOnDaoTao() {
        var listLinkASP: [String] = []
        if self.contributorsUrl != nil {
            let contributorsHtmlData = try? Data(contentsOf: contributorsUrl!)
            let contributorsParser = TFHpple(htmlData: contributorsHtmlData)
            let contributorsXpathQueryString: String = "//iframe"
            let contributorsNodes: Array = contributorsParser!.search(withXPathQuery: contributorsXpathQueryString)
            for element in contributorsNodes {
                listLinkASP.append((element as! TFHppleElement).attributes["src"]! as! String)
            }
            listLinkASP.removeLast()
            linkASPStoreDelegate?.getListLinkAPS(listLinkASP)
            
        }
    }
    
}
