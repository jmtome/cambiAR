//
//  BRLViewController.swift
//  CambiAR
//
//  Created by Gonzalo Yagci on 7/28/15.
//  Copyright (c) 2015 SpaceTimeContinuum Apps. All rights reserved.
//

import UIKit

class BRLViewController: UIViewController {

    
    //labels de BRL
    @IBOutlet weak var brlCO: UILabel!
    @IBOutlet weak var brlVO: UILabel!
    @IBOutlet weak var brlCB: UILabel!
    @IBOutlet weak var brlVB: UILabel!
    @IBOutlet weak var brlA: UILabel!
    @IBOutlet weak var brlT: UILabel!
    @IBOutlet weak var brlDate: UILabel!

    
    let ahorro = 1.20
    let tarjeta = 1.35
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

getCurrencyVarios("https://www.kimonolabs.com/api/3uq4dggw?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
getCurrencyVenta("https://www.kimonolabs.com/api/2psnx9z0?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // funcion obtiene valores de venta de PARALELO
    func getCurrencyVenta(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsVenta(data)
            })
            
        }
        task.resume()
    }
    
    // funcion obtiene valores de VARIOS
    func getCurrencyVarios(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsVarios(data)
            })
        }
        task.resume()
    }
    
    
    
    // funcion que mete los valores sacados de getCurrencyVarios
    func setLabelsVarios(currencyData: NSData){
        let json = JSON(data: currencyData)
        for index in 0...json["count"].intValue {
            if json["results"]["EUROoficial"][index]["Moneda"].stringValue == "BRASIL - REAL" {
                brlCO.text = json["results"]["EUROoficial"][index]["Compra"].stringValue
                brlVO.text = json["results"]["EUROoficial"][index]["Venta"].stringValue
                brlA.text = "\((brlVO.text! as NSString).doubleValue * ahorro)"
                brlT.text = "\((brlVO.text! as NSString).doubleValue * tarjeta)"
            }
        }
    }
    
    func setLabelsVenta(currencyVenta: NSData){
        
        let json = JSON(data: currencyVenta)
        for index in 0...json["count"].intValue {
            if json["results"]["mainM"][index]["TipoM"].stringValue == "REAL BLUE" {
                brlVB.text = json["results"]["mainM"][index]["valorM"].stringValue                      //VENTA BLUE
            }
            
        }
    }
    
    
}