//
//  GetUsersService.swift
//  GeekBrainsDZ3
//
//  Created by Arslanali on 23.06.2021.
//

import Foundation
import Alamofire

protocol GetUsersService  {
    func getUsers (completion: @escaping ((Result <Friends , Error>) -> ()))
    func getGroups(completion: @escaping ((Result <Groups  , Error>) -> ()))
    func getPhotos(completion: @escaping ((Result <Photos  , Error>) -> ()))
}


class GetUsersServiceImp: GetUsersService {
    
    //MARK: - Метод для получения списка пользователя
    func getUsers(completion: @escaping ((Result <Friends , Error>) -> ())) {
        
        AF.request("https://api.vk.com/method/friends.get?v=5.52&access_token=c5cbdb1689cde2c31bd5a2152e0e8c620cb529794b404c5104af77c914488e0f114fa9f00aa17c1d58af2&fields=photo_100")
            .response { response in
                
                if let error = response.error {
                    print(error.localizedDescription , "ошибка")
                }
                guard let data = response.data else {return}
                
                do {
                    let model = try JSONDecoder().decode(Friends.self, from: data)
                    completion(.success(model))
                    print(model)
                } catch(let error) {
                    completion(.failure(error))
                    print("Ошибка" , error.localizedDescription)
                }
            }
        }
    //MARK: - Метод для получения списпка групп
    func getGroups(completion: @escaping ((Result <Groups , Error>) -> ())) {
        AF.request("https://api.vk.com/method/groups.get?v=5.52&access_token=c5cbdb1689cde2c31bd5a2152e0e8c620cb529794b404c5104af77c914488e0f114fa9f00aa17c1d58af2&fields=photo_100&extended=1")
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
        AF.request("https://api.vk.com/method/photos.get?v=5.52&access_token=c5cbdb1689cde2c31bd5a2152e0e8c620cb529794b404c5104af77c914488e0f114fa9f00aa17c1d58af2&fields=photo_100&extended=1&album_id=wall")
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



