//
//  AlbumTableViewController.swift
//  iOSAdvancedUI
//
//  Created by Michal on 11/11/16.
//  Copyright © 2016 Michal. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {

    // MARK: Properties
    
    var albums = [Album]()
    var albums2: NSMutableArray = [];
    var plistCatPath = "";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plistCatPath = Bundle.main.path(forResource: "albums", ofType: "plist")!;
        albums2 = NSMutableArray(contentsOfFile:plistCatPath)!;
        loadSampleAlbums();
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.saveDataToFile), name: UIApplicationWillResignActiveNotification, object: nil);
        
        let gestureRecogn = UIGestureRecognizer(target: self, action: #selector(AlbumTableViewController.onTap))
        
        let img = self.view.viewWithTag(200)
        img?.addGestureRecognizer(gestureRecogn)
    }
    
    func onTap() {
        print("tap");
    }
    
    func loadSampleAlbums() {
        let count = albums2.count;
        let photo1 = UIImage(named: "Image")
        print(count);
        for index in 0...count-1 {
            let album:NSDictionary = albums2[index] as! NSDictionary
            print(album["title"])
            let albumtoSave = Album(artist: album["artist"] as? String, album: album["title"] as? String, date: album["date"] as? String, genre: album["genre"] as? String, rating: album["rating"] as? Int, photo: photo1!, number: index);
            albums += [albumtoSave]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return albums2.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "AlbumTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AlbumTableViewCell
        let album = albums[indexPath.row]

        cell.albumLabel.text = album.albumName
        cell.artistLabel.text = album.artistName
        cell.imageView?.image = album.photoImage

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToAlbumList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AlbumViewController, let album = sourceViewController.album {
            let newIndexPath = NSIndexPath(row: albums2.count, section: 0)
            print(album)
            albums2.add(album)
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
        }
    }

}
