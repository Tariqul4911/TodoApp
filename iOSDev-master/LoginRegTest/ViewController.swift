//
//  ViewController.swift
//  LoginRegTest
//
//  Created by Md. Mehedi Hasan Akash on 12/18/19.
//  Copyright © 2019 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        // Check if user is already logged in
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        print(isUserLoggedIn);
        if(!isUserLoggedIn){
            print("Hit!!")
            self.performSegue(withIdentifier: "loginPageView", sender: self);
        }
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        // Set back to false to represent logged out
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn");
        // Sync to save changes
        UserDefaults.standard.synchronize();
        print("Signed out");
        self.performSegue(withIdentifier: "loginPageView", sender: self);
    }
}

