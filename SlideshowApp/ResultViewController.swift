
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var main2: UIImageView!
    
    let image1 = UIImage(named: "cat1.jpg")
    let image2 = UIImage(named: "cat2.jpg")
    let image3 = UIImage(named: "cat3.jpg")
    
    var x = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch x {
        case 0 :main2.image = image1
        case 1 :main2.image = image2
        case 2 :main2.image = image3
        default:break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
