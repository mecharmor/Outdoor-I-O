//
//  History.swift
//  outdoor_io
//
//  Created by Roderic Kong on 11/25/19.
//  Copyright © 2019 Roderic Kong. All rights reserved.
//

import UIKit

class history_pin: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var pins: [Pin] = []
    var selected_pin: Pin? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pins.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard indexPath.row < self.pins.count else {
            return cell
        }
        let pin = self.pins[indexPath.row]
        cell.textLabel?.text = pin.msg
        cell.imageView?.image = pin.getThumb()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < self.pins.count else {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        self.selected_pin = self.pins[indexPath.row]
        performSegue(withIdentifier: "history_pin_preview", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "history_pin_preview"){
            let vc = segue.destination as! history_pin_preview
            vc.pin = self.selected_pin
        }
    }

}
