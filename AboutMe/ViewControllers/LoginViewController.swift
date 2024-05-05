import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        loginTF.text = user.login
        passwordTF.text = user.password
    }
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard loginTF.text == user.login, passwordTF.text == user.password else {
            showAlert(title: "Ошибка", message: "Неверный логин или пароль") { _ in
                self.passwordTF.text = ""
            }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabBarVC = segue.destination as? UITabBarController {
            tabBarVC.viewControllers?.forEach{ viewController in
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.userName = user.login
                    welcomeVC.fullName = user.person.fullName
                } else if let navigationVC = viewController as? UINavigationController {
                    if let personVC = navigationVC.topViewController as? PersonViewController {
                        personVC.title = user.person.fullName
                        personVC.imageOfPerson = user.person.image
                        personVC.personName = user.person.name
                        personVC.personSurname = user.person.surname
                        personVC.personCompany = user.person.company
                        personVC.personPost = user.person.post
                        personVC.personFullName = user.person.fullName
                        personVC.personBio = user.person.biography
                    }
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
       
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        sender.tag == 0 
        ? showAlert(title: "Логин", message: user.login, handler: nil)
        : showAlert(title: "Пароль", message: user.password, handler: nil)
    }
    
    private func showAlert(
        title: String,
        message: String,
        handler: ((UIAlertAction) -> Void)?
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let alertButton = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: handler
        )
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
}

