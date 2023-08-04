//
//  EventsProvidable.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol EventsProvidable {
    func getEvents(by id: Int, completion: @escaping ([EventEntity]?) -> Void)
}
