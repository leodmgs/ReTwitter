//
//  Datasource.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let data = ["DATA#1", "DATA#2", "DATA#3", "DATA#4", "DATA#5"]
    
    override func numberOfItems(_ section: Int) -> Int {
        return data.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return data[indexPath.item]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [HomeDataCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HomeHeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [HomeFooterCell.self]
    }
    
}
