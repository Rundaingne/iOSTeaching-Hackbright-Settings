//
//  SettingsTableViewCell.swift
//  Settings
//
//  Created by Erich Kumpunen on 6/14/22.
//

import UIKit

// Define what work the view (the cell) wants done. This is the protocol. ONLY define it, don't write out the functionality.
protocol SettingCellDelegate: AnyObject {
    func settingSwitchTapped(for cell: SettingsTableViewCell) // NO { } braces, only the function declaration/definition goes here
}

class SettingsTableViewCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var settingIcon: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    // MARK: delegate, the thing that does work for the view (in this case, the SettingTableViewCell)
    weak var delegate: SettingCellDelegate?
    // make optional, and weak
    
    @IBAction func didToggleSwitch(_ sender: Any) {
        // define an action to perform when the switch is toggled. I.E. tell the delegate to do some work for us.
        delegate?.settingSwitchTapped(for: self)
    }
    
    // MARK: View functions
    func updateView(with setting: Setting) {
        settingIcon.image = setting.icon
        settingNameLabel.text = setting.settingName
        settingSwitch.isOn = setting.isOn
        self.backgroundColor = setting.isOn ? .cyan : .white
    }

}
