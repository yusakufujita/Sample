//
//  ViewController.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/05.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    private var articles:[Data] = []
    var searchResult = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Wantedly"
        
        searchbar.delegate = self
        searchbar.enablesReturnKeyAutomatically = false
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
//        // Do any additional setup after loading the view.
            fetch()
//        loadArticles()
//        print(articles.count)
//        print(articles)
//        print(data)

    }
    

    private func fetch() {
        let urlString = "https://www.wantedly.com/api/v1/projects?q=swift&page=1"
        let request = AF.request(urlString)
        request.responseJSON { (response) in
            do{
                //            print("response:",response)
                //取得したデータを変換
                guard let data = response.data else {return}
                print(data)
                let decoder = JSONDecoder()
                let article = try decoder.decode(Article.self, from: data)
                self.articles = article.data
                self.searchResult = article.data
                self.tableView.reloadData()
                print("article:",self.articles.count)
            }catch {
                print("変換に失敗しました:",error)
            }
            
            //            let article = try decode.decode(Article.self, from: data)
            //                print("article:",article.title)
            //            } catch {
            //                print("変換に失敗しました:",error)
            //            }
        }
    }
    
    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchbar.endEditing(true)
        //検索結果配列を空にする
        articles.removeAll()
        print(articles.description)
//        print(searchResult)
        if(searchbar.text == "") {
            //検索文字列が空の場合はすべてを表示する。
            articles = searchResult
        }else {
            //検索文字列を含むデータを検索結果配列に追加する。
//            for data in dataList {
//                if data.contains(searchbar.text!) {
//                    searchResult.append(data)
////                    print(data)
//                }
//                print(searchResult)
////                print(data)
//            }
//            print("成功")
        }
        //テーブルを再読み込みする。
        tableView.reloadData()
    }
    
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchbar.endEditing(true)
//        //検索結果配列を空にする
//        articles.removeAll()
//        print(articles.description)
////        print(searchResult)
//        if(searchbar.text == "") {
//            //検索文字列が空の場合はすべてを表示する。
//            articles = searchResult
//        }else {
//            //検索文字列を含むデータを検索結果配列に追加する。
////            for data in dataList {
////                if data.contains(searchbar.text!) {
////                    searchResult.append(data)
//////                    print(data)
////                }
////                print(searchResult)
//////                print(data)
////            }
////            print("成功")
//        }
//        tableView.reloadData()
//    }
    
    
    // loadする関数の定義
//    private func loadArticles() {
//        // APIを叩く
//        AF.request("https://www.wantedly.com/api/v1/projects?q=swift&page=1").response{ response in
//            guard let data = response.data else {
//                print("来てない")
//                return
//            }
//
////            print(data)
//            let decoder = JSONDecoder()
//            do {
//                // レスポンスを[Article]にデコード
//                let articles: [Data] = try decoder.decode([Data].self, from: data)
//                // 取得した記事をarticlesに代入
//                self.articles = articles
//                print("articlesの中身は、\(articles)")
//                // tableViewを更新
//                self.tableView.reloadData()
//            } catch {
//                print(error)
//            }
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let article = articles[indexPath.row]
        cell.set(imageUrl:article.image.i_320_131, title: article.title, Subtitle: article.looking_for, logoUrl:article.company.avatar.original,company_name: article.company.name)
//        cell.set(title: article.title, author: article.lookingFor,imageUrl: article.lookingFor, lookingFor: article.llookingFor)
        return cell
    }
    
    
}

extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.row)番目のセルをタップ")
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let detailVC = storyboard.instantiateInitialViewController() as! DetailViewController
//        // ③indexPathを使用してarticlesから選択されたarticleを取得
        let article = articles[indexPath.row]
//        detailVC.set(imageUrl: article.image.i_320_131, title: article.title, Subtitle: article.looking_for, logoUrl: article.company.avatar.original, company_name: article.company.name)
//        // ④urlとtitleを代入
        detailVC.mainTitle = article.title
        detailVC.subTitle = article.looking_for
        detailVC.ImageView = article.image.i_320_131
        detailVC.logoimage = article.company.avatar.original
        detailVC.company = article.company.name
        detailVC.Text = article.description
        detailVC.Founder = article.company.founder
        detailVC.FounderText = article.staffings[0].description
//        detailViewController.subtitleLabel?.text = article.looking_for
        
//        detailViewController.title = article.title
        navigationController?.pushViewController(detailVC, animated: true)
    }


    
}
