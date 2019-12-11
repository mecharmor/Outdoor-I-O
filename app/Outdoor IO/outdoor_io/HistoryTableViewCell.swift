//
//  HistoryTableViewCell.swift
//  outdoor_io
//
//  Created by Cory Lewis on 12/8/19.
//  Copyright © 2019 SCMACEXT-00. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var coordinates: UILabel!
    
    
    var trips = Model.I.getAllTrips()
    
    func get_trip() -> Array<Any>{
        for trip in trips! {
            for pin in trip.pins!{
                    
            
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
