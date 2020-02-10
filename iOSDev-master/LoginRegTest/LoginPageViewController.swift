//
//  LoginPageViewController.swift
//  LoginRegTest
//
//  Created by Md. Mehedi Hasan Akash on 12/26/19.
//  Copyright © 2019 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var userLoginEmailTextField: UITextField!
    @IBOutlet weak var userLoginPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        let userLoginEmail = userLoginEmailTextField.text;
        print(userLoginEmail as Any);
        let userLoginPassword = userLoginPasswordTextField.text;
        print(userLoginPassword as Any);
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail");
        print(userEmailStored as Any);
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword");
        print(userPasswordStored as Any);
        
        /*// Check for empty fields
        if((userLoginEmail?.isEmpty)!){
            // Display alert message
            displayAllertMessage(userMessage: "Email ID field can't be empty!");
            return;
        }
        if((userLoginPassword?.isEmpty)!){
            // Display alert message
            displayAllertMessage(userMessage: "Password field can't be empty!");
            return;
        }
        
        // Email format validity*/
        

        
        if(userEmailStored == userLoginEmail){
            if(userPasswordStored == userLoginPassword){
                // Login is successful
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                // Sync to save changes
                UserDefaults.standard.synchronize();
                print("Logged in");
                
                /*// Call next page (Reg more info)
                self.performSegue(withIdentifier: "regVerifiedCodeMoreDetailsView", sender: self);*/
                
                // Dismiss the login view as we don't need anymore
                self.dismiss(animated: true, completion: nil);
                
            }
        }
    }
    
    /*// Function to display allert message
    func displayAllertMessage(userMessage:String){
        let userAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
        userAlert.addAction(okAction);
        // Pop up alert message
        self.present(userAlert, animated: true, completion: nil);
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
