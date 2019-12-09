//
//  HybridPageViewController.swift
//  WrappedViewController
//
//  Created by Uday Pandey on 09/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import Foundation
import SwiftUI

// This one is similar to Apple Landmark example. We use a PageViewController but
// we use a SwiftUI inside the individual pages instead

struct SimpleTextView: View {
    let tag: Int
    var body: some View {
        Text("Hello World")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(tag % 2 == 0 ? Color.green: Color.red)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SimpleTextView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTextView(tag: 0)
    }
}

struct HybridPageViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator

        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        let newTextView = SimpleTextView(tag: 0)
        let v = UIHostingController<SimpleTextView>(rootView: newTextView)

        pageViewController.setViewControllers([v], direction: .forward, animated: false)
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    @objc class Coordinator: NSObject, UIPageViewControllerDataSource {
        let elements = 10

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let vc = viewController as? UIHostingController<SimpleTextView> else {
                return nil
            }

            let textView = vc.rootView

            guard textView.tag > 0 else {
                return nil
            }

            let newTextView = SimpleTextView(tag: textView.tag - 1)
            return UIHostingController<SimpleTextView>(rootView: newTextView)
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let vc = viewController as? UIHostingController<SimpleTextView> else {
                return nil
            }

            let textView = vc.rootView

            guard textView.tag < elements - 1 else {
                return nil
            }

            let newTextView = SimpleTextView(tag: textView.tag + 1)
            return UIHostingController<SimpleTextView>(rootView: newTextView)
        }
    }
}
