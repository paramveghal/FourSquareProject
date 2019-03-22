//
//  ViewController.swift
//  FourSquare
//
//  Created by Param Veghal on 20/03/2019.
//  Copyright © 2019 ParamVeghal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let clientIdValue = "ATSBY00CUMEA4O5FF13O4DNRZQ5CTDKXAJ1NZFVXKTLJ5VG3"
    let seceretValue = "YVSR5LAAAGQ0HVV1ESTUE4H3KDB31HXCSUA4MG002E12RVGE"
    let formattedDate = "20180101"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private let networkingClient = NetworkingClient()

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func executeRequest(_ sender: Any) {
        let text = searchBar.text
        guard let urlToExecture = URL(string: "https://api.foursquare.com/v2/venues/search?near=\(text)&client_id=\(clientIdValue)&client_secret=\(seceretValue)&v=\(formattedDate)") else {
            return
        }
        
        networkingClient.execute(urlToExecture) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
}

