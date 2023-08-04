//
//  StoriesAPI.swift
//  MyComics
//
//  Created by Антон Сивцов on 29.06.2023.
//

import Foundation

protocol StoriesAPI: ContentProvidable,
                     CharactersProvidable,
                     ComicsProvidable,
                     CreatorsProvidable,
                     EventsProvidable,
                     SeriesProvidable where Content == StoryEntity {}
