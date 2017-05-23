//
//  Pokemon.swift
//  pokedex
//
//  Created by Will Payne on 23/05/2017.
//  Copyright © 2017 Mugwump. All rights reserved.
//

import Foundation

class Pokemon {
  
  private var _name: String!
  private var _pokedexId: Int!
  
  var name: String {
    return _name
  }
  
  var pokedexId: Int {
    return _pokedexId
  }
  
  init(name: String, pokedexId: Int) {
    self._name = name
    self._pokedexId = pokedexId
  }

}
