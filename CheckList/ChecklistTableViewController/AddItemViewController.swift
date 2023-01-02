//
//  AddItemViewController.swift
//  CheckList
//
//  Created by maxshikin on 02.01.2023.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var doneButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textFieldOutlet.becomeFirstResponder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        
    }

  //MARK - IBACTIONS
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        
        print("textField text: \(textFieldOutlet.text ?? "no text")")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func keybordDoneButton(_ sender: UITextField) {
//        print("textField text: \(textFieldOutlet.text ?? "no text Keyboard")")
//        navigationController?.popViewController(animated: true)
//
        doneButton(doneButtonOutlet)
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK - Tablew view controller Delegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    //MARK - Text Field Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            doneButtonOutlet.isEnabled = false
        } else {
            doneButtonOutlet.isEnabled = true
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneButtonOutlet.isEnabled = false
        return true
    }
}
