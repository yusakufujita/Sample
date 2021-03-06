//
//  ViewController.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/05.
//

import UIKit
import Alamofire


class ViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var articles:[Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
   
    
    
        
        loadArticles()
        print(articles.count)
        print(articles)
//        print(data)

    }
    
    // loadする関数の定義
    private func loadArticles() {
        // APIを叩く
        AF.request("https://www.wantedly.com/api/v1/projects?q=swift&page=1").response{ response in
            guard let data = response.data else {
                print("来てない")
                return
            }
            
//            print(data)
            let decoder = JSONDecoder()
            do {
                // レスポンスを[Article]にデコード
                let articles: [Article] = try decoder.decode([Article].self, from: data)
                // 取得した記事をarticlesに代入
                self.articles = articles
//                print("articlesの中身は、\(articles)")
                // tableViewを更新
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
//        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
//        let article = articles[indexPath.row]
//        cell.set(imageUrl:article.image_url.i_320_131 , title: article.title, Subtitle: article.lookingFor, logoUrl:article.company.avatar.orignal,company_name: article.company.name)
//        cell.set(title: article.title, author: article.lookingFor,imageUrl: article.lookingFor, lookingFor: article.llookingFor)
        return cell
    }
    
    
}

extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let detailViewController = storyboard.instantiateInitialViewController() as! DetailViewController
        // ③indexPathを使用してarticlesから選択されたarticleを取得
        let article = articles[indexPath.row]
        // ④urlとtitleを代入
//        detailViewController.url = article.lookingFor
//        detailViewController.title = article.title
        navigationController?.pushViewController(detailViewController, animated: true)
    }


    
}
