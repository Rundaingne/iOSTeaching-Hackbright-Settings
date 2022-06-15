//
//  SettingsController.swift
//  Settings
//
//  Created by Erich Kumpunen on 6/14/22.
//

import Foundation
import UIKit

class SettingsController {
    
    // Singleton (don't make multiple copies of the same source of truth!!)
    static let shared = SettingsController()
    private init() {}
    
    // Source of truth
    let settings: [Setting] = {
        let music = Setting(settingName: "Music", icon: UIImage(systemName: "music.note.list")!)
        let userSettings = Setting(settingName: "Settings", icon: UIImage(systemName: "gearshape")!)
        let friends = Setting(settingName: "Friends", icon: UIImage(systemName: "person.3.fill")!)
        return [music, userSettings, friends]
    }()
        
    // Controller Functions (Crud):
    func toggleIsOn(for setting: Setting) {
//        setting.isOn = !setting.isOn
        setting.isOn.toggle()
        // the two lines above both do the same thing. Choose whichever one makes most sense in your brain.
    }
}
