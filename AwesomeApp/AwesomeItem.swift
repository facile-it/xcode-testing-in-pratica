import Foundation
import UIKit

public func sumOfInts (a: Int, b: Int) -> Int {
    return a + b
}

public func downloadImage (imageURL: NSURL, callback: (UIImage?) -> ()) {
    let task = NSURLSession.sharedSession().downloadTaskWithRequest(NSURLRequest(URL: imageURL), completionHandler: { (tempLocalURL: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
        if let path = tempLocalURL?.path {
            let image = UIImage(contentsOfFile: path)
            NSFileManager.defaultManager().removeItemAtPath(path, error: nil)
            callback(image)
        }
        else {
            callback(nil)
        }
    })
    task.resume()
}

public class AwesomeItem {
    var name: String? = nil
}