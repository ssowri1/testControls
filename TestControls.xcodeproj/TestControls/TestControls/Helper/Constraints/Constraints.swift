//
//  Constraints.swift
//  TestControls
//
//  Created by Sowrirajan S on 27/11/18.
//  Copyright © 2018 Sowrirajan S. All rights reserved.
//

import Foundation
import UIKit
struct Constraints {
    let item: Any
    let attribute: NSLayoutAttribute
    let relatedBy: NSLayoutRelation
    let toItem: Any
    let toAttribute: NSLayoutAttribute
    let multiplier: CGFloat
    let constant: CGFloat
    init (item: Any, attribute: NSLayoutAttribute, relatedBy: NSLayoutRelation, toItem: Any, toAttribute: NSLayoutAttribute, multiplier: CGFloat, constant: CGFloat)
    {
        self.item = item
        self.attribute = attribute
        self.relatedBy = relatedBy
        self.toItem = toItem
        self.toAttribute = toAttribute
        self.multiplier = multiplier
        self.constant = constant
    }
    func setConstraint() -> [NSLayoutConstraint] {
        let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20)
        let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -20)
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        return [leading, trailing, top]
    }
}
