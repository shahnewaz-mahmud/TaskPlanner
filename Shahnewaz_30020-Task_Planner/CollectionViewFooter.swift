//
//  CollectionViewFooter.swift
//  Shahnewaz_30020-Task_Planner
//
//  Created by BJIT on 12/13/22.
//

import UIKit


class CollectionViewFooter: UICollectionReusableView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
  
    @IBAction func addCatagoryAction(_ sender: Any) {
        
        let alertVC = UIAlertController(title: "Add Catagory", message: "", preferredStyle: .alert)
        
        let addCatagory = UIAlertAction(title: "Add", style: .default){[weak self] _ in
            
            guard let self = self else { return }
            
            if let catagoryInput = alertVC.textFields?[0].text
            {
                self.addCatagory(item: catagoryInput)
            }
        }
        
        let cancelAlert = UIAlertAction(title: "Cancel", style: .default){_ in
            
            alertVC.dismiss(animated: true)
        }

        alertVC.addTextField() { textfield in
            textfield.placeholder = "Enter catagory name"
            
        }
        
        alertVC.addAction(addCatagory)
        alertVC.addAction(cancelAlert)
        
        let currentVC = self.window?.rootViewController;
        
        currentVC!.present(alertVC, animated: true)
    }
    
    func addCatagory(item: String)
    {
        catagoryList.append(item)
        print(catagoryList)
        NotificationCenter.default.post(name: Constants.refreshCatagoryNotificationName, object: nil)
    }
    
    
}


