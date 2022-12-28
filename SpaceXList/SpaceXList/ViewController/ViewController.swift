//
//  ViewController.swift
//  SpaceXList
//
//  Created by Derefaa Cline on 12/28/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SpaceXlaunchProtocol {
    
    
    var launchArray = [SpaceXModel]()
    @IBOutlet weak var Spacetbl:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Spacetbl.delegate = self
        Spacetbl.dataSource = self
        
        let objectSpaceXApiHandler = SpaceXAPIHandler.shared
        objectSpaceXApiHandler.delegate = self
        objectSpaceXApiHandler.getData()
        
        Spacetbl.register(UINib(nibName: "SpaceXTableViewCell", bundle: nil), forCellReuseIdentifier: "SpaceXTableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Spacetbl.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpaceXTableViewCell")as! SpaceXTableViewCell
        cell.spaceXdata = launchArray[indexPath.row]
        return cell
    }
    
    func collectdatafromApi(arrx: [SpaceXModel]) {
        launchArray = arrx
        DispatchQueue.main.async{
            self.Spacetbl.reloadData()
        }
    }


}

