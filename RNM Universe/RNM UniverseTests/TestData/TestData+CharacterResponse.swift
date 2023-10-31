//
//  TestData+CharacterResponce.swift
//  RNM UniverseTests
//
//  Created by Sona Maria Jolly on 29/10/23.
//

import Foundation
extension TestData {
    struct CharacterResponse {
        static let responseData = """
    {
"info": {
        "count": 826,
        "pages": 42,
        "next": "https://rickandmortyapi.com/api/character?page=2",
        "prev": null
    },
"results": [
        {
            "id": 1,
            "name": "Rick Sanchez",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
                "name": "Earth (C-137)",
                "url": "https://rickandmortyapi.com/api/location/1"
            },
            "location": {
                "name": "Citadel of Ricks",
                "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "episode": [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/14"
            ],
            "url": "https://rickandmortyapi.com/api/character/1",
            "created": "2017-11-04T18:48:46.250Z"
        },
        {
            "id": 2,
            "name": "Morty Smith",
            "status": "Dead",
            "species": "Alien",
            "type": "",
            "gender": "Female",
            "origin": {
                "name": "unknown",
                "url": ""
            },
            "location": {
                "name": "Citadel of Ricks",
                "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            "episode": [
                "https://rickandmortyapi.com/api/episode/48"
            ],
            "url": "https://rickandmortyapi.com/api/character/2",
            "created": "2017-11-04T18:50:21.651Z"
        }]}
""".data(using: .utf8)
        static let secondResponseData = """
    {
"info": {
        "count": 826,
        "pages": 42,
        "next": "https://rickandmortyapi.com/api/character?page=3",
        "prev": null
    },
"results": [
        {
            "id": 3,
            "name": "Sanchez",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
                "name": "Earth (C-137)",
                "url": "https://rickandmortyapi.com/api/location/1"
            },
            "location": {
                "name": "Citadel of Ricks",
                "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "episode": [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/14"
            ],
            "url": "https://rickandmortyapi.com/api/character/1",
            "created": "2017-11-04T18:48:46.250Z"
        },
        {
            "id": 4,
            "name": "Smith",
            "status": "Dead",
            "species": "Alien",
            "type": "",
            "gender": "Female",
            "origin": {
                "name": "unknown",
                "url": ""
            },
            "location": {
                "name": "Citadel of Ricks",
                "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            "episode": [
                "https://rickandmortyapi.com/api/episode/48"
            ],
            "url": "https://rickandmortyapi.com/api/character/2",
            "created": "2017-11-04T18:50:21.651Z"
        }]}
""".data(using: .utf8)
    }
}
