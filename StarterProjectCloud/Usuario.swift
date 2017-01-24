//
//  Usuario.swift
//  VideoCloud
//
//  Created by Felipe Viberti on 28/09/16.
//  Copyright © 2016 Felipe Viberti. All rights reserved.
//

import Foundation
public var usuarios:[Usuario] = []

public class Usuario
{
    var login:String!
    var senha:String!
    init(login:String,senha:String)
    {
        self.login = login
        self.senha = senha
    }
}
