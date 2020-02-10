//
//  SelectionScreen.swift
//  SwiftDelegateProtocol
//
//  Created by Md. Mehedi Hasan Akash on 2/3/20.
//  Copyright © 2020 Md. Mehedi Hasan Akash. All rights reserved.
//

import UIKit

protocol DataSelectionDelegate {
    func didTapSelectButton(Text: String)
}

class SelectionScreen: UIViewController {
    var delegate: DataSelectionDelegate!
    
    @IBOutlet weak var addTextFieldView: UITextField!
    
    
    @IBAction func selectButtonTapped(_ sender: Any) {
        let textData = addTextFieldView.text
        delegate.didTapSelectButton(Text: textData!)
        print("In select button Func: " + textData!)
        dismiss(animated: true, completion: nil)
    }
    
}
