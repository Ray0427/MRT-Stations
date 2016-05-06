//
//  MRTStation.swift
//  MRT-Stations
//
//  Created by RAY on 2016/5/6.
//  Copyright © 2016年 RAY. All rights reserved.
//

import Foundation

struct Station {
	var name: String
	var coordinate: [Float]
	var lines: [String: String]

}

struct StationLine {
	var name: String
	var stations: [Station]
}