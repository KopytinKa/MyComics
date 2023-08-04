//
//  ComicsAPI.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

protocol ComicsAPI: CharactersProvidable,
                    EventsProvidable,
                    CreatorsProvidable,
                    StoriesProvidable,
                    ContentProvidable where Content == ComicEntity {}
