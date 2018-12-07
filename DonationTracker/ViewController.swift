//
//  ViewController.swift
//  DonationTracker
//
//  Created by Kelly on 11/27/18.
//  Copyright © 2018 Kelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readCSV()
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
    }
    @IBAction func unwindToMainScreen(sender: UIStoryboardSegue) {
        
    }
    
    func readCSV() {
        let fileName = "LocationData"
        let urlPath = Bundle.main.url(forResource: fileName, withExtension: "csv")
        print((urlPath!).absoluteString)
        
        var readString = ""
        do {
            readString = try String(contentsOf: (urlPath!).absoluteURL, encoding: String.Encoding.utf8)
            let locations = readString.components(separatedBy: "\n")
            
            // ignore first line, just has the csv column names in it
            for i in 1...(locations.count - 1){
                let location = parseLocation(locationString: locations[i])
                Model.shared.addLocation(location:location)
            }
        } catch let error as NSError{
            print("failed to read file")
            print(error)
        }
    }
    
    func parseLocation(locationString: String) -> Location {
        let values = locationString.components(separatedBy: ",")
        let uniqueKey = values[0]
        let name = values[1]
        let latitude = values[2]
        let longitude = values[3]
        let streetAddress = values[4]
        let city = values[5]
        let state = values[6]
        let zip = values[7]
        let type = values[8]
        let phone = values[9]
        let website = values[10]
        
        let newLocation = Location(uniqueKey: uniqueKey, name: name, latitude: latitude, longitude: longitude, streetAddress: streetAddress, city: city, state: state, zip: zip, type: type, phone: phone, website: website)

        return newLocation
    }
}
