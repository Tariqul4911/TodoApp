//
//  RegPageMoreInfoViewController.swift
//  LoginRegTest
//
//  Created by Md. Mehedi Hasan Akash on 12/26/19.
//  Copyright © 2019 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

class RegPageMoreInfoViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    //@IBOutlet weak var userPhoneNumberTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userPasswordRepeatTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userName = userNameTextField.text;
        let userEmail = userEmailTextField.text;
        let userPhoneNumber = UserDefaults.standard.string(forKey: "userPhoneNumberForCode");
        let userPassword = userPasswordTextField.text;
        let userPasswordRepeat = userPasswordRepeatTextField.text;
        
        // Check for empty fields
        if((userName?.isEmpty)! || (userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userPasswordRepeat?.isEmpty)!){
            // Display alert message
            displayAllertMessage(userMessage: "All of the fields are required!");
            return;
        }
        
        // Check if email is valid
        if(!isValidEmail(emailStr: userEmail!)){
            // Display alert message
            displayAllertMessage(userMessage: "Please input valid email!");
            return;
        }
        
        // Check if userPassword = userPasswordRepeat
        if(userPassword != userPasswordRepeat){
            // Display alert message
            displayAllertMessage(userMessage: "Passwords do not match!");
            return;
        }
        
        // Store data
        UserDefaults.standard.set(userName, forKey: "userName");
        UserDefaults.standard.set(userEmail, forKey: "userEmail");
        UserDefaults.standard.set(userPhoneNumber, forKey: "userPhoneNumber");
        UserDefaults.standard.set(userPassword, forKey: "userPassword");
        UserDefaults.standard.synchronize();
        
        // Display alart message with confirmation
        let userAlert = UIAlertController(title: "Alert", message: "Registration is successful.", preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){ action in
            // Call next page (Reg more info)
            //self.dismiss(animated: true, completion: nil);
            //self.performSegue(withIdentifier: "regMoreInfoToLogin", sender: self);
            
            self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil);
        }
        userAlert.addAction(okAction);
        self.present(userAlert,animated: true, completion: nil);
    }
    
    
    // Function to display allert message
    func displayAllertMessage(userMessage:String){
        let userAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
        userAlert.addAction(okAction);
        
        self.present(userAlert, animated: true, completion: nil);
        
    }
    
    // Function to check valid email
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
