//
//  GetUsersService.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation
import Alamofire

protocol GetUsersService  {
    func getUsers(completion: @escaping ((Result <Friends , Error>) -> ()))
    func getGroups(completion: @escaping ((Result <Groups , Error>) -> ()))
    func getPhotos(completion: @escaping ((Result <Photos , Error>) -> ()))
}


class GetUsersServiceImp: GetUsersService {
    
    func getUsers(completion: @escaping ((Result <Friends , Error>) -> ())) {
        
        AF.request("https://api.vk.com/method/friends.get?v=5.52&access_token=128d5b8063b47d07bfc758df824f738898500df4be9824791b4308179c744f68d7e590d0d28d9730fb4d4&fields=city,domain")
            .response { response in
                
                if let error = response.error {
                    print(error.localizedDescription , "ошибка")
                }
                guard let data = response.data else {return}
                
                do {
                    let model = try JSONDecoder().decode(Friends.self, from: data)
                    print(model as Any)
                } catch {
                    print("Ошибка" , error.localizedDescription)
                }
            }
        }
    
    func getGroups(completion: @escaping ((Result <Groups , Error>) -> ())) {
        AF.request("https://api.vk.com/method/groups.get?v=5.52&access_token=128d5b8063b47d07bfc758df824f738898500df4be9824791b4308179c744f68d7e590d0d28d9730fb4d4&user_id=309184057&extended=1")
            .response { response in
                
                if let error = response.error {
                    print(error.localizedDescription , "ошибка")
                }
                guard let data = response.data else {return}
                
                do {
                    let model = try JSONDecoder().decode(Groups.self, from: data)
                    print(model as Any)
                } catch {
                    print("Ошибка" , error.localizedDescription)
                }
            }
        }
    
    func getPhotos(completion: @escaping ((Result <Photos , Error>) -> ())) {
        AF.request("https://api.vk.com/method/photos.get?v=5.52&access_token=128d5b8063b47d07bfc758df824f738898500df4be9824791b4308179c744f68d7e590d0d28d9730fb4d4&album_id=wall&owner_id=-1")
            .response { response in
                
                if let error = response.error {
                    print(error.localizedDescription , "ошибка")
                }
                guard let data = response.data else {return}
                
                do {
                    let model = try JSONDecoder().decode(Photos.self, from: data)
                    print(model as Any)
                } catch {
                    print("Ошибка" , error.localizedDescription)
                }
            }
    }
}



