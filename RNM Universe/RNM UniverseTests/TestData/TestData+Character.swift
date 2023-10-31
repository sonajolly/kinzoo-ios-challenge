//
//  TestData+Character.swift
//  RNM UniverseTests
//
//  Created by Sona Maria Jolly on 29/10/23.
//

import Foundation
@testable import RNM_Universe

struct TestData {}
extension TestData {
    struct Characters {
        static var character1 = Character(id: 1,
                                          name: "Rick Sanchez",
                                          status: .alive,
                                          species: "Human",
                                          type: "",
                                          gender: .male,
                                          origin: Location(
                                            name: "Earth (C-137)",
                                            url: "https://rickandmortyapi.com/api/location/1"),
                                          location: Location(
                                            name: "Citadel of Ricks",
                                            url: "https://rickandmortyapi.com/api/location/3"),
                                          image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                          episode: [
                                            "https://rickandmortyapi.com/api/episode/1",
                                            "https://rickandmortyapi.com/api/episode/14"],
                                          url: "https://rickandmortyapi.com/api/character/1",
                                          created: "2017-11-04T18:48:46.250Z")
        static var character2 = Character(id: 2,
                                          name: "Morty Smith",
                                          status: .dead,
                                          species: "Alien",
                                          type: "",
                                          gender: .female,
                                          origin: Location(
                                            name: "unknown",
                                            url: ""),
                                          location: Location(
                                            name: "Citadel of Ricks",
                                            url: "https://rickandmortyapi.com/api/location/3"),
                                          image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                                          episode: [
                                            "https://rickandmortyapi.com/api/episode/48"],
                                          url: "https://rickandmortyapi.com/api/character/2",
                                          created: "2017-11-04T18:50:21.651Z")
        
    }
}
