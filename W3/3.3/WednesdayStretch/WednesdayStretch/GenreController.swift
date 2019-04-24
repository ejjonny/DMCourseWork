//
//  GenreController.swift
//  WednesdayStretch
//
//  Created by Ethan John on 2/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class GenreController {
	
	static let shared = GenreController()
	
	var genres: [Genre] = []
	
	var baseURL = URL(string: "https://binaryjazz.us/wp-json/genrenator/v1/genre/")
	
	func getGenre(numberOfGenres: Int, completion: @escaping (([Genre?]) -> Void)) {
		guard let baseURL = baseURL else { completion([]); return }
		let finalURL = baseURL.appendingPathComponent(String(numberOfGenres))
		
		let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
			if let error = error { print("Datatask recieved an error \(error): \(error.localizedDescription)"); completion([]); return }
			guard let data = data else { print("Data recieved was nil"); completion([]); return }
			
			print(String(bytes: data, encoding: .utf8)!)
			do {
				let decoder = JSONDecoder()
				let genres = try decoder.decode(String, from: data)
				self.genres = genres
				completion(genres)
			} catch {
				print("What happened", error, error.localizedDescription)
			}
		}
		dataTask.resume()
	}
}
