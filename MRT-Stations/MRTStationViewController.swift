//
//  MRTStationViewController.swift
//  MRT-Stations
//
//  Created by RAY on 2016/5/6.
//  Copyright © 2016年 RAY. All rights reserved.
//

import UIKit

class MRTStationViewController: UIViewController {

	@IBOutlet weak var stationName: UILabel!
	@IBOutlet weak var line1: UILabel!
	@IBOutlet weak var line2: UILabel!

	var station: Station? {
		didSet(newStation) {
			if self.isViewLoaded() {
				self.updateValue()
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.updateValue()
		// Do any additional setup after loading the view.
	}
	func updateValue() {
		guard self.isViewLoaded() else {
			return
		}
		let line = Array(station!.lines)
		self.title = station?.name
		self.stationName?.text = station?.name
		self.line1?.text = line[0].0
		self.line1?.backgroundColor = lineColor[line[0].0]
		if (line.count == 2) {
			self.line2?.text = line[1].0
			self.line2.hidden = false
			self.line2?.backgroundColor = lineColor[line[1].0]

		} else {
			self.line2.hidden = true
		}
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */

}
