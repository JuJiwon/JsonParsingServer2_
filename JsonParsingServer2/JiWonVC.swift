
import UIKit

class JiWonVC: UIViewController {
    
    var movieName: String!
    var myImageV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = self.movieName
        
        self.myImageV = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
        self.myImageV.backgroundColor = UIColor.red
        self.view.addSubview(myImageV)
        
        if movieName == "미션임파서블:고스트프로토콜" {
            self.myImageV.image = UIImage(named: "0.png")
        } else if movieName == "마이 웨이" {
            self.myImageV.image = UIImage(named: "1.png")
        } else if movieName == "셜록홈즈 : 그림자 게임" {
            self.myImageV.image = UIImage(named: "2.png")
        } else if movieName == "퍼펙트 게임" {
            self.myImageV.image = UIImage(named: "3.png")
        } else if movieName == "프렌즈: 몬스터섬의비밀 " {
            self.myImageV.image = UIImage(named: "4.png")
        } else if movieName == "라이온 킹" {
            self.myImageV.image = UIImage(named: "5.png")
        } else if movieName == "오싹한 연애" {
            self.myImageV.image = UIImage(named: "6.png")
        } else if movieName == "극장판 포켓몬스터 베스트 위시「비크티니와 백의 영웅 레시라무」" {
            self.myImageV.image = UIImage(named: "7.png")
        } else if movieName == "앨빈과 슈퍼밴드3" {
            self.myImageV.image = UIImage(named: "8.png")
        } else if movieName == "극장판 포켓몬스터 베스트 위시 「비크티니와 흑의 영웅 제크로무」" {
            self.myImageV.image = UIImage(named: "9.png")
        }
    
       
    }
    
}
