//
//  JobPostTableViewCell.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/28/24.
//

import UIKit

class JobPostTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewBackground: UIView! {
        didSet {
            viewBackground.layer.cornerRadius = 10
            viewBackground.backgroundColor = UIColor(hexString: Color.backgroundSecondary.rawValue)
        }
    }
    @IBOutlet weak var lblJobTitle: UILabel! {
        didSet {
            lblJobTitle.setFontStyle(.bold, 17)
            lblJobTitle.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblDescription: UILabel! {
        didSet {
            lblDescription.setFontStyle(.light, 14)
            lblDescription.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblSalaryRange: UILabel! {
        didSet {
            lblSalaryRange.setFontStyle(.light, 14)
            lblSalaryRange.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblLocation: UILabel! {
        didSet {
            lblLocation.setFontStyle(.light, 14)
            lblLocation.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblIndustry: UILabel! {
        didSet {
            lblIndustry.setFontStyle(.light, 14)
            lblIndustry.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblIsAppliedCheck: UILabel! {
        didSet {
            lblIsAppliedCheck.setFontStyle(.light, 10)
            lblIsAppliedCheck.setFontColor(.textPrimary)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Configuration
    func configureCell( jobTitle: String, description: String, salary: String, location: String, industry: String, isApplied: Bool
    ) {
        lblJobTitle.text = jobTitle
        lblDescription.text = description
        lblSalaryRange.text = salary
        lblLocation.text = location
        lblIndustry.text = industry
        lblIsAppliedCheck.isHidden = !isApplied
        
        if isApplied {
            contentView.backgroundColor = UIColor(hexString: Color.backgroundSecondary.rawValue).withAlphaComponent(0.1)
        } else {
            contentView.backgroundColor = .clear
        }
    }
}

extension Int {
    var formattedWithCommas: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? String(self)
    }
}
