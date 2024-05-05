import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!

    private let userData = "User"
    private let passwordData = "123"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard loginTF.text == userData, passwordTF.text == passwordData else {
            showAlert(title: "Ошибка", message: "Неверный логин или пароль") { _ in
                self.passwordTF.text = ""
            }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userData
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        sender.tag == 0 
        ? showAlert(title: "Логин", message: userData, handler: nil)
        : showAlert(title: "Пароль", message: passwordData, handler: nil)
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

