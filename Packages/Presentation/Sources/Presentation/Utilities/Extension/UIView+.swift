//
//  UIView+.swift
//  Presentation
//
//  Created by Yuki Okudera on 2022/04/03.
//

import UIKit

extension UIView {
    func pinEdgesToSuperview() {
        guard let superview = self.superview else {
            return
        }
        let constraintAttributes: [NSLayoutConstraint.Attribute] = [.left, .right, .top, .bottom]
        let constraints = constraintAttributes.map {
            NSLayoutConstraint(
                item: self,
                attribute: $0,
                relatedBy: .equal,
                toItem: superview,
                attribute: $0,
                multiplier: 1.0,
                constant: .zero
            )
        }
        superview.addConstraints(constraints)
    }
}
