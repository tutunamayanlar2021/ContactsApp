//
//  PickerViewController.swift
//  ContactsApp
//
//  Created by Kader Oral on 23.07.2023.
//

import UIKit

protocol PickerViewControllerDelegate{
    func didSelectContact(_ type: Contacts)
    
}
class PickerViewController: UIViewController{
    
    @IBOutlet weak var filterPickerView: UIPickerView!
    private var selectedContactType: Contacts?
    var delagate: PickerViewControllerDelegate?
    
    
    @IBAction func cancelButtonAct(_ sender: UIButton) {
        dismiss(animated: true) // shut down viewcontroller

        
    }
    @IBOutlet weak var selectedTitleLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        filterPickerView.delegate = self
        filterPickerView.dataSource = self
        selectedTitleLabel.text = Contacts.allCases.first?.contactType
        
    }
    @IBAction func doneButtonAct(_ sender: UIButton){
        delagate?.didSelectContact(selectedContactType ?? .disconnected)
        dismiss(animated: true) // shut down viewcontroller
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Contacts.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Contacts.allCases[row].contactType
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedContactType = Contacts.allCases[row]
        selectedTitleLabel.text = selectedContactType?.contactType ?? Contacts.allCases.first?.contactType
        
       
    }
    
}
