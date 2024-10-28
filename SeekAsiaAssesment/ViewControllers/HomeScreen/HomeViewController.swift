//
//  HomeViewController.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/27/24.
//

import UIKit

class HomeViewController: BaseClass {
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewNavBar: UIView! {
        didSet {
            viewNavBar.backgroundColor = UIColor(hexString: Color.button.rawValue)
        }
    }
    @IBOutlet weak var jobsListTableView: UITableView!
    
    
    // MARK: - Properties
    private let homeViewModel = HomeViewModel()
    private let jobsCellIdentifier: String = "JobPostTableViewCell"
    private let refreshControl = UIRefreshControl()
    
    private var pagination = PaginationState(
        currentPage: 1,
        totalPages: 0,
        totalItems: 0
    )
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchInitialPosts()
        
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        configureNavigationBar()
        configureTableView()
        setupPullToRefresh()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureTableView() {
        
        self.jobsListTableView.register(UINib(nibName: self.jobsCellIdentifier, bundle: nil), forCellReuseIdentifier: self.jobsCellIdentifier)
        self.jobsListTableView.delegate = self
        self.jobsListTableView.dataSource = self
        self.jobsListTableView.backgroundColor = UIColor(hexString: Color.backgroundSecondary.rawValue)
        self.jobsListTableView.rowHeight = UITableView.automaticDimension
        self.jobsListTableView.estimatedRowHeight = 90
        
    }
    
    private func setupPullToRefresh() {
        self.refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.jobsListTableView.refreshControl = refreshControl
    }
    
    // MARK: - Data Loading
    private func fetchInitialPosts() {
        homeViewModel.fetchPosts(page: pagination.currentPage) { [weak self] in
            self?.jobsListTableView.reloadData()
        }
    }
    
    @objc private func handleRefresh() {
        pagination.currentPage = 1
        homeViewModel.fetchPosts(page: pagination.currentPage) { [weak self] in
            self?.refreshControl.endRefreshing()
            self?.jobsListTableView.reloadData()
            
        }
    }
}

extension HomeViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeViewModel.jobPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: self.jobsCellIdentifier, for: indexPath) as! JobPostTableViewCell
        aCell.selectionStyle = .none
        let jobPost = self.homeViewModel.jobPosts[indexPath.row]
        
        let salaryText = JobUtilities.formatSalaryRange(
            min: jobPost.salaryRange?.min,
            max: jobPost.salaryRange?.max
        )
        
        aCell.configureCell(jobTitle: jobPost.positionTitle ?? "",
                            description: jobPost.description ?? "",
                            salary: salaryText,
                            location: JobUtilities.getLocationString(for: jobPost.location ?? 0),
                            industry: JobUtilities.getIndustryString(for: jobPost.industry ?? 0),
                            isApplied: jobPost.haveIApplied ?? false)
        return aCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedJobPost = homeViewModel.jobPosts[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let jobDetailsVC = storyboard.instantiateViewController(withIdentifier: "JobDetailViewController") as? JobDetailViewController else { return }
        jobDetailsVC.jobDetail = selectedJobPost
        navigationController?.pushViewController(jobDetailsVC, animated: true)
    }
}

private struct PaginationState {
    var currentPage: Int
    var totalPages: Int
    var totalItems: Int
}
