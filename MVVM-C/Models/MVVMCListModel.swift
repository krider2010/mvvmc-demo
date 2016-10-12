//
//  MVVMCListModel.swift
//  MVVM-C
//
//  Created by Scotty on 21/05/2016.
//  Copyright © 2016 Streambyte Limited. All rights reserved.
//

import Foundation

class MVVMCListModel: ListModel {
    fileprivate var items: [DataItem] = [
        MVVMCDataItem(name: "James T Kirk", role: "Captain"),
        MVVMCDataItem(name: "Spock", role: "Commander"),
        MVVMCDataItem(name: "Leonard McCoy", role: "Lieutenant Commander"),
        MVVMCDataItem(name: "Montgomery Scott", role: "Lieutenant Commander"),
        MVVMCDataItem(name: "Uhura", role: "Lieutenant"),
        MVVMCDataItem(name: "Hikaru Sulu", role: "Lieutenant"),
        MVVMCDataItem(name: "Pavel Chekov", role: "Ensign")
    ]
        
    func items(_ completionHandler: @escaping (_ items: [DataItem]) -> Void) {
        // Simulate Aysnchronous data access
        DispatchQueue.global().async {
            completionHandler(self.items)
        }
    }
}

class TestableMVVMCListModel: MVVMCListModel {
    // Having async in here makes this very untestable as the expectation cannot easily be inserted!
    override func items(_ completionHandler: @escaping (_ items: [DataItem]) -> Void) {
        completionHandler(self.items)
    }
}
