//
//  CoreDataEndpoints.swift
//  Groupy
//
//  Created by Luan Fazolin on 04/07/23.
//

import Foundation
import UIKit
import CoreData

class ExampleCoreData {

    // declarar contexto do CoreData no arquivo em que o endpoint vai ser usado
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // variavel que vai receber um array de Users e ser usada no componente
    var items:[User]?

    // funcao de exemplo para fazer fetch de um User baseado em um criterio
    func fetchUser() {
        
        do {
            let request = User.fetchRequest() as NSFetchRequest<User>
            
            // define o(s) filtro(s) para a request
            let pred = NSPredicate(format: "username CONTAINS 'usernameProcurado'")
            request.predicate = pred
            
            // faz a request e adiciona no items apenas o User filtrado
            self.items = try context.fetch(request)
            
            DispatchQueue.main.async {
                // recarrega dados
                // self.tableView.reloadData()
            }
        }
        catch {
            
        }
    }
    // funcao de exemplo para fazer fetch de todos os Users
    func fetchUsers() {
        do {
            // importante: declarar self.items se tudo isso estiver dentro de uma classe
            items = try context.fetch(User.fetchRequest())
            
            // caso tenha uma table view, eh so descomentar as linhas abaixo para
            // renderiza-la novamente apos fazer o fetch de Users
            // DispatchQueue.main.async {
            //   self.tableView.reloadData()
            // }
        }
        catch {
            
        }
    }

    // funcao de exemplo para adicionar um User ao banco de dados
    // Nao eh necessario fazer uma funcao soh pra isso, basta adicionar
    // as linhas abaixo dentro de uma funcao que executa um botao (por exemplo
    // um buttonTapped)
    func addUser() {
        
        // instancia o objeto a ser adicionado no Core Data
        let newUser = User(context: self.context)
        newUser.name = "blabla"
        newUser.username = "blable"
        
        // salva o objeto no Core Data
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        // faz um refetch dos dados sendo exibidos para atualizar
        // self.fetchUsers()
    }

    // funcao de exemplo para deletar um usuario
    func deleteUser() {
        
        // pega o indice do User a ser deletado dentro do array de users
        // sendo exibido no componente
        let userIndex = 0
        
        // define referencia para qual User deletar
        let userToRemove = self.items![userIndex]
        
        // remove o usuario
        self.context.delete(userToRemove)
        
        // salva no core data
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        // faz um refetch dos dados sendo exibidos para atualizar
        // self.fetchUsers()
    }
    
    // funcao de exemplo para editar um usuario
    func editUser() {
        
        // define a referencia para qual User editar
        let userIndex = 0
        
        // define referencia para qual User editar
        let userToEdit = self.items![userIndex]
        
        // edita a propriedade desejada
        userToEdit.username = "newUsername"
        
        // salva no core data
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        // faz um refetch dos dados sendo exibidos para atualizar
        // self.fetchUsers()
    }
}

