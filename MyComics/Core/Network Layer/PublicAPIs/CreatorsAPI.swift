//
//  CreatorsAPI.swift
//  Generic View Controller
//
//  Created by Антон Сивцов on 25.06.2023.
//

import Foundation

protocol CreatorsAPI: ContentProvidable,
                      ComicsProvidable,
                      EventsProvidable,
                      SeriesProvidable,
                      StoriesProvidable where Content == CreatorEntity {}
