//
//  History.swift
//  outdoor_io
//
//  Created by Roderic Kong on 11/25/19.
//  Copyright © 2019 Roderic Kong. All rights reserved.
//

import UIKit

class History: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    let trips = Model.I.getAllTrips() ?? []
    
    var trip_selection: Trip? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard indexPath.row < self.trips.count else {
            return cell
        }
        let trip = self.trips[indexPath.row]
        cell.textLabel?.text = trip.name
        for pin in trip.pins ?? [] {
            cell.imageView?.image = pin.getThumb()
            break // only one image needed for preview
        }
        return cell
    }

    @IBAction func unwind_to_history(_ sender: UIStoryboardSegue){}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < trips.count else {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        self.trip_selection = trips[indexPath.row]
        guard let _ = self.trip_selection?.pins else {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        performSegue(withIdentifier: "index_of_trip", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "index_of_trip"){
            let vc = segue.destination as! history_pin
            vc.pins = self.trip_selection?.pins ?? []
        }
    }
}
