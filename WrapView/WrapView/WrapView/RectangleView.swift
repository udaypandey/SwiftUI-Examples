//
//  RectangleView.swift
//  WrapView
//
//  Created by Uday Pandey on 06/12/2019.
//  Copyright © 2019 Thirstysea Ltd. All rights reserved.
//

import UIKit
import SwiftUI

struct RectangleView: UIViewRepresentable {
    let color: UIColor

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = color
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
    }

    static func dismantleUIView(_ view: UIView, coordinator: Coordinator) {
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }

    struct Coordinator {
    }
}
