//
//  MissionTableViewCell.swift
//  SpaceX
//
//  Created by Laurent Calle on 3/20/22.
//

import UIKit

class MissionTableViewCell: UITableViewCell {
    
    var missionViewModel : MissionViewModel! {
        didSet{
            missionNameLbl.text = missionViewModel.name
            missionYearLbl.text = missionViewModel.launchYear
            missionDescriptionLbl.text = missionViewModel.details
        }
    }

    @IBOutlet weak var missionNameLbl: UILabel!
    @IBOutlet weak var missionYearLbl: UILabel!
    @IBOutlet weak var missionDescriptionLbl: UILabel!
  
}
