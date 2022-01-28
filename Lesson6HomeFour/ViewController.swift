//
//  ViewController.swift
//  Lesson6HomeFour
//
//  Created by user on 26/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private lazy var instagramm: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "inst")
        return view
    }()
    
    private lazy var directButton: UIButton = {
        let view = UIButton()
        view.imageView?.image = UIImage(named: "b")
        return view
    }()
    
    private lazy var collectionViewSt: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(TestCellWork.self, forCellWithReuseIdentifier: "TestCellWork")
        
        return view
    }()
    
    private lazy var nickPricc: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "pricc1")
        return view
    }()

//    private lazy var collectionRiccLenta: UICollectionView = {
//        
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        
//        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        view.delegate = self
//        view.dataSource = self
//        view.register(PricCell.self, forCellWithReuseIdentifier: "PricCell")
//        
//        return view
//    }()
    
    private lazy var ric1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "rata")
        return view
    }()
    
    private var stories = ["1", "2", "3", "4", "5", "6", "7"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        
        view.backgroundColor = .white
        
        view.addSubview(instagramm)
        instagramm.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(view.frame.height * 0.04)
            make.height.equalTo(view.frame.height * 0.06)
        }
        
//        view.addSubview(directButton)
//        directButton.snp.makeConstraints { make in
//            make.left.equalTo(instagramm.snp.right)
//            make.left.equalToSuperview().inset(200)
//            make.right.equalToSuperview()
//            make.top.equalToSuperview().offset(view.frame.height * 0.04)
//            make.height.width.equalTo(view.frame.height * 0.06)
//            make.bottom.equalToSuperview().inset(300)
//        }
        
        
        view.addSubview(collectionViewSt)
        collectionViewSt.snp.makeConstraints { make in
            make.top.equalTo(instagramm.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.height * 0.11)
        }

        view.addSubview(ric1)
        ric1.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(collectionViewSt.snp.bottom).inset(-5)
            make.height.equalTo(view.frame.height * 0.81)
        }
        
    }
    
    func collectionView(_ collectionViewSt: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(
            width: view.frame.width * 0.19,
            height: view.frame.height * 0.10)
    }
    

    func collectionView(_ collectionViewSt: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionViewSt: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }

    func collectionView(_ collectionViewSt: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let index = indexPath.row
        let cell = collectionViewSt.dequeueReusableCell(withReuseIdentifier: "TestCellWork", for: indexPath) as! TestCellWork
        
        cell.titleView.image = UIImage(named: String(stories[index]))

        return cell
    }
    
}
