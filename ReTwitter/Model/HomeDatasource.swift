//
//  Datasource.swift
//  ReTwitter
//
//  Created by Leonardo Domingues on 12/12/18.
//  Copyright © 2018 Leonardo Domingues. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let data = [
        "Steve Jobs",
        "Niel DeGrasse",
        "Leonardo Domingues",
        "Stephen Hawking",
        "Elon Musk"
    ]
    
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
