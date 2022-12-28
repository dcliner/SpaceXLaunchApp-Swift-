//
//  SpaceXAPIHandler.swift
//  SpaceXList
//
//  Created by Derefaa Cline on 12/28/22.
//

import Foundation
class SpaceXAPIHandler{
    static let shared = SpaceXAPIHandler.init()
    var delegate:SpaceXlaunchProtocol?
    private init() {}
    func getData(){
        guard let url = URL.init(string: ServerUrls.Launches.rawValue) else { return }
        let urlrequest = URLRequest.init(url: url)
        URLSession.shared.dataTask(with: urlrequest){data, urlresponse, error in
            guard let data = data else {
                print("No getting data")
                return
            }
            do {
                let launches:[SpaceXModel] = try
                JSONDecoder().decode([SpaceXModel].self, from: data)
                self.delegate?.collectdatafromApi(arrx: launches)
            } catch {
                print(error)
            }
        }.resume()
    
    }
}

protocol SpaceXlaunchProtocol {
    func collectdatafromApi(arrx: [SpaceXModel])
}
