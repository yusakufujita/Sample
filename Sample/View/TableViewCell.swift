//
//  TableViewCell.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/06.
//

import UIKit
import Nuke

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var SubtitleLabel: UILabel!
    @IBOutlet weak var MaintitleLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    
    func set(imageUrl:String,title:String,Subtitle:String,logoUrl:String,company_name:String) {
        Nuke.loadImage(with: URL(string: imageUrl)!, into: ImageView)
        Nuke.loadImage(with: URL(string: logoUrl)!, into: logoImage)
        MaintitleLabel.text = title
        SubtitleLabel.text = Subtitle
        companyLabel.text = company_name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
