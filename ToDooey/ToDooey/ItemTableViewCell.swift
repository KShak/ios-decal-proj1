//
//  ItemTableViewCell.swift
//  ToDooey
//
//  Created by Khalid Shakur on 10/8/16.
//  Copyright © 2016 khalidshakur. All rights reserved.
//

import UIKit

protocol CustomCellDelegate {
    func cellButtonTapped(cell: ItemTableViewCell)
}

class ItemTableViewCell: UITableViewCell {
    
    var delegate: CustomCellDelegate?
    @IBOutlet weak var switchy: UISwitch!
    
    @IBAction func mySwitchChanged(_ sender: UISwitch) {
        delegate?.cellButtonTapped(cell: self)
    }
    
    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deletebutton: UIButton!
//    @IBOutlet weak var mySwitch: UISwitch!
    
//    @IBOutlet weak var switchy: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        switchy.isOn = true
        // Initialization code
//        switchy = UISwitch()
//        switchy.isEnabled = false
//        switchy.setOn(false, animated: true)
//        print("yay")
//        print(switchy.isOn)
//        print("yay")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
