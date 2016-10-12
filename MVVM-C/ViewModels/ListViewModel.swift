//
//  ListViewModel.swift
//  MVVM-C
//
//  Created by Scotty on 21/05/2016.
//  Copyright © 2016 Streambyte Limited. All rights reserved.
//

import Foundation

protocol ListViewModel {
    
    var didChange: ((ListViewModel) -> Void)? { get set }
    var didSelectDataItem: ((DataItem) -> Void)? { get set }
    
    var model: ListModel? { get set }
    
    var title: String { get }
    
    var numberOfItems: Int { get }
    func itemAt(index: Int) -> DataItem?
    func useItemAt(index: Int)
}
