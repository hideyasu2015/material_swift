//
//  ViewController.swift
//  2019-11-zuon
//
//  Created by hideyasu on 15/11/19.
//  Copyright © 2019 hideyasu. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var toolbarView: UIView!
    
    @IBOutlet weak var addButton: UIButton!
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationTitleLabel?.text = "Demo Table View"
        
        toolbarView.makeShadow()
        addButton.makeCorner(cornerRadius: 25)
        
        // generate data
        for i in 0..<50 {
            var rowData = ""
            for j in 0 ..< 1 + i {
                rowData += "\nRow \(j)"
            }
            data.append(rowData)
        }
    }


}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PhotoCell.kIdentifier, for: indexPath) as? PhotoCell {
            cell.bind(text: data[indexPath.row])
            return cell
        }
        let cell = UITableViewCell()
        cell.backgroundColor = .white
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
