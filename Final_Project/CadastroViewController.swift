//
//  CadastroViewController.swift
//  VideoCloud
//
//  Created by Felipe Viberti on 28/09/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmarSenha: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       NotificationCenter.default.addObserver(self, selector: #selector(CadastroViewController.actOnNotificationSuccessCadastro), name: NSNotification.Name(rawValue: "notificationSuccessCadastro"), object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func confirma(_ sender: UIButton) {
        DaoCloudKit().addUsuario(usuario: Usuario(login: login.text!, senha: senha.text!))
    }
    func actOnNotificationSuccessCadastro()
    {
        self.dismiss(animated: true, completion: nil)
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
