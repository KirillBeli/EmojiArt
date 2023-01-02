//
//  TextFieldCollectionViewCell.swift
//  EmojiArt
//
//  Created by Kyrylo Bielykov on 28.12.2022.
//

import UIKit

class TextFieldCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
 
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    var resignationHendler: (() -> Void)?
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        resignationHendler?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //the method is to hidn the keyboard when the user press return
    
    
}
