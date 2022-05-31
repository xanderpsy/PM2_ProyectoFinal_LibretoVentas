//
//  RegistroViewController.swift
//  PM2_ProyectoFinal_AppDeSeguimientoDeVentas
//
//  Created by Alexander Tapia on 26/05/22.
//

import UIKit
import FirebaseAuth

class RegistroViewController: UIViewController {

    @IBOutlet weak var btnCorreo: UITextField!
    @IBOutlet weak var btnContraseña: UITextField!
    @IBOutlet weak var btnConfirmarContraseña: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    @IBAction func btnRegistar(_ sender: UIButton) {
        if let email = btnCorreo.text, let password = btnContraseña.text, let cpassword = btnConfirmarContraseña.text {
            if password == cpassword{
                Auth.auth().createUser(withEmail: email, password: password) { resultado, error in
                    if let e = error{
                        
                        let alerta = UIAlertController(title: "Error", message: "Error al crear usuario error:\(e.localizedDescription)", preferredStyle: .alert)
                                let accionOk = UIAlertAction(title: "OK", style: .default)
                                alerta.addAction(accionOk)
                        self.present(alerta, animated: true)
                    }else{
                        self.performSegue(withIdentifier: "registarainicio", sender: self)
                    }
                }
                
            }else{
            let alerta = UIAlertController(title: "Error", message: "las contraseñas no coinciden", preferredStyle: .alert)
                    let accionOk = UIAlertAction(title: "OK", style: .default)
                    alerta.addAction(accionOk)
                       present(alerta, animated: true)
                
            }
        }
    }
    
}
