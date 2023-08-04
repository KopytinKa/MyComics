//
//  CharactersAPI.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

protocol CharactersAPI: ContentProvidable,
                        ComicsProvidable,
                        EventsProvidable,
                        SeriesProvidable,
                        PageableContent,
                        SearchableContent,
                        StoriesProvidable where Content == CharacterEntity {}
