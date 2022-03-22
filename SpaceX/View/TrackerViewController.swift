//
//  ViewController.swift
//  SpaceX
//
//  Created by Laurent Calle on 3/20/22.
//

import UIKit

class TrackerViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var sortByButton: UIBarButtonItem!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    @IBOutlet weak var missionsTable: UITableView!
    
    var missionViewModel = [MissionViewModel]()
    var missionViewModelFiltered = [MissionViewModel]()
    
    let cellIdentifier = "missionCell"
    
    var yearsArray : [String] {
        let years = missionViewModel.map({$0.launchYear})
        return years.uniqued().sorted()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        missionsTable.delegate = self
        missionsTable.dataSource = self
        
        loadMissions()
    }
    
    @IBAction func sortByAction(_ sender: UIButton) {
        
        self.missionViewModelFiltered = missionViewModel.sorted(by: {$0.launchYear<$1.launchYear})
        missionsTable.reloadData()
    }
    
    @IBAction func filterAction(_ sender: UIBarButtonItem) {
        
        let yearPicker: UIPickerView = UIPickerView()
        
        yearPicker.delegate = self as UIPickerViewDelegate
        yearPicker.dataSource = self as UIPickerViewDataSource
        
        yearPicker.backgroundColor = UIColor.white
        yearPicker.layer.cornerRadius = 10
        yearPicker.layer.borderColor = UIColor.gray.cgColor
        yearPicker.layer.borderWidth = 1
        
        self.view.addSubview(yearPicker)
        yearPicker.center = self.view.center
    }
    
    private func loadMissions() {
      Network.shared.apollo
        .fetch(query: MissionQueryQuery()) { [weak self] result in
        
        guard let self = self else {
          return
        }

        defer {
          self.missionsTable.reloadData()
        }
                
        switch result {
        case .success(let graphQLResult):
            if let launchConnection = graphQLResult.data?.launches {
                let launches = launchConnection.compactMap({return $0})
                self.missionViewModel = launches.map({ return MissionViewModel(mission: $0)})
                self.missionViewModelFiltered = self.missionViewModel
            }
                    
            if let errors = graphQLResult.errors {
              let message = errors
                    .map { $0.localizedDescription }
                    .joined(separator: "\n")
              self.showAlert(title: "GraphQL Error(s)",
                             message: message)
            }
        case .failure(let error):
          self.showAlert(title: "Network Error",
                         message: error.localizedDescription)
        }
      }
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension TrackerViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionViewModelFiltered.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MissionTableViewCell
        
        cell.missionViewModel = missionViewModelFiltered[indexPath.row]
        
        return cell
    }
}

extension TrackerViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearsArray.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "Remove Filter" : yearsArray[row - 1]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 0 {
            missionViewModelFiltered = missionViewModel
        } else {
            missionViewModelFiltered = missionViewModel.filter({ missionVM in
                return yearsArray[row - 1] == missionVM.launchYear
            })
        }
        
        pickerView.removeFromSuperview()
        missionsTable.reloadData()
    }
}
