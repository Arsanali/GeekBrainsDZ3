//
//  DatabaseService.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 15.07.2021.
//

import Foundation
import RealmSwift

protocol DatabaseService {
    func saveUser(user: [Friends]) throws
    func saveUsers(users: [Friends]) throws
    func getUsers(observe: @escaping () -> ()) -> [Friends]
}

class RealmService: DatabaseService {
    private let schemaVersion: UInt64 = 3
    private let realm: Realm
    private var tokenForUsers: NotificationToken?
    init?(){
        let config = Realm.Configuration(schemaVersion: schemaVersion)
        guard let realm = try? Realm(configuration: config) else{ return nil }
        self.realm = realm
        print(realm.configuration.fileURL as Any)
    }
    
    func saveUser(user: [Friends]) throws {
        realm.beginWrite()
        realm.add(user)
        try realm.commitWrite()
    }
    
    func getUsers(observe: @escaping () -> ()) -> [Friends]{
        let users = realm.objects(Friends.self)
        tokenForUsers = users.observe {  (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let results):
                print(results)
            case let .update(results, deletions, insertions, modifications):
                observe()
                print(results, deletions, insertions, modifications)
            case .error(let error):
                print(error)
            }
            print("данные изменились")
        }
        return Array(users)
    }
    func saveUsers(users: [Friends]) throws{
        realm.beginWrite()
        realm.add(users)
        try realm.commitWrite()
    }
}


