//
//  PlacesViewController.swift
//  FourSquare
//
//  Created by Param Veghal on 22/03/2019.
//  Copyright © 2019 ParamVeghal. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PlacesViewController: UIViewController {
    
    @IBOutlet public weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    
    
    var placesData: [PlacesModel] = []
    
    let clientIdValue = "ATSBY00CUMEA4O5FF13O4DNRZQ5CTDKXAJ1NZFVXKTLJ5VG3"
    let seceretValue = "YVSR5LAAAGQ0HVV1ESTUE4H3KDB31HXCSUA4MG002E12RVGE"
    let formattedDate = "20180101"
    var searchValue  = ""
    
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        fetchPlacesData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 50
        self.tableView.register(UINib(nibName: "PlacesTableViewCell", bundle: nil), forCellReuseIdentifier: "placesCell")
        fetchPlacesData()
    }
    
    func fetchPlacesData() {
        DispatchQueue.main.async {
            let text = self.searchBar.text!
            if text != "" {
                Alamofire.request("https://api.foursquare.com/v2/venues/search?near=\(text)&client_id=\(self.clientIdValue)&client_secret=\(self.seceretValue)&v=\(self.formattedDate)").responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let data = json["response"]
                        data["venues"].array?.forEach({ (place) in
                            let place = PlacesModel(name: place["name"].stringValue,
                                                    postalCode: place["location"]["postalCode"].stringValue,
                                                    address: place["location"]["address"].stringValue)
                            self.placesData.append(place)
                            self.tableView.reloadData()
                        })
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
            }
        }
    }
}

extension PlacesViewController: UITabBarDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.placesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell", for: indexPath) as! PlacesTableViewCell
        
        cell.nameLabel.text = self.placesData[indexPath.row].name
        cell.addressLabel.text = self.placesData[indexPath.row].address
        cell.postalCode.text = self.placesData[indexPath.row].postalCode
        return cell
    }
}
