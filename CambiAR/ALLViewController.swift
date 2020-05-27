//
//  ALLViewController.swift
//  CambiAR
//
//  Created by Gonzalo Yagci on 7/28/15.
//  Copyright (c) 2015 SpaceTimeContinuum Apps. All rights reserved.
//

import UIKit

class ALLViewController: UIViewController {

    
    @IBOutlet weak var armeniaC: UILabel!
    @IBOutlet weak var armeniaV: UILabel!
    
    @IBOutlet weak var australiaC: UILabel!
    @IBOutlet weak var australiaV: UILabel!
    
    @IBOutlet weak var boliviaC: UILabel!
    @IBOutlet weak var boliviaV: UILabel!
    
    @IBOutlet weak var brasilC: UILabel!
    @IBOutlet weak var brasilV: UILabel!
    
    @IBOutlet weak var canadaC: UILabel!
    @IBOutlet weak var canadaV: UILabel!
    
    @IBOutlet weak var chileC: UILabel!
    @IBOutlet weak var chileV: UILabel!
    
    @IBOutlet weak var chinaC: UILabel!
    @IBOutlet weak var chinaV: UILabel!

    @IBOutlet weak var colombiaC: UILabel!
    @IBOutlet weak var colombiaV: UILabel!
    
    @IBOutlet weak var coreanC: UILabel!
    @IBOutlet weak var coreanV: UILabel!
    
    @IBOutlet weak var coreasC: UILabel!
    @IBOutlet weak var coreasV: UILabel!
    
    @IBOutlet weak var cricaC: UILabel!
    @IBOutlet weak var cricaV: UILabel!
    
    @IBOutlet weak var croaciaC: UILabel!
    @IBOutlet weak var croaciaV: UILabel!
    
    @IBOutlet weak var dinamarcaC: UILabel!
    @IBOutlet weak var dinamarcaV: UILabel!
    
    @IBOutlet weak var ecuadorC: UILabel!
    @IBOutlet weak var ecuadorV: UILabel!
    
    @IBOutlet weak var egiptoC: UILabel!
    @IBOutlet weak var egiptoV: UILabel!
    
    @IBOutlet weak var emiratosC: UILabel!
    @IBOutlet weak var emiratosV: UILabel!
    
    @IBOutlet weak var euroC: UILabel!
    @IBOutlet weak var euroV: UILabel!
    
    @IBOutlet weak var ukC: UILabel!
    @IBOutlet weak var ukV: UILabel!
    
    @IBOutlet weak var hondurasC: UILabel!
    @IBOutlet weak var hondurasV: UILabel!
    
    @IBOutlet weak var indiaC: UILabel!
    @IBOutlet weak var indiaV: UILabel!
    
    @IBOutlet weak var irakC: UILabel!
    @IBOutlet weak var irakV: UILabel!
    
    @IBOutlet weak var iranC: UILabel!
    @IBOutlet weak var iranV: UILabel!
    
    @IBOutlet weak var israelC: UILabel!
    @IBOutlet weak var israelV: UILabel!
    
    @IBOutlet weak var japonC: UILabel!
    @IBOutlet weak var japonV: UILabel!
    
    @IBOutlet weak var malasiaC: UILabel!
    @IBOutlet weak var malasiaV: UILabel!
    
    @IBOutlet weak var mexicoC: UILabel!
    @IBOutlet weak var mexicoV: UILabel!
    
    @IBOutlet weak var nzelandaC: UILabel!
    @IBOutlet weak var nzelandaV: UILabel!
    
    @IBOutlet weak var noruegaC: UILabel!
    @IBOutlet weak var noruegaV: UILabel!
    
    @IBOutlet weak var paraguayC: UILabel!
    @IBOutlet weak var paraguayV: UILabel!
    
    @IBOutlet weak var peruC: UILabel!
    @IBOutlet weak var peruV: UILabel!
    
    @IBOutlet weak var poloniaC: UILabel!
    @IBOutlet weak var poloniaV: UILabel!
    
    @IBOutlet weak var rusiaC: UILabel!
    @IBOutlet weak var rusiaV: UILabel!
    
    @IBOutlet weak var sudafricaC: UILabel!
    @IBOutlet weak var sudafricaV: UILabel!
    
    @IBOutlet weak var sueciaC: UILabel!
    @IBOutlet weak var sueciaV: UILabel!
    
    @IBOutlet weak var suizaC: UILabel!
    @IBOutlet weak var suizaV: UILabel!
    
    @IBOutlet weak var tailandiaC: UILabel!
    @IBOutlet weak var tailandiaV: UILabel!
    
    @IBOutlet weak var turquiaC: UILabel!
    @IBOutlet weak var turquiaV: UILabel!
    
    @IBOutlet weak var usaC: UILabel!
    @IBOutlet weak var usaV: UILabel!
    
    @IBOutlet weak var uruguayC: UILabel!
    @IBOutlet weak var uruguayV: UILabel!
    
    @IBOutlet weak var venezuelaC: UILabel!
    @IBOutlet weak var venezuelaV: UILabel!
    
    @IBOutlet weak var allDate: UILabel!

    var compraUSD : String!
    var ventaUSD : String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

getCurrencyFXRATESusd("https://www.kimonolabs.com/api/4e8988ya?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
getCurrencyUSDcompra("https://www.kimonolabs.com/api/dwb2beuc?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
getCurrencyUSDventa("https://www.kimonolabs.com/api/2psnx9z0?apikey=4sgNkrPnYGfFdNqQJ1z7HnkI7AYaSz0o")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // funcion obtiene valores de FXRATESusd
    func getCurrencyFXRATESusd(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsFXRATESusd(data)
            })
        }
        task.resume()
    }
    
    func getCurrencyUSDcompra(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsUSDcompra(data)
            })
        }
        task.resume()
    }
    
    func getCurrencyUSDventa(urlString: String){
        let url = NSURL(string: urlString)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            dispatch_async(dispatch_get_main_queue(), {
                self.setLabelsUSDventa(data)
            })
            
        }
        task.resume()
    }
    
    
//.............
    
    
    func setLabelsUSDcompra(currencyData: NSData){
        let json = JSON(data: currencyData)
        for index in 0...json["count"].intValue {
            if json["results"]["USDcref"][index]["tipoUSD"]["text"].stringValue == "OFICIAL" {
                compraUSD = json["results"]["USDcref"][index]["CompraUSD"].stringValue
            }
        }
    }
    
    func setLabelsUSDventa(currencyVenta: NSData){
                    
        let json = JSON(data: currencyVenta)
        for index in 0...json["count"].intValue {
            if json["results"]["mainM"][index]["TipoM"].stringValue == "DÓLAR OFICIAL" {
                ventaUSD = json["results"]["mainM"][index]["valorM"].stringValue
            }
        }
    }
    
    func setLabelsFXRATESusd(currencyVenta: NSData){
        
        let json = JSON(data: currencyVenta)
        for index in 0...json["count"].intValue {
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/AMD" {
                armeniaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                armeniaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/AUD" {
                australiaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                australiaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/BOB" {
                boliviaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                boliviaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/BRL" {
                brasilC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                brasilV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/CAD" {
                canadaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                canadaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/CLP" {
                chileC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                chileV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/CNY" {
                chinaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                chinaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/COP" {
                colombiaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                colombiaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            /*
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/AMD" {
                coreanC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                coreanV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            */
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/KRW" {
                coreasC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                coreasV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/CRC" {
                cricaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                cricaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/HRK" {
                croaciaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                croaciaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/DKK" {
                dinamarcaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                dinamarcaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/EGP" {
                egiptoC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                egiptoV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/AED" {
                emiratosC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                emiratosV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/EUR" {
                euroC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                euroV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/GBP" {
                ukC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                ukV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/HNL" {
                hondurasC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                hondurasV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/INR" {
                indiaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                indiaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/IQD" {
                irakC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                irakV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/IRR" {
                iranC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                iranV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/ILS" {
                israelC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                israelV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/JPY" {
                japonC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                japonV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/MYR" {
                malasiaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                malasiaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/MXN" {
                mexicoC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                mexicoV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/NZD" {
                nzelandaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                nzelandaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/NOK" {
                noruegaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                noruegaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/PYG" {
                paraguayC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                paraguayV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/PEN" {
                peruC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                peruV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/PLN" {
                poloniaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                poloniaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/RUB" {
                rusiaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                rusiaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/ZAR" {
                sudafricaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                sudafricaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/SEK" {
                sueciaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                sueciaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/CHF" {
                suizaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                suizaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/THB" {
                tailandiaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                tailandiaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/TRY" {
                turquiaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                turquiaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/ARS" {
                usaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                usaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/UYU" {
                uruguayC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                uruguayV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
            if json["results"]["FXRatesUSD"][index]["Paridad"].stringValue == "USD/VEF" {
                venezuelaC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
                venezuelaV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
            }
        }
        
    }
           /*
ecuadorC.text = json["results"]["FXRatesUSD"][index]["Compra"].stringValue
ecuadorV.text = json["results"]["FXRatesUSD"][index]["Venta"].stringValue
*/


}
