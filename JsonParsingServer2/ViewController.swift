
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    var list: [[String:String]] = []
    var dicA: [String:[String:AnyObject]]!
    var arrB: [String]!
    var arr: [String]!
    var searchCon: UISearchController!
    @IBOutlet var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MOVIE"
        self.arrB = []
        getDataFromServer()
        self.myTable.delegate = self
        self.myTable.dataSource = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let predicateA = NSPredicate(format: "SELF CONTAINS[c] %@", searchCon.searchBar.text!)
        let arrF = (arrB as NSArray).filtered(using: predicateA)
        arr = arrF as? [String]
        self.myTable.reloadData()
    }
    
    func getDataFromServer() {
        
        self.searchCon = UISearchController(searchResultsController: nil)
        self.searchCon.searchResultsUpdater = self
        self.searchCon.searchBar.sizeToFit()
        self.myTable.tableHeaderView = searchCon.searchBar
        
        let sessionConfig = URLSessionConfiguration.default
        let sessionA = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let requestA = NSMutableURLRequest(url: URL(string: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20120101")!)
        requestA.httpMethod = "GET"
        
        let taskA = sessionA.dataTask(with: requestA as URLRequest) { (dataA, resA, errA) in            //  dataA = Json파일, resA = respond/응답, errA = error/에러
            
            if (errA == nil) {
                self.dicA = try! JSONSerialization.jsonObject(with: dataA!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:[String:AnyObject]]
                self.arrB.removeAll()
                self.list = self.dicA["boxOfficeResult"]!["dailyBoxOfficeList"] as! [[String : String]]
                for i in 0...self.list.count-1 {
                    self.arrB.append(self.list[i]["movieNm"]!)
                }
                
                DispatchQueue.main.async {
                    self.myTable.reloadData()
                }
            } else {
                print("ERROR")
            }
        }
        
        taskA.resume()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secVC: JiWonVC = JiWonVC()
        secVC.movieName = searchCon.isActive ? self.arr[indexPath.row] : self.list[indexPath.row]["movieNm"]
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchCon.isActive ? arr.count : list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.myTable.dequeueReusableCell(withIdentifier: "cellA", for: indexPath)
        cell.textLabel?.text = searchCon.isActive ? self.arr[indexPath.row] : self.list[indexPath.row]["movieNm"]
        cell.textLabel?.numberOfLines = 2
        return cell
    }
    
}

 
