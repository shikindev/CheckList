//
//  AddItemViewController.swift
//  CheckList
//
//  Created by maxshikin on 02.01.2023.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    
    func addItemViewControllerDidCancel (_ controller: AddItemViewController)
    
    func addItemViewController (_ controller: AddItemViewController, didFinishing item: ChecklistItem)
    
    func addItemViewController (_ controller: AddItemViewController, didFinishEditing item: ChecklistItem)
}


class AddItemViewController: UITableViewController, UITextFieldDelegate {

    weak var delegate : AddItemViewControllerDelegate?
    var itemToEdit : ChecklistItem?
    
    @IBOutlet weak var doneButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textFieldOutlet.becomeFirstResponder()
        
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            title = "Edit Item"
            textFieldOutlet.text = item.text
            doneButtonOutlet.isEnabled = true
        }
        
    }

  //MARK - IBACTIONS
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        if let item = itemToEdit {
            item.text = textFieldOutlet.text!
            delegate?.addItemViewController(self, didFinishEditing: item)
        } else {
        let item = ChecklistItem()
        item.text = textFieldOutlet.text!
        delegate?.addItemViewController(self, didFinishing: item)
        }
    }
    @IBAction func keybordDoneButton(_ sender: UITextField) {
        doneButton(doneButtonOutlet)
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.addItemViewControllerDidCancel(self)
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
