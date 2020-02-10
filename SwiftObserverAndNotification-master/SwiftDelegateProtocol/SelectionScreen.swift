//
//  SelectionScreen.swift
//  SwiftDelegateProtocol
//
//  Created by Md. Mehedi Hasan Akash on 2/3/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

//protocol DataSelectionDelegate {
//    func didTapSelectButton(Text: String)
//}

class SelectionScreen: UIViewController {
    // for delegate
    //var delegate: DataSelectionDelegate!
    
    // for Notification
    var dictToPass: [String : String] = [:]
    
    
    @IBOutlet weak var addTextFieldView: UITextField!
    
    @IBAction func selectButtonTapped(_ sender: Any) {
//        let textData = addTextFieldView.text
//        delegate.didTapSelectButton(Text: textData!)
//        print("In select button Func: " + textData!)
//        dismiss(animated: true, completion: nil)
        
        // for notification
        let name = Notification.Name(rawValue: notificationKey)
        var tempStr: String = ""
        tempStr = addTextFieldView.text!
        dictToPass = ["Keyis" : tempStr]
        NotificationCenter.default.post(name: name, object: tempStr)
        dismiss(animated: true, completion: nil)
    }
    
}
