import UIKit

final class PersonViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var name: UILabel!
    @IBOutlet var surname: UILabel!
    
    @IBOutlet var company: UILabel!
    @IBOutlet var post: UILabel!
    
    var imageOfPerson: UIImage!
    
    var personName: String!
    var personSurname: String!
    var personCompany: String!
    var personPost: String!
    var personFullName: String!
    var personBio: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        
        image.image = imageOfPerson
        image.layer.cornerRadius = image.frame.height / 2
        
        name.text = personName
        surname.text = personSurname
        company.text = personCompany
        post.text = personPost
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.personFullName = personFullName
        bioVC.personBio = personBio
    }
}
