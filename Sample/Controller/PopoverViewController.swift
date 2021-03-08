//
//  PopoverViewController.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/07.
//

import UIKit

class PopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel2 = UILabel() // ラベルの生成
        titleLabel2.frame = CGRect(x: -10, y: 50, width: UIScreen.main.bounds.size.width, height: 100) // 位置とサイズの指定
        titleLabel2.font = titleLabel2.font.withSize(1)
        titleLabel2.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel2.text = """
            応募が完了しました。
        """ // テキストの設定
        titleLabel2.font = titleLabel2.font.withSize(20)
        titleLabel2.numberOfLines = 0
        titleLabel2.textColor = UIColor.white // テキストカラーの設定
        titleLabel2.font = UIFont(name: "HiraKakuProN-W6", size: 17) // フォントの設定
        self.view.addSubview(titleLabel2)
        
        
        let titleLabel1 = UILabel() // ラベルの生成
        titleLabel1.frame = CGRect(x: -10, y: 160, width: UIScreen.main.bounds.size.width, height: 100) // 位置とサイズの指定
        titleLabel1.font = titleLabel1.font.withSize(1)
        titleLabel1.textAlignment = NSTextAlignment.center // 横揃えの設定
        titleLabel1.text = """
            応募いただき、ありがとうございます。
        """ // テキストの設定
        titleLabel1.numberOfLines = 0
        titleLabel1.textColor = UIColor.white // テキストカラーの設定
        titleLabel1.font = UIFont(name: "HiraKakuProN-W6", size: 17) // フォントの設定
        self.view.addSubview(titleLabel1) //
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
