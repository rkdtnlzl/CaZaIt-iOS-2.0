//
//  RecentCafeView.swift
//  CaZait-iOS
//
//  Created by 강석호 on 2023/05/01.
//

import Foundation
import UIKit

class RecentCafeView: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(r: 255, g: 223, b: 217)
        self.view.backgroundColor = .black
        
        // 네비게이션 바 타이틀 설정
        self.title = "최근 본 매장"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // 뒤로가기 버튼 추가
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
        // 내비게이션 바 스타일 변경
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        
        
    }
    // 근데 지금 적용이 안됨...
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // 밝은 배경색일 경우에는 .darkContent
    }
    
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
}
