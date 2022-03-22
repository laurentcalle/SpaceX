//
//  MissionViewModel.swift
//  SpaceX
//
//  Created by Laurent Calle on 3/22/22.
//

import Foundation

struct MissionViewModel {
    
    let name : String
    let details: String
    let launchYear: String
    
    init(mission: MissionQueryQuery.Data.Launch) {
        name = mission.missionName ?? ""
        details = mission.details ?? ""
        launchYear = mission.launchYear ?? ""
    }
}
