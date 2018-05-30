
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var main: UIButton!
    @IBOutlet weak var auto: UIButton!
    
    let image1 = UIImage(named: "cat1.jpg")
    let image2 = UIImage(named: "cat2.jpg")
    let image3 = UIImage(named: "cat3.jpg")
    
    var x = 0
    var timer: Timer!
    var timer_sec: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            main.setBackgroundImage(image1, for: .normal)

    }

    @IBAction func go(_ sender: Any) {
        
        if self.timer == nil {
            switch x {
            case 0 :x += 1
            main.setBackgroundImage(image2, for: .normal)
            case 1 :x += 1
            main.setBackgroundImage(image3, for: .normal)
            case 2 :x = 0
            main.setBackgroundImage(image1, for: .normal)
            default:break
            }
        }
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        if self.timer == nil {
            switch x {
            case 0 :x += 2
            main.setBackgroundImage(image3, for: .normal)
            case 1 :x -= 1
            main.setBackgroundImage(image1, for: .normal)
            case 2 :x -= 1
            main.setBackgroundImage(image2, for: .normal)
            default:break
            }
        }
        
    }
    
    
    @objc func updateTimer(timer: Timer) {
        timer_sec += 1
        if timer_sec % 2 == 0 {
            switch x {
            case 0 :x += 1
            main.setBackgroundImage(image2, for: .normal)
            case 1 :x += 1
            main.setBackgroundImage(image3, for: .normal)
            case 2 :x = 0
            main.setBackgroundImage(image1, for: .normal)
            default:break
            }
        }
    }
    
    @IBAction func auto(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
                auto.setTitle("停止", for: .normal)
        }
        else {
            self.timer.invalidate()
            self.timer = nil
            auto.setTitle("再生", for: .normal)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let resultViewController:ResultViewController = segue.destination as! ResultViewController

        resultViewController.x = x
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

