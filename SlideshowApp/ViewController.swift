
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var main: UIButton!
    @IBOutlet weak var auto: UIButton!
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var back: UIButton!
    
    let image = ["cat1.jpg","cat2.jpg","cat3.jpg"]
    
    var x = 0
    var timer: Timer!
    var timer_sec: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.setBackgroundImage(UIImage(named: image[0]), for: .normal)
        
    }
    
    @IBAction func go(_ sender: Any) {
        
        switch x {
        case 0 :x += 1
        main.setBackgroundImage(UIImage(named: image[1]), for: .normal)
        case 1 :x += 1
        main.setBackgroundImage(UIImage(named: image[2]), for: .normal)
        case 2 :x = 0
        main.setBackgroundImage(UIImage(named: image[0]), for: .normal)
        default:break
        }
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        switch x {
        case 0 :x += 2
        main.setBackgroundImage(UIImage(named: image[2]), for: .normal)
        case 1 :x -= 1
        main.setBackgroundImage(UIImage(named: image[0]), for: .normal)
        case 2 :x -= 1
        main.setBackgroundImage(UIImage(named: image[1]), for: .normal)
        default:break
        }
        
    }
    
    
    @objc func updateTimer(timer: Timer) {
        timer_sec += 1
        if timer_sec % 2 == 0 {
            switch x {
            case 0 :x += 1
            main.setBackgroundImage(UIImage(named: image[1]), for: .normal)
            case 1 :x += 1
            main.setBackgroundImage(UIImage(named: image[2]), for: .normal)
            case 2 :x = 0
            main.setBackgroundImage(UIImage(named: image[0]), for: .normal)
            default:break
            }
        }
    }
    
    @IBAction func auto(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            auto.setTitle("停止", for: .normal)
            go.isEnabled = false
            back.isEnabled = false
        }
        else {
            self.timer.invalidate()
            self.timer = nil
            auto.setTitle("再生", for: .normal)
            go.isEnabled = true
            back.isEnabled = true
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.x = x
        
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            auto.setTitle("再生", for: .normal)
            go.isEnabled = true
            back.isEnabled = true
        }
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

