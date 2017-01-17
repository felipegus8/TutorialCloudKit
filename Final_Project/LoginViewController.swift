//
//  LoginViewController.swift
//  VideoCloud
//
//  Created by Felipe Viberti on 28/09/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var senha: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.actOnNotificationSuccessLogin), name: NSNotification.Name(rawValue: "notificationSuccessLogin"), object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func confirma(_ sender: UIButton) {
        DaoCloudKit().fetchUsuarios()
    }
    
    func actOnNotificationSuccessLogin()
    {
        for valor in usuarios
        {
            print(valor.login)
            print(valor.senha)
            if valor.login! == login.text! && valor.senha == senha.text!
            {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
            }
        }
        
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
