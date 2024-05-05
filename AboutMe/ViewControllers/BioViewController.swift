import UIKit

final class BioViewController: UIViewController {
    
    @IBOutlet var fullName: UILabel!
    @IBOutlet var biography: UILabel!
    
    var personFullName: String!
    var personBio: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()

        fullName.text = personFullName
        biography.text = personBio
    }
}
