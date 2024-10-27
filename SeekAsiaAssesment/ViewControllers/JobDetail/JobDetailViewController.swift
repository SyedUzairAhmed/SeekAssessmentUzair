//
//  JobDetailViewController.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/28/24.
//

import UIKit

class JobDetailViewController: BaseClass {
    
    var jobDetail: JobPostModel?
    
    @IBOutlet weak var viewNavBar: UIView! {
        didSet {
            viewNavBar.backgroundColor = UIColor(hexString: Color.button.rawValue)
        }
    }
    @IBOutlet weak var lblJobTitle: UILabel! {
        didSet {
            lblJobTitle.setFontStyle(.bold, 17)
            lblJobTitle.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblDescriptionTitle: UILabel! {
        didSet {
            lblDescriptionTitle.setFontStyle(.bold, 17)
            lblDescriptionTitle.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblSalaryRangeTitle: UILabel! {
        didSet {
            lblSalaryRangeTitle.setFontStyle(.bold, 17)
            lblSalaryRangeTitle.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblLocationTitle: UILabel! {
        didSet {
            lblLocationTitle.setFontStyle(.bold, 17)
            lblLocationTitle.setFontColor(.textPrimary)
        }
    }
    @IBOutlet weak var lblIndustryTitle: UILabel! {
        didSet {
            lblIndustryTitle.setFontStyle(.bold, 17)
            lblIndustryTitle.setFontColor(.textPrimary)
        }
    }
    
    @IBOutlet weak var lblJob: UILabel! {
        didSet {
            lblJob.setFontStyle(.light, 14)
            lblJob.setFontColor(.textPrimary)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    

    // MARK: - Action Methods
    
    @IBAction func backToHomeScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Action Methods
    
    @IBAction func btnApplyPressed(_ sender: UIButton) {
    }
    
    
    // MARK: - UI Methods
    
    func setupUI(){
        if let jobPost = jobDetail {
            let salaryText = JobUtilities.formatSalaryRange(
                min: jobPost.salaryRange?.min,
                max: jobPost.salaryRange?.max
            )
            self.lblJob.text = jobPost.positionTitle
            self.lblDescription.text = jobPost.description
            self.lblIndustry.text = JobUtilities.getIndustryString(for: jobPost.industry ?? 0)
            self.lblLocation.text = JobUtilities.getLocationString(for: jobPost.location ?? 0)
            self.lblSalaryRange.text = salaryText
        }
        
    }

}
