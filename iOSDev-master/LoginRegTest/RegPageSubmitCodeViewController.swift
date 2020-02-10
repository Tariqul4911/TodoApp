//
//  RegPageSubmitCodeViewController.swift
//  LoginRegTest
//
//  Created by Md. Mehedi Hasan Akash on 12/26/19.
//  Copyright © 2019 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

class RegPageSubmitCodeViewController: UIViewController {

    @IBOutlet weak var userSubmitCodeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func regSubmitButtonTapped(_ sender: Any) {
        let userSubmitedCode = userSubmitCodeTextField.text;
        let generatedCode = UserDefaults.standard.string(forKey: "randomCodeToVerify");
        print("Code: ");
        print(generatedCode as Any);
        if(generatedCode != userSubmitedCode){
            // Display alert message
            displayAllertMessage(userMessage: "Invalid code!");
            return;
        }
        else{
            
            // Dismiss the view as we don't need anymore
            //self.dismiss(animated: true, completion: nil);
            
            //self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil);
            // Call next page (Reg more info)
            self.performSegue(withIdentifier: "regVerifiedCodeMoreDetailsView", sender: self);
            
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
