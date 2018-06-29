//
//  AsiloCell.swift
//  asiloSOS
//
//  Created by Victor Orestes Impérico on 28/06/2018.
//  Copyright © 2018 Victor Orestes Impérico. All rights reserved.
//

import UIKit

class AsiloCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var labelAlimentos: UILabel!
    @IBOutlet weak var labelHigiene: UILabel!
    @IBOutlet weak var labelEntretenimento: UILabel!
    @IBOutlet weak var labelMedicamentos: UILabel!
    @IBOutlet weak var txtResumo: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
