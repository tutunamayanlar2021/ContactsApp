//
//  ViewController.swift
//  ContactsApp
//
//  Created by Kader Oral on 23.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contactsTableView: UITableView!
    private var selectedContactType: Contacts?{
        didSet{
            contactsTableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //classa delegate metotlarını çalıştırma yetkisi veriyoruz.
        contactsTableView.delegate = self // aksiyon
        contactsTableView.dataSource = self // table icinde neler olcak
        
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), style: .done, target: self, action: #selector(filterButtonAct))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc private func filterButtonAct() {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(identifier: "PickerViewController") as? PickerViewController {
            vc.delagate = self
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }


}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return setSection().count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        setSection()[section].contactType
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  filterContacts(section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as! ContactsTableViewCell
        cell.cellLabel.text  = filterContacts(indexPath.section)[indexPath.row].name
        cell.cellImageView.image = filterContacts(indexPath.section)[indexPath.row].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContact = filterContacts(indexPath.section)[indexPath.row]

        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailVC.filteredContacts = filterContacts(indexPath.section) // Pass the filtered contacts to DetailViewController
            detailVC.contact = selectedContact // Pass the selected contact to DetailViewController
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }



    private func setSection() -> [Contacts]{
        
        return selectedContactType.map { [$0] } ?? Contacts.allCases

    }
   
    private func filterContacts(_ sectionIndex: Int)-> [ContactModel]{
        let contactType: Contacts = selectedContactType ?? Contacts.allCases[sectionIndex]
        return contacts.filter { $0.contacts == contactType }
    }
    
    
}
//MARK: - PickerViewControllerDelegate
extension ViewController: PickerViewControllerDelegate{
    func didSelectContact(_ type: Contacts) {
        if type == .allContacts {
                selectedContactType = nil
            } else {
                selectedContactType = type
            }
    }
    
    
}
