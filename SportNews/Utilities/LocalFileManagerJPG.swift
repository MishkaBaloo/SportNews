//
//  LocalFileManagerJPG.swift
//  SportNews
//
//  Created by Michael on 8/20/24.
//

import Foundation
import SwiftUI

class LocalFileManagerJPG {
    
    static let instance = LocalFileManagerJPG()
    private init () { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // crate folder
        createFolderIfNeeded(folderName: folderName)
        
        // get path to image
        guard
            let data = image.pngData(),
            let url = getURlForImage(imageName: imageName, folderName: folderName)
        else { return }
        
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. ImageName: \(imageName). \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        guard let url = getURlForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating directory. FolderName: \(folderName). \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    private func getURlForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".jpg")
    }
}