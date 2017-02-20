import UIKit


/**

 form of a guard statement:

    guard condition else {
        statements
    }

**/


var emailField: UITextField?
var passwordField: UITextField?
var usernameField: UITextField?

// play with optionals and data here ...
usernameField = UITextField()
usernameField?.text = "foo"
emailField = UITextField()
emailField?.text = "foo@foo.com"
passwordField = UITextField()
passwordField?.text = "13323423"


// ##############################
// classic if-statement way with a wonderful pyramid of doom ...
// ##############################
func ifStatement() {
    if let username = usernameField?.text {
        if let email = emailField?.text {
            if let password = passwordField?.text {
                print("username=\(username), email=\(email), password=\(password)")
            }
        }
    } else {
        print("required signup data missing")
    }
}

ifStatement()



// ##############################
// the same function with guard-statement
// ##############################
func guardStatement() {
    guard let username = usernameField?.text else {
        return
    }
    guard let email = emailField?.text else {
        return
    }
    guard let password = passwordField?.text else {
        return
    }

    print("username=\(username), email=\(email), password=\(password)")
}

guardStatement()



// ##############################
// guard-statement with custom error enum for better error-handling
// ##############################
enum SignupError : Error {
    case UsernameMissing
    case EmailMissing
    case PasswordMissing
}

func guardStatementWithErrorEnum() throws {
    guard let username = usernameField?.text else {
        throw SignupError.UsernameMissing
    }
    guard let email = emailField?.text else {
        throw SignupError.EmailMissing
    }
    guard let password = passwordField?.text else {
        throw SignupError.PasswordMissing
    }

    print("username=\(username), email=\(email), password=\(password)")
}

do {
    try guardStatementWithErrorEnum()
} catch SignupError.UsernameMissing {
    print("username missing!")
} catch SignupError.EmailMissing {
    print("email missing!")
} catch SignupError.PasswordMissing {
    print("password missing!")
}



