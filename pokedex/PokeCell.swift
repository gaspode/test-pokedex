//
//  PokeCell.swift
//  pokedex
//
//  Created by Will Payne on 23/05/2017.
//  Copyright © 2017 Mugwump. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
 
  @IBOutlet weak var thumbImg: UIImageView!
  @IBOutlet weak var nameLbl: UILabel!
  
  var pokemon: Pokemon!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    layer.cornerRadius = 5
  }
  
  func configureCell(pokemon: Pokemon) {
    self.pokemon = pokemon
    nameLbl.text = pokemon.name.capitalized
    thumbImg.image = UIImage(named: String(pokemon.pokedexId))
  }
  
}
