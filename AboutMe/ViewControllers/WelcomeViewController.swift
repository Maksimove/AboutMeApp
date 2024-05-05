import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var greatingLabel: UILabel!
    @IBOutlet var personFullName: UILabel!
    
    var userName = ""
    var fullName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        
        greatingLabel.text = "Welcome, \(userName)!"
        personFullName.text = "My name is \(fullName)"
    }

}
