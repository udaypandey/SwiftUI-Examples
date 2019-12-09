//
//  SimplePageViewController.swift
//  WrappedViewController
//
//  Created by Uday Pandey on 09/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation
import SwiftUI

// A simple page view controller. Everything inside Page View Controller is also from UIKit
struct SimplePageViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator

        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        let v = ColoredViewController()
        v.view.backgroundColor = .red

        pageViewController.setViewControllers([v], direction: .forward, animated: false)
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    class ColoredViewController: UIViewController {
        var tag = 0
    }

    @objc class Coordinator: NSObject, UIPageViewControllerDataSource {
        let elements = 10

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let coloredVc = viewController as? ColoredViewController else {
                return nil
            }

            guard coloredVc.tag > 0 else {
                return nil
            }

            let vc = ColoredViewController()
            vc.tag = coloredVc.tag - 1

            if vc.tag % 2 == 0 {
                vc.view.backgroundColor = .red
            } else {
                vc.view.backgroundColor = .green
            }

            return vc
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let coloredVc = viewController as? ColoredViewController else {
                return nil
            }

            guard coloredVc.tag < elements - 1 else {
                return nil
            }

            let vc = ColoredViewController()
            vc.tag = coloredVc.tag + 1

            if vc.tag % 2 == 0 {
                vc.view.backgroundColor = .red
            } else {
                vc.view.backgroundColor = .green
            }

            return vc
        }
    }
}
