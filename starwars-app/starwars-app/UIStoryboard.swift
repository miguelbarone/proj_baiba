//
//  UIStoryboard.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 16/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func instantiate(name: Storyboards, bundle: Bundle?) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: bundle)
    }
}
