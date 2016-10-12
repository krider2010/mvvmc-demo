//
//  MVVMCListViewModel.swift
//  MVVM-C
//
//  Created by Scotty on 21/05/2016.
//  Copyright © 2016 Streambyte Limited. All rights reserved.
//

import Foundation

class MVVMCListViewModel: ListViewModel {

    // Mark: - Events
    
    var didChange: ((ListViewModel) -> Void)?
    var didSelectDataItem: ((DataItem) -> Void)?
    
    
    // MARK: - Properties
    
    fileprivate var items: [DataItem]? {
        didSet {
            didChange?(self)
        }
    }
    
    var model: ListModel? {
        didSet {
            items = nil;
            model?.items({ (items) in
                self.items = items
            })
        }
    }
    
    var title: String {
        return "List"
    }
    
    var numberOfItems: Int {
        return items?.count ?? 0
    }
    
    
    // MARK: - Functions
    
    func itemAt(index: Int) -> DataItem? {
        if let items = items, items.count > index {
            return items[index]
        }
        return nil
    }
    
    func useItemAt(index: Int) {
        if let items = items, index < items.count {
            didSelectDataItem?(items[index])
        }
    }
}
