//
//  AlbumTableViewCell.swift
//  iOSAdvancedUI
//
//  Created by Michal on 11/11/16.
//  Copyright © 2016 Michal. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
