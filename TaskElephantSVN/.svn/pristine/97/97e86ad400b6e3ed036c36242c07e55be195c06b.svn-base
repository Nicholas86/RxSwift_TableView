//
//  TestTableViewCell.swift
//  TaskElephant
//
//  Created by apple on 17/4/14.
//  Copyright © 2017年 xiangguohe. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TestTableViewCell{
    //赋值
    func cellForCoachModel(model : CoachModel) -> Void {
        
        if let name : String = model.name {
            titleLabel.text! = name
        }
        
    }
    
}

