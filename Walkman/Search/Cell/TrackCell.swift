//
//  TrackCell.swift
//  Walkman
//
//  Created by Alexander Skrypnyk on 13.01.2020.
//  Copyright © 2020 Alexander Skrypnyk. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    @IBOutlet weak var trackImageView: UIImageView!
    
    static let reuseId = "TrackCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
