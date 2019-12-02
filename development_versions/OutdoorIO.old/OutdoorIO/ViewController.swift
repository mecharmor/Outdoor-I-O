import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Model.I.newTrip(name: "Trip 1") // Sample Interactions with the database
        Model.I.newPin(img: <#T##UIImage#>, msg: "hello!!!")
        // Upon delegate actions we need to take picture and invoke
        // Model.I.newPin(img: <#T##UIImage#>, msg: <#T##String#>)
        
       
    }


}

