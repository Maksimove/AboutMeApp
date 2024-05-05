import UIKit

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "Aleksey",
            password: "12345678",
            person: Person(
                image: UIImage(named: "Jobs"),
                name: "Steven",
                surname: "Jobs",
                company: "Apple",
                post: "CEO",
                biography: "American entrepreneur, inventor and industrial designer, widely recognized as a pioneer of the information technology era. One of the founders, chairman of the board of directors and former CEO of Apple Corporation. One of the founders and CEO of the Pixar film studio"
            )
        )
    }
}

struct Person {
    let image: UIImage?
    let name: String
    let surname: String
    let company: String
    let post: String
    let biography: String
    
    var fullName: String {
        name + " " + surname
    }
}
