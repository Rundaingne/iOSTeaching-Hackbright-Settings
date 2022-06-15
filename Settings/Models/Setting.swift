//
//  Setting.swift
//  Settings
//
//  Created by Erich Kumpunen on 6/14/22.
//

import Foundation
import UIKit

class Setting {
    let settingName: String
    var isOn: Bool
    let icon: UIImage
    
    init(settingName: String, isOn: Bool = false, icon: UIImage) {
        self.settingName = settingName
        self.isOn = isOn
        self.icon = icon
    }
    
}
