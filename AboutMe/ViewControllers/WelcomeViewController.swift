import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var greatingLabel: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greatingLabel.text = "Welcome, \(userName)!"
    }

}
