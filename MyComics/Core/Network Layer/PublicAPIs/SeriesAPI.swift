//
//  SeriesAPI.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol SeriesAPI: CharactersProvidable,
                    ComicsProvidable,
                    CreatorsProvidable,
                    EventsProvidable,
                    StoriesProvidable,
                    ContentProvidable where Content == SeriesEntity {}
