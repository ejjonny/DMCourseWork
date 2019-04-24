//
//  OnboardingViewController.swift
//  Onboarding
//
//  Created by Ethan John on 3/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController {

	let allViewControllers: [UIViewController] = [
		UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Explanation"),
		UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Features"),
		UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Signup")
	]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		dataSource = self
		setViewControllers([allViewControllers.first!], direction: .forward, animated: true, completion: nil)
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource {
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		
		guard let index = allViewControllers.firstIndex(of: viewController) else { return nil }
		guard index > 0 else { return nil }
		return allViewControllers[index - 1]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		
		guard let index = allViewControllers.firstIndex(of: viewController) else { return nil }
		guard index + 1 < allViewControllers.count else { return nil }
		return allViewControllers[index + 1]
	}
}
