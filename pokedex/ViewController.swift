//
//  ViewController.swift
//  pokedex
//
//  Created by Will Payne on 22/05/2017.
//  Copyright © 2017 Mugwump. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collection: UICollectionView!
  
  var pokemon = [Pokemon]()
  var musicPlayer: AVAudioPlayer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collection.dataSource = self
    collection.delegate = self
    initAudio()
    parsePokemonCSV()
  }
  
  func initAudio() {
    let path = Bundle.main.path(forResource: "ln2", ofType: "mp3")
    do {
      musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
      musicPlayer.prepareToPlay()
      musicPlayer.numberOfLoops = -1
      musicPlayer.play()
    } catch let err as NSError {
      print (err.description)
    }
  }
  
  func parsePokemonCSV() {
    let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
    
    do {
      let csv = try CSV(contentsOfURL: path!)
      let rows = csv.rows
      print(rows)
      
      for row in rows {
        let pokeId = Int(row["id"]!)!
        let name = row["identifier"]!
        let poke = Pokemon(name: name, pokedexId: pokeId)
        pokemon.append(poke)
      }
    } catch let err as NSError {
      print (err.debugDescription)
    }
    
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {

      cell.configureCell(pokemon: pokemon[indexPath.row])
      return cell
      
    } else {
      return UICollectionViewCell()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pokemon.count
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 110, height: 110)
  }
  
  @IBOutlet weak var musicButton: UIButton!
  
}

