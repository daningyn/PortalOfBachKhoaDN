//
//  ParseThongBao.swift
//  PortalBachKhoa
//
//  Created by Danh Nguyen on 7/1/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import Foundation
import UIKit

protocol TitleStore {
    func getListTitleStore(listTitleDate: [String], listTitle: [String])
}

class ParseThongBao {
    
    var contributorsUrl: NSURL?
    var titleStoreDelegate: TitleStore?
    
    init(url: String) {
        self.contributorsUrl = NSURL(string: url)!
    }
    
    init() {
        self.contributorsUrl = nil
    }
    
    func setURL(url: String) {
        self.contributorsUrl = NSURL(string: url)
    }
    
    func loadThongBaoOnDaoTao() {
        var listTitleDate: [String] = []
        var listTitle: [String] = []
        if self.contributorsUrl != nil {
            let contributorsHtmlData = NSData(contentsOfURL: contributorsUrl!)
            let contributorsParser = TFHpple(HTMLData: contributorsHtmlData)
            var contributorsXpathQueryString: String = "//span[@style='font-size:13.0pt;line-height:100%;font-family:times new roman,serif;color:red']"
            var contributorsNodes: Array = contributorsParser.searchWithXPathQuery(contributorsXpathQueryString)
            for element in contributorsNodes {
                for i in (element as! TFHppleElement).children {
                    listTitleDate.append((i as! TFHppleElement).content)
                }
            }
            
            contributorsXpathQueryString = "//span[@style='font-size:13.0pt;line-height:100%;font-family:times new roman,serif']/span"
            contributorsNodes = contributorsParser.searchWithXPathQuery(contributorsXpathQueryString)
            for element in contributorsNodes {
                if (element as! TFHppleElement).firstChild?.content != nil {
                    listTitle.append((element as! TFHppleElement).firstChild.content)
                }
            }
            
            titleStoreDelegate?.getListTitleStore(listTitleDate, listTitle: listTitle)
            
//            contributorsXpathQueryString = "//body"
//            contributorsNodes = contributorsParser.searchWithXPathQuery(contributorsXpathQueryString)
//            var check = false
//            for element in contributorsNodes {
//                for i in (element as! TFHppleElement).children {
////                    for j in (i as! TFHppleElement).children {
////                        print("Element: \(j)")
////                    }
////                    print((i as! TFHppleElement).firstChild.firstChild.firstChild)
//                    if (i as! TFHppleElement).tagName == "p" {
//                        if (i as! TFHppleElement).firstChild.firstChild.firstChild.content == "27/05/2016:" {
////                            print("\((i as! TFHppleElement).firstChild.firstChild.firstChild.content)")
//                            check = true
//                            continue
//                        }else if (i as! TFHppleElement).firstChild.firstChild.firstChild.content == "26/05/2016:" {
//                            check = false
//                            break
//                        }
//                    }
//                    if check == true {
////                        print((i as! TFHppleElement).tagName)
//                        loadChild(i as! TFHppleElement)
//                    }
//                }
//            }
//        }
//    }
//    
//    func loadChild(element: TFHppleElement) {
////        print(element.children.count)
//        if element.children.count == 0 && element.content != nil {
////            print(element)
//            print(element.content)
//        }else {
//            for i in element.children {
//                if element.tagName == "a" {
//                    print(element.attributes["href"])
//                }
//                loadChild(i as! TFHppleElement)
//            }
        }
    }
    
}