//
//  MRTTableViewCell.swift
//  MRT-Stations
//
//  Created by RAY on 2016/5/9.
//  Copyright © 2016年 RAY. All rights reserved.
//

import UIKit

class MRTTableViewCell: UITableViewCell {

	@IBOutlet weak var Stationname: UILabel!
	@IBOutlet weak var line1: UILabel!
	@IBOutlet weak var line2: UILabel!
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
