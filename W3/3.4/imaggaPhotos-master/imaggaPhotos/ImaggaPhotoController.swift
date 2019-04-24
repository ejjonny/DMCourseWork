//
//  ImaggaPhotoController.swift
//  imaggaPhotos
//
//  Created by Ethan John on 2/7/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class ImaggaPhotoController {
	
	static let shared = ImaggaPhotoController()
	static let baseUrl = URL(string: "https://api.imagga.com")!
	
	func upload(photo: UIImage, completion: @escaping () -> Void) {
		let uploadUrl = ImaggaPhotoController.baseUrl.appendingPathComponent("uploads")
		guard let imageData = #imageLiteral(resourceName: "Group 3").pngData() else { completion(); return }
		var urlComponents = URLComponents(url: uploadUrl, resolvingAgainstBaseURL: true)
		let base64Image = imageData.base64EncodedString()
		urlComponents?.queryItems = [URLQueryItem(name: "image_base64", value: base64Image)]
		guard let finalUrl = urlComponents?.url else { return }
		var request = URLRequest(url: uploadUrl)
		request.httpMethod = "POST"
		let header = [ "Authorization": "Basic YWNjXzIxZTVkMTFjZTBlYjgyYjo1Nzg0MjI5MTJkMGQyNWY4NmU4MmRkOTdkZDc2ZmZiZg=="]
		request.allHTTPHeaderFields = header
		let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let error = error { print(error); completion(); return }
			print(response)
			print(data)
		}
		dataTask.resume()
	}
}
