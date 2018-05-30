
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var main2: UIImageView!
    
    let image = ["cat1.jpg","cat2.jpg","cat3.jpg"]
    
    var x = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch x {
        case 0 :main2.image = UIImage(named: image[0])
        case 1 :main2.image = UIImage(named: image[1])
        case 2 :main2.image = UIImage(named: image[2])
        default:break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
