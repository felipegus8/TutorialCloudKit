//
//  DaoCloudKit.swift
//  StarterProjectCloud
//
//  Created by Felipe Viberti on 29/09/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import Foundation
import CloudKit
public class DaoCloudKit
{
func addUsuario(usuario:Usuario)
{
    let recordId = CKRecordID(recordName: usuario.login)
    let record = CKRecord(recordType: "Usuario", recordID: recordId)
    let container = CKContainer.default()
    let publicDatabase = container.publicCloudDatabase
    
    publicDatabase.fetch(withRecordID: recordId) { (fetchedRecord,error) in
        
        if error == nil {
            
            print("Já existe esse usuário")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationErrorCadastro"), object: nil)
            
        }
            
        else {
            
            if(fetchedRecord == nil) {
                
                print("primeira vez que ta criando o usuário")
                record.setObject(usuario.login as CKRecordValue?, forKey: "login")
                record.setObject(usuario.senha as CKRecordValue?, forKey: "senha")
                
                publicDatabase.save(record, completionHandler: { (record, error) -> Void in
                    if (error != nil) {
                        print(error)
                    }
                    else{
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationSuccessCadastro"), object: nil)
                    }
                })
            }
        }
    }
}
    func fetchUsuarios()
    {
        let container = CKContainer.default()
        let publicDatabase = container.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "Usuario", predicate: predicate)
        
        publicDatabase.perform(query, inZoneWith: nil) { (results, error) -> Void in
            if error != nil {
                print(error)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationErrorInternet"), object: nil)
            }
            else {
                usuarios.removeAll()
                for result in results! {
                    let novoExame = Usuario(login: result.value(forKey:"login") as! String,senha:result.value(forKey: "senha") as! String)
                    usuarios.append(novoExame)
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationSuccessLogin"), object: nil)
            }
        }
        
    }

}
