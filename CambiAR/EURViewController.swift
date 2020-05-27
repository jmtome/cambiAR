//
//  EURViewController.swift
//  CambiAR
//
//  Created by Gonzalo Yagci on 7/28/15.
//  Copyright (c) 2015 SpaceTimeContinuum Apps. All rights reserved.
//

import UIKit

class EURViewController: UIViewController {


    //labels de EUR
    @IBOutlet weak var eurCO: UILabel!
    @IBOutlet weak var eurVO: UILabel!
    @IBOutlet weak var eurCB: UILabel!
    @IBOutlet weak var eurVB: UILabel!
    @IBOutlet weak var eurA: UILabel!
    @IBOutlet weak var eurT: UILabel!
    @IBOutlet weak var eurDate: UILabel!
    
    let ahorro = 1.20
    let tarjeta = 1.35
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//APIS ACTIVAS DE PARSEO
getCurrencyVarios("https://www.kimonolabs.com/api/3uq4dggw?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
getCurrencyEuroBlue("https://www.kimonolabs.com/api/dmq50yt6?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
// funcion obtiene valores de varios paises AMBITOvarios (4)
    func getCurrencyVarios(urlString: String){
        let url = NSURL(string: urlString)
    
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
    dispatch_async(dispatch_get_main_queue(), {
        self.setLabelsVarios(data)
        })
    
        }
        task.resume()
    }
    

// funcion obtiene valores de venta de precioblue C/V
    func getCurrencyEuroBlue(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsEuroBlue(data)
            })
            
        }
        task.resume()
    }
    
    
    
// funcion que mete los valores de C/V EUR (sacados de getCurrencyVarios)
    func setLabelsVarios(currencyData: NSData){
        let json = JSON(data: currencyData)
        for index in 0...json["count"].intValue {
            if json["results"]["EUROoficial"][index]["Moneda"].stringValue == "EURO" {
                eurCO.text = json["results"]["EUROoficial"][index]["Compra"].stringValue
                eurVO.text = json["results"]["EUROoficial"][index]["Venta"].stringValue
                eurA.text = "\((eurVO.text! as NSString).doubleValue * ahorro)"
                eurT.text = "\((eurVO.text! as NSString).doubleValue * tarjeta)"
            }
        }
    }
    

// funcion que mete los valores de Compra/Venta Blue EURO
    func setLabelsEuroBlue(currencyVenta: NSData){
            
        let json = JSON(data: currencyVenta)
        for index in 0...json["count"].intValue {
            if json["results"]["EUROBLUE"][index]["Moneda"].stringValue == "Euro blue" {
                eurCB.text = json["results"]["EUROBLUE"][index]["Compra"].stringValue                  //COMPRA BLUE
                eurVB.text = json["results"]["EUROBLUE"][index]["Venta"].stringValue                     //COMPRA BLUE
            
            }
                
        }
    }
}