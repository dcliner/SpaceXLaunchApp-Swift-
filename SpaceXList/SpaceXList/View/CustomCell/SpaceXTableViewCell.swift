//
//  SpaceXTableViewCell.swift
//  SpaceXList
//
//  Created by Derefaa Cline on 12/28/22.
//

import UIKit

class SpaceXTableViewCell: UITableViewCell {
    @IBOutlet weak var Name:UILabel!
    @IBOutlet weak var Description:UILabel!
    @IBOutlet weak var LaunchTime:UILabel!
    @IBOutlet weak var Success:UILabel!
    
    var spaceXdata:SpaceXModel?{
        didSet{
            Name.text = spaceXdata?.name
            Description.text = spaceXdata?.details
            LaunchTime.text = (spaceXdata?.date_utc?.description)
            if spaceXdata?.success == true {
                Success.text = "Success"
            } else {Success.text = "Failure"}
            
        }
    }
    

   
    
}
