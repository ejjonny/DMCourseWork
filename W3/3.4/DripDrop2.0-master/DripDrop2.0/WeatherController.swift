//
//  WeatherController.swift
//  DripDrop2.0
//
//  Created by DevMountain on 12/13/18.
//  Copyright © 2018 trevorAdcock. All rights reserved.
//

import Foundation

class WeatherController{
    
    static let baseUrl = URL(string: "https://api.darksky.net/forecast")
    private static let apiSecret = "8940fc22c0ed6b892125705b44e40965"
	
	static func fetchWeatherAt(latitude: Double, longitude: Double, completion: @escaping (WeatherService?) -> Void) {
		guard let url = baseUrl?.appendingPathComponent(apiSecret).appendingPathComponent("\(latitude)\(longitude)") else { completion(nil); return }
		var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
		components?.queryItems = [URLQueryItem(name: "exclude", value: "minutely,hourly,alerts,flags")]
		guard let finalUrl = components?.url else { completion(nil); return }
		
		let request = URLRequest(url: finalUrl)
		print("\(request.url?.absoluteString)")
		
		URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let error = error { print(error); completion(nil); return }
			print(response)
			
			guard let data = data else { completion(nil); return }
			do {
				let decoder = JSONDecoder()
				let weatherService = try decoder.decode(WeatherService.self, from: data)
				completion(weatherService)
			} catch {
				print("There was an error", error, error.localizedDescription)
			}
		}
	}
}
