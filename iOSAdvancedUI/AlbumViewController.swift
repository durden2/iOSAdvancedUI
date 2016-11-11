//
//  AlbumViewController.swift
//  iOSAdvancedUI
//
//  Created by Michal on 11/11/16.
//  Copyright © 2016 Michal. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    var album: Album?;
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    // MARK: Navigation
    // This method lets you configure a view controller before it's presented.
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveBtn === sender {
            let artist = artistTextField.text ?? ""
            let title = titleTextField.text ?? ""
            let genre = genreTextField.text ?? ""
            let year = yearTextField.text ?? ""
            
            album = Album(artist: artist, album: title, date: year, genre: genre)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
