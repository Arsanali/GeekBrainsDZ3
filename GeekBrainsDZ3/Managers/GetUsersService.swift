//
//  GetUsersService.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation
import Alamofire
import RealmSwift
import DynamicJSON

protocol GetUsersService  {
    func getUsers(params: FriendsRequest, completion: @escaping (Result<[Friends], Error>) -> ())
    func getGroups(completion: @escaping ((Result <Groups  , Error>) -> ()))
    func getPhotos(completion: @escaping ((Result <Photos  , Error>) -> ()))
}


class GetUsersServiceImp: GetUsersService {
    
    private let baseURL = DefaultURL.baseURL
    private let method = "/friends.get"
    private let version = "5.21"
    
    //MARK: - Метод для получения списка пользователя
    func getUsers(params: FriendsRequest, completion: @escaping ( Result<[Friends], Error>)  -> ()){
            guard let url = URL(string: baseURL+method) else{
                return
            }
            AF.request(url, method: .get, parameters: params.params).responseData { response in
                guard let data = response.data else{
                    return
                }
                
                guard let items = JSON(data).response.items.array else {return}
                var users: [Friends] = []
                
                items.forEach{
                    if let user = Friends(json: $0){
                        
                        users.append(user)
                        completion(.success(users))
                        print(users.count)
                        }
                    }
                }
            }
    //MARK: - Метод для получения списпка групп
    func getGroups(completion: @escaping ((Result <Groups , Error>) -> ())) {
        AF.request("https://api.vk.com/method/groups.get?v=5.52&access_token=f57fc7f86a11c91218ca174e69a8a3189b7bc9ec8cac5ae6e32fd5f3e89caa48a914722f5841fb1e3daab&fields=photo_100&extended=1")
            .response { response in
                
                if let error = response.error {
                    print(error.localizedDescription , "ошибка")
                }
                guard let data = response.data else {return}
                
                do {
                    let model = try JSONDecoder().decode(Groups.self, from: data)
                    completion(.success(model))
                    print(model as Any)
                } catch {
                    completion(.failure(error))
                    print("Ошибка" , error.localizedDescription)
                }
            }
        }
    //MARK: - Метод для получения фотографий
    func getPhotos(completion: @escaping ((Result <Photos , Error>) -> ())) {
        AF.request("https://api.vk.com/method/photos.get?v=5.52&access_token=f57fc7f86a11c91218ca174e69a8a3189b7bc9ec8cac5ae6e32fd5f3e89caa48a914722f5841fb1e3daab&fields=photo_100&extended=1&album_id=wall")
            .response { response in
                
                if let error = response.error {
                    print(error.localizedDescription , "ошибка")
                }
                guard let data = response.data else {return}
                
                do {
                    let model = try JSONDecoder().decode(Photos.self, from: data)
                    completion(.success(model))
                    print(model as Any)
                } catch {
                    completion(.failure(error))
                    print("Ошибка" , error.localizedDescription)
                }
            }
        }
}



