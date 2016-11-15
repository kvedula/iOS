//
//  ViewController.swift
//  pokedex
//
//  Created by Varun Shenoy on 7/14/16.
//  Copyright © 2016 techlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    struct Pokemon {
        var name = ""
        var pokeId = 0
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var currentNumber: UILabel!
    
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        parsePokemonCSV()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parsePokemonCSV() {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokeId: pokeId)
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let  cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        
        let poke = pokemon[indexPath.row]
        
        let pokeImage = cell.viewWithTag(1) as! UIImageView
        pokeImage.image = UIImage(named: "\(poke.pokeId)")
        
        let pokeLabel = cell.viewWithTag(2) as! UILabel
        pokeLabel.text = poke.name.capitalizedString
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(90, 90)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        UIView.animateWithDuration(0.3) { 
            self.mainImage.alpha = 0
        }
        
        let poke = pokemon[indexPath.row]
        mainImage.image =  UIImage(named: "\(poke.pokeId)")
        mainLabel.text = poke.name.capitalizedString
        currentNumber.text = "#\(poke.pokeId)"
        
        UIView.animateWithDuration(0.3) {
            self.mainImage.alpha = 1
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }


}

