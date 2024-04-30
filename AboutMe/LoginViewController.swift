import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var forgotUserButton: UIButton!
    @IBOutlet var forgotPassButton: UIButton!
    
    private var userData = "User"
    private var passwordData = "123"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard let login = loginTF.text, !login.isEmpty else {
            showInfo(title: "Ошибка", message: "Введите логин", handler: nil)
            return false
        }
        guard chekingUserName(login) else {
            showInfo(
                title: "",
                message: "Допустимо использовать только латинские буквы в логине"
            ) { _ in
                self.loginTF.text = ""
            }
            return false
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            showInfo(title: "Ошибка", message: "Введите пароль", handler: nil)
            return false
        }
        guard chekingPassword(password) else {
            showInfo(title: "", message: "Допустимо использовать только цифры") { _ in
                self.passwordTF.text = ""
            }
            return false
        }
        
        guard loginTF.text == userData, passwordTF.text == passwordData else {
            showInfo(title: "Ошибка", message: "Неверный логин или пароль") { _ in
                self.loginTF.text = ""
                self.passwordTF.text = ""
            }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = loginTF.text ?? ""
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        if sender == forgotUserButton {
            showInfo(title: "Логин", message: userData, handler: nil)
        } else if sender == forgotPassButton {
            showInfo(title: "Пароль", message: passwordData, handler: nil)
        }
        
    }
    
    private func showInfo(
        title: String,
        message: String,
        handler: ((UIAlertAction) -> Void)?
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let alertButton = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: handler)
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
    
    private func chekingUserName(_ userName: String) -> Bool {
        let userDataPattern = "^[a-zA-Z]{3,10}$"
        let isUserDataValid = NSPredicate(format: "SELF MATCHES %@", userDataPattern)
            .evaluate(with: userName)
        return isUserDataValid
    }
    
    private func chekingPassword(_ password: String) -> Bool {
        let passwordDataPattern = "^[0-9]{3,20}$"
        let isPasswordDataValid = NSPredicate(format: "SELF MATCHES %@", passwordDataPattern)
            .evaluate(with: password)
        return isPasswordDataValid
    }
    
}

