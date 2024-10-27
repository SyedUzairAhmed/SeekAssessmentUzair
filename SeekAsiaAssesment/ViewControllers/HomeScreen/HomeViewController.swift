//
//  HomeViewController.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/27/24.
//

import UIKit

class HomeViewController: BaseClass, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewNavBar: UIView! {
        didSet {
            viewNavBar.backgroundColor = UIColor(hexString: Color.backgroundBrand.rawValue)
        }
    }
    @IBOutlet weak var jobsListTableView: UITableView!
    
    
    // MARK: - Properties
    private let homeViewModel = HomeViewModel()
    private let jobsCellIdentifier: String = "aCell"
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
        bindViewModel()
        fetchJobPosts()
        
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
    private func bindViewModel() {
        homeViewModel.delegate = self
    }
    
    // MARK: - Data Loading
    private func fetchInitialPosts() {
        homeViewModel.fetchPosts(page: pagination.currentPage)
    }
    
    @objc private func handleRefresh() {
        if homeViewModel.posts.count < pagination.totalItems {
            pagination.currentPage += 1
            homeViewModel.fetchPosts(page: pagination.currentPage)
        }
        refreshControl.endRefreshing()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}




private struct PaginationState {
    var currentPage: Int
    var totalPages: Int
    var totalItems: Int
}
