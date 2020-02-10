//
//  RegPagePhoneNumberViewController.swift
//  LoginRegTest
//
//  Created by Md. Mehedi Hasan Akash on 12/26/19.
//  Copyright © 2019 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

class RegPagePhoneNumberViewController: UIViewController {

    @IBOutlet weak var regUserPhoneNumberForCodeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getCodeButtonTapped(_ sender: Any) {
        let userPhoneNumberForCode = regUserPhoneNumberForCodeTextField.text;
        
        // Check if userPassword = userPasswordRepeat
        if(userPhoneNumberForCode!.isEmpty){
            // Display alert message
            displayAllertMessage(userMessage: "Field can not be empty. Please provide valid phone number!");
            return;
        }
        else{
            // Generate random code
            let randomCodeToVerify = Int.random(in: 1111..<9999);
            print(randomCodeToVerify);
            
            // Store data
            UserDefaults.standard.set(userPhoneNumberForCode, forKey: "userPhoneNumberForCode");
            UserDefaults.standard.set(randomCodeToVerify, forKey: "randomCodeToVerify");
            UserDefaults.standard.synchronize();
            
            // Dismiss the view as we don't need anymore
            //self.dismiss(animated: true, completion: nil);
            
            //self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil);
            
            // Call next page (Reg code submit)
            self.performSegue(withIdentifier: "regPhoneNumberEnterCodeView", sender: self);
            
            // Dismiss the view as we don't need anymore
            //self.dismiss(animated: true, completion: nil);
            
        }
    }
    
    
    // Function to display allert message
    func displayAllertMessage(userMessage:String){
        let userAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
        userAlert.addAction(okAction);
        
        self.present(userAlert, animated: true, completion: nil);
        
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
