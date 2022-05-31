//
//  InicioViewController.swift
//  PM2_ProyectoFinal_AppDeSeguimientoDeVentas
//
//  Created by Alexander Tapia on 26/05/22.
//

import UIKit
import FirebaseAuth

class InicioViewController: UIViewController {
    
    var addButton: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true

        
    }
    @objc func addButtonAction(_ sender: UIBarButtonItem) {
        print("se ha cerrado sesion")
        let defaults = UserDefaults.standard
              defaults.removeObject(forKey: "email")
              print("Se eliminó la sesion")
              defaults.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
     }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addButton = UIBarButtonItem(title: "Cerrar Sesion", style: .plain, target: self, action: #selector(addButtonAction(_:)))
        addButton.tintColor = UIColor.red
        self.tabBarController?.navigationItem.rightBarButtonItem = self.addButton
        
       // self.navigationItem.setHidesBackButton(true, animated: true)
        //una vez que el usuario se logueo guardamos la sesion
                if let email = Auth.auth().currentUser?.email {
                    let defaults = UserDefaults.standard
                    defaults.set(email, forKey: "email")
                    title = email
                    print("Se guardó la sesion")
                    defaults.synchronize()
                }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
}


