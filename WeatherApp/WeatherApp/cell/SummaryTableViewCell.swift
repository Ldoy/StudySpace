//
//  SummaryTableViewCell.swift
//  WeatherApp
//
//  Created by Do Yi Lee on 2021/04/08.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {
    
    static let identifier = "SummaryTableViewCell"
    // 새로 추가함
    // summarytableviewcell class의 identifier에 해당 상수 값 추가함
    
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBOutlet weak var minMaxLabel: UILabel!
    
    @IBOutlet weak var currentTemLabel: UILabel!
    
    // 해당 뷰와 아웃렛으로 연결
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
