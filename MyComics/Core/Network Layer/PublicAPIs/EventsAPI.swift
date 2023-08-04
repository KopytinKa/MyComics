//
//  EventsAPI.swift
//  MyComics
//
//  Created by Антон Сивцов on 28.06.2023.
//

import Foundation

protocol EventsAPI: ContentProvidable,
                    ComicsProvidable,
                    CreatorsProvidable,
                    SeriesProvidable,
                    StoriesProvidable where Content == EventEntity {}
