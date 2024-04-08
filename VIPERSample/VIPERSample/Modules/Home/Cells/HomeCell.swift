//
//  HomeCell.swift
//  SampleViperArch
//
//  Created by Shariq on 2023-10-25.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupData(data: HomeModel) {
        lblTitle.text = data.universityName
        lblDesc.text = data.countryName
    }
    
}
