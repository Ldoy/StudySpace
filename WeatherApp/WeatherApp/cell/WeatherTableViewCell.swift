//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Do Yi Lee on 2021/04/08.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    static let identifier = "WeatherTableViewCell"
    //type propery추가
    
    
    @IBOutlet weak var date: UILabel!
    
    
    @IBOutlet weak var time: UILabel!
    
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var temperature: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
