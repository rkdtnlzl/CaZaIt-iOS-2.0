//
//  NoticeView.swift
//  CaZait-iOS
//
//  Created by 강민수 on 2023/08/01.
//

import UIKit
import SnapKit

class NoticeView: UIViewController, UIGestureRecognizerDelegate {
    
    private let navigationBarAppearance : UINavigationBarAppearance = {
        let navigationBar = UINavigationBarAppearance()
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.shadowColor = UIColor.clear // 기존 그림자 색상 유지
        navigationBar.configureWithTransparentBackground()
        
        return navigationBar
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let titleLabel_1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "카자잇 서비스 런칭"
        label.numberOfLines = 1
        return label
    }()
    
    private let noticeTextView: UITextView = {
        let textView = UITextView()
        
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = .white
        
        return textView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        // 네비게이션컨트롤러를 통해서 Status Bar 색깔 변경
        self.navigationController?.navigationBar.barStyle = .black
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setupNavigation()
        view.addSubview(whiteView)
        view.addSubview(titleLabel_1)
        view.addSubview(noticeTextView)
        showTerms()
        
        
        self.whiteView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.titleLabel_1.snp.makeConstraints { make in
            make.leading.equalTo(self.whiteView.safeAreaLayoutGuide.snp.leading).inset(39)
            make.top.equalTo(self.whiteView.safeAreaLayoutGuide.snp.top).inset(41)
        }
        
        
        self.noticeTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(39)
            make.top.equalTo(self.titleLabel_1.snp.bottom).offset(25)
            make.bottom.equalTo(self.whiteView.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupNavigation() {
        self.title = "공지사항"
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        // 내비게이션 바 스타일 변경
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showTerms() {
        let termsText =
                """
                카자잇 어플에 가입해 주셔서 감사합니다
                
                더 나은 서비스를 제공할 수 있는 카자잇이 되겠습니다.
                """
        noticeTextView.text = termsText
        noticeTextView.textColor = .black
    }
}
