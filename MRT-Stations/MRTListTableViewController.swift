//
//  MRTListTableViewController.swift
//  MRT-Stations
//
//  Created by RAY on 2016/5/6.
//  Copyright © 2016年 RAY. All rights reserved.
//

import UIKit
import ObjectMapper
class MRTListTableViewController: UITableViewController {
	var stationData: [Station]!
	var lines: [String] = []
	var lineDict: [String: [Station]] = [:]

	override func viewDidLoad() {
		super.viewDidLoad()

		let bundle = NSBundle.mainBundle()
		let MRTJson = bundle.pathForResource("MRT", ofType: "json")!
		let data = try?String(contentsOfFile: MRTJson)
		let stations = Mapper<Station>().mapArray(data)

		for station in stations! {
			for line in station.lines {
				if lineDict[line.0] == nil {
					self.lines.append(line.0)
					lineDict[line.0] = []
				}
				self.lineDict[line.0]!.append(station)
			}
		}
		self.stationData = stations
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return self.lineDict.count
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return self.lineDict[self.lines[section]]!.count
	}
	override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = tableView.dequeueReusableCellWithIdentifier("Header")
		header!.textLabel?.text = self.lines[section]
		return header
	}
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MRTTableViewCell
		let station = self.lineDict[self.lines[indexPath.section]]![indexPath.row]
		cell.Stationname?.text = station.name

		// print(station)
		let line = Array(station.lines)

		cell.line1?.backgroundColor = lineColor[line[0].0]
		cell.line1?.layer.masksToBounds = true
		cell.line1?.layer.cornerRadius = 6.0
		cell.line1?.text = line[0].1

		if (line.count == 2) {
			cell.line2?.backgroundColor = lineColor[line[1].0]
			cell.line2?.layer.masksToBounds = true
			cell.line2?.layer.cornerRadius = 6.0
			cell.line2?.hidden = false
			cell.line2?.text = line[1].1
		} else {
			cell.line2?.hidden = true
		}
		// Configure the cell...

		return cell
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "ShowDetail" {
			let cell = sender as! MRTTableViewCell
			let indexPath = self.tableView.indexPathForCell(cell)
			let station = self.lineDict[self.lines[indexPath!.section]]![indexPath!.row]
			let stationViewController = segue.destinationViewController as! MRTStationViewController
			stationViewController.station = station

		}
	}
	/*
	 // Override to support conditional editing of the table view.
	 override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	 // Return false if you do not want the specified item to be editable.
	 return true
	 }
	 */

	/*
	 // Override to support editing the table view.
	 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
	 if editingStyle == .Delete {
	 // Delete the row from the data source
	 tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
	 } else if editingStyle == .Insert {
	 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	 }
	 }
	 */

	/*
	 // Override to support rearranging the table view.
	 override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

	 }
	 */

	/*
	 // Override to support conditional rearranging of the table view.
	 override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	 // Return false if you do not want the item to be re-orderable.
	 return true
	 }
	 */

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */

}
