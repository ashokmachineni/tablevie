//
//  ViewController.swift
//  BBTJson
//
//  Created by Ashok Machineni on 10/26/16.
//  Copyright © 2016 Ashok Machineni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var actorsArray = [AnyObject]()
    var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    let url = NSURL(string: "http://thecodeeasy.com/test/swiftjson.json")!
        let request = NSMutableURLRequest(url: url as URL)
        URLSession.shared.dataTask(with: request as URLRequest){(data:Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print("Error:\(error)")
                
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            
                guard let parsedJSON = json else {
                   print("error while parsing")
                    return
                }
                guard let actorsJSON = parsedJSON["actors"] else {
                    print("error ParsedJson")
                    return
                }
                
                print(actorsJSON)
                
                self.actorsArray = actorsJSON as! [AnyObject]
                self.tableView.reloadData()
            }catch {
                print("error caught")
            }
        }.resume()
        
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
       
        let name = actorsArray[indexPath.row]["title"]
        let country = actorsArray[indexPath.row]["category"]
        cell.actorName.text = name as? String
        cell.actorCountry.text = country as? String
        
        
        
        let imageURLString = actorsArray[indexPath.row]["image"] as! String
        let imageURL = NSURL(string: imageURLString)
        let imageData = NSData(contentsOf: imageURL as! URL)
        cell.actorPicture.image = UIImage(data: imageData as! Data)
        
        

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        self.performSegue(withIdentifier: "seeVideo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "seeVideo") {
            if let webViewController = segue.destination as? WebViewCon {
                let selectedActor = actorsArray[selectedRow] as! NSDictionary
//                if let link = selectedActor["image"] as! String? {
                if let link = selectedActor["link"] as! String? {
                    print("link = \(link)")
                    webViewController.link = URL(string: link)
                }
            }
        }
    }
}

