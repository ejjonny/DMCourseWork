//
//  ParentViewController.swift
//  Onboarding
//
//  Created by Ethan John on 3/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

	static let pageSwipedNotification = Notification.Name(rawValue: "pageSwipedNotification")
	static let pageIndexKey = "pageIndex"
	
	@IBOutlet weak var pageControl: UIPageControl!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		NotificationCenter.default.addObserver(forName: ParentViewController.pageSwipedNotification, object: nil, queue: .main) { (notification) in
			guard let userInfo = notification.userInfo,
				let currentPageIndex = userInfo[ParentViewController.pageIndexKey] as? Int else { return }
			self.pageControl.currentPage = currentPageIndex
			
		}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
