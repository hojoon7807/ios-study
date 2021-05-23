

import UIKit

class BountyViewController: UIViewController,UITableViewDataSource,
                            UITableViewDelegate{
    // refactorying mvvm
    // model
    // -- bountyInfo
    // view
    // viewModel
    let viewModel = BountyViewModel()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() 
    }
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as? ListCell else{ //downCasting
            return UITableViewCell()
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        return cell
    }
    //delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }

}
class ListCell:UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    func update(info:BountyInfo){
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}

class BountyViewModel {
    let bountyInfoList:[BountyInfo]=[
        BountyInfo(name: "brook", bounty: 1233134),
        BountyInfo(name: "chopper", bounty: 1515),
        BountyInfo(name: "luffy", bounty: 4152453253),
        BountyInfo(name: "franky", bounty: 124623),
        BountyInfo(name: "sanji", bounty: 323213245),
        BountyInfo(name: "nami", bounty: 646211),
        BountyInfo(name: "robin", bounty: 14364163),
        BountyInfo(name: "zoro", bounty: 6837374352),
    ]
    var sortedList:[BountyInfo]{
        let sortedList = bountyInfoList.sorted { (prev, next)  in
            return prev.bounty>next.bounty
        }
        return sortedList
    }
    var numOfBountyInfoList:Int{
        return bountyInfoList.count
    }
    func bountyInfo(at index:Int)->BountyInfo{
        return sortedList[index]
    }
}
