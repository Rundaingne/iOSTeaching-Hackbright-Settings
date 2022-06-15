//
//  SettingsViewController.swift
//  Settings
//
//  Created by Erich Kumpunen on 6/14/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Make sure you tell the tableView WHO its delegate is, and who is providing its data
        // Must be done in the viewDidLoad or viewWillLoad lifeCycle functions
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsController.shared.settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Type casting: Say what TYPE of UITableViewCell you want to show, if you have a custom one.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        let setting = SettingsController.shared.settings[indexPath.row]
        cell.updateView(with: setting)
        // set your cell delegate!! The cell needs to know WHO is doing the work for it. "self", here, means the SettingsViewController.
        cell.delegate = self
        return cell
    }
}

extension SettingsViewController: SettingCellDelegate {
    
    // Conform to the protocol
    func settingSwitchTapped(for cell: SettingsTableViewCell) {
        // Grab your indexPath
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        // grab your object to update (in this case, a setting, from our source of truth)
        let setting = SettingsController.shared.settings[indexPath.row]
        // do the actual work, update your object
        SettingsController.shared.toggleIsOn(for: setting)
        // Work done. Now, tell the view to update itself
        cell.updateView(with: setting)
    }
}
