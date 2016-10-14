//
//  SkiAreaData.swift
//  BenjaminWernsman-HW7
//  EID:  bw22494
//  Course:  CS378
//
//  Created by Ben Wernsman on 10/13/16.
//  Copyright © 2016 utcs. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON

//Ski Area Data Protocol
protocol SkiAreaDataProtocol
{
    func responseDataHandler(data:NSDictionary)
    func responseError(message:String)
}

class SkiAreaData{
    var delegate:SkiAreaDataProtocol? = nil
    let baseURL:String = "http://api.worldweatheronline.com/premium/v1/search.ashx?key=61f49239748e494bb2b231223161310&format=json&wct=Ski&q="
    
    //GET Request that gets the nearest ski area based on the given zip code
    //Using Alamofire for the network call and SwiftyJSON to parse the returned JSON
    //Sends required information via a delegate back to the ViewController
    func getData(zipcode:String) {
        var json:JSON = nil
        Alamofire.request(.GET, baseURL + zipcode,encoding: .JSON).responseJSON {response in
            if(response.result.error != nil){
                self.delegate?.responseError("Network Error")
            }
            else{
                json = JSON(data: response.data!)
                if(json == nil){
                    self.delegate?.responseError("Error Parsing Response")
                }
                else{
                    if(json["data"]["error"].exists()){
                        self.delegate?.responseError("No nearby ski facilities")
                    }
                    else{
                        if let region = json["search_api"]["result"][0]["region"][0]["value"].string{
                            if let area = json["search_api"]["result"][0]["areaName"][0]["value"].string{
                                if let country = json["search_api"]["result"][0]["country"][0]["value"].string{
                                    let desiredField: NSDictionary = ["region":region,"area":area,"country":country]
                                    self.delegate?.responseDataHandler(desiredField)
                                }
                                else{
                                   self.delegate?.responseError("Error, country missing")
                                }
                            }
                            else{
                                self.delegate?.responseError("Error, area name missing")
                            }
                        }
                        else{
                            self.delegate?.responseError("Error, region missing")
                        }
                    }
                }
            }
        }
    }
}