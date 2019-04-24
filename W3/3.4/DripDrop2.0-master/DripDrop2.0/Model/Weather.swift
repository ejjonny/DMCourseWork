//
//  Weather.swift
//  DripDrop2.0
//
//  Created by DevMountain on 12/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation

struct WeatherService: Codable {
	let daily: DailyService
	let currently: CurrentWeather
}

struct DailyService: Codable {
	let data: DailyWeather
}

struct DailyWeather: Codable {
	let icon: String
	let summary: String
	let temperatureHigh: Double
	let temperatureLow: Double
}

struct CurrentWeather: Codable {
	let icon: String
	let summary: String
	let temperature: Double
}
