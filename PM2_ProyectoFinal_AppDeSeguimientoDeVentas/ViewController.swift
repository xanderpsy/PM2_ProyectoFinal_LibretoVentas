//
//  ViewController.swift
//  PM2_ProyectoFinal_AppDeSeguimientoDeVentas
//
//  Created by Alexander Tapia on 23/05/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var tFCorreo: UITextField!
    @IBOutlet weak var tFContraseña: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Alex: - Valida si esta la sesion guardada
                let defaults = UserDefaults.standard
                if let email = defaults.value(forKey: "email") as? String{
                    //utilizar segue para ir al HOME VC
                    print(email)
                    print("Se encontro la sesion guardada y se navega a HOME VC")
                    performSegue(withIdentifier: "loginainicio", sender: self)
                }
    }
    @IBAction func btnIniciar(_ sender: UIButton) {
        
        if let email = tFCorreo.text, let pass = tFContraseña.text {
            Auth.auth().signIn(withEmail: email, password: pass){ [weak self] authResult, error in
                if let e = error {
                    let alerta = UIAlertController(title: "Error", message: "Error al iniciar sesion error:\(e.localizedDescription)", preferredStyle: .alert)
                            let accionOk = UIAlertAction(title: "OK", style: .default)
                            alerta.addAction(accionOk)
                    self?.present(alerta, animated: true)
                }else{
                    self?.performSegue(withIdentifier: "loginainicio", sender: self)
                    
                }
            }
        }
    }
    

}

