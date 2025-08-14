# WWTableViewParallaxCell
[![Swift-5.7](https://img.shields.io/badge/Swift-5.7-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-16.0](https://img.shields.io/badge/iOS-16.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![TAG](https://img.shields.io/github/v/tag/William-Weng/WWTableViewParallaxCell) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Implementing parallax scrolling effect.](https://blog.csdn.net/baby_hua/article/details/50378138)
- [實現視差捲動效果](https://www.cnblogs.com/xiaofeixiang/p/5152828.html)


<video height="480" auto controls>
  <source src="https://github.com/user-attachments/assets/94ebd815-fb83-4786-9692-697e4961a960" type="video/mp4">
</video>

https://github.com/user-attachments/assets/94ebd815-fb83-4786-9692-697e4961a960

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)

```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWTableViewParallaxCell.git", .upToNextMajor(from: "1.0.0"))
]
```

### [WWTableViewParallaxCell](https://ezgif.com/video-to-webp)
|函式|功能|
|-|-|
|parallaxImageView()|取得要實現視差的UIImageView|

### Example
```swift
import UIKit
import WWTableViewParallaxCell

final class TableViewDemoController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        TableViewParallaxCell._parallaxCells(myTableView, didScrollOnView: view)
    }
}

extension TableViewDemoController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewParallaxCell", for: indexPath) as! TableViewParallaxCell
        cell.myImageView.image = UIImage(named: "Image00\(indexPath.row + 1)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width * 0.75
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        TableViewParallaxCell._parallaxCells(myTableView, didScrollOnView: view)
    }
}
```
```swift
import UIKit
import WWTableViewParallaxCell

class TableViewParallaxCell: UITableViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
}

// MARK: - WWTableViewParallaxCell
extension TableViewParallaxCell: WWTableViewParallaxCell {
    
    func parallaxImageView() -> UIImageView { return myImageView }
}
```
