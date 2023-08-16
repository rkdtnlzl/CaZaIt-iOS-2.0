//
//  PlaceDetailTermsView.swift
//  CaZait-iOS
//
//  Created by 강석호 on 2023/07/31.
//

import Foundation
import UIKit
import SnapKit

class PersonalInfoDetailTermsView: UIViewController, UIGestureRecognizerDelegate{
    
    private let navigationBarAppearance : UINavigationBarAppearance = {
        let navigationBar = UINavigationBarAppearance()
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.shadowColor = UIColor.clear // 기존 그림자 색상 유지
        navigationBar.configureWithTransparentBackground()
        
        return navigationBar
    }()
    
    private let personalInfoTextView: UITextView = {
        let textView = UITextView()
        
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = UIColor(red: 1, green: 0.873, blue: 0.852, alpha: 1)
        
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
        view.backgroundColor = .black
        setupNavigation()
        showTerms()
        
        view.addSubview(personalInfoTextView)
        
        personalInfoTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    
    func setupNavigation() {
        self.title = "위치정보 기반 서비스 이용약관"
        
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
                    제1조(목적)
                    
                    본 약관은 회원(카자잇의 서비스 약관에 동의한 자를 말하며 이하 '회원'이라고 합니다)이 카자잇(이하 '회사'라고 합니다)가 제공하는 웹페이지 및 '카자잇' (회사가 개발 운영하는 모바일 애플리케이션을 말합니다 이하 '모바일앱'이라고 합니다)의 서비스를 이용함에 있어 회원과 회사의 권리 및 의무, 기타 제반 사항을 정하는 것을 목적으로 합니다.
                    
                    제2조(가입자격)
                    
                    서비스에 가입할 수 있는 회원은 위치기반서비스를 이용할 수 있는 이동전화 단말기의 소유자 본인이어야 합니다.
                    
                    제3조(서비스 가입)
                    
                    회사는 다음 각 호에 해당하는 가입신청을 승낙하지 않을 수 있습니다.
                    
                    실명이 아니거나 타인의 명의를 사용하는 등 허위로 신청하는 경우
                    고객 등록 사항을 누락하거나 오기하여 신청하는 경우
                    공공질서 또는 미풍양속을 저해하거나 저해할 목적을 가지고 신청하는 경우
                    기타 회사가 정한 이용신청 요건이 충족되지 않았을 경우
                    
                    제4조(서비스 해지)
                    
                    회원은 회사가 정한 절차를 통해 서비스 해지를 신청할 수 있습니다.
                    
                    제5조(이용약관의 효력 및 변경)
                    
                    본 약관은 서비스를 신청한 고객 또는 개인위치정보주체가 회사가 정한 소정의 절차에 따라 회원으로 등록함으로써 효력이 발생합니다.
                    서비스를 신청한 고객 또는 개인위치정보주체가 온라인에서 본 약관을 모두 읽고 "동의하기" 버튼을 클릭하였을 경우 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다.
                    본 약관에 대하여 동의하지 않은 경우, 회사가 개인위치정보를 기반으로 제공하는 각종 혜택 및 편의제공에 일부 제한이 발생할 수 있습니다.
                    회사는 필요한 경우 '위치 정보의 보호 및 이용 등에 관한 법률, '콘텐츠산업 진흥법', '전자상거래 등에서의 소비자보호에 관한 법률', '소비자기본법', '약관의 규제에 관한 법률 등 관계법령(이하 '관계법령'이라 합니다)의 범위 내에서 본 약관을 개정할 수 있습니다.
                    회사가 약관을 개정할 경우 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 10일 전부터 적용일 이후 상당한 기간 동안 회사의 웹페이지 및 모바일앱을 통해 공지합니다. 다만, 개정약관의 내용이 회원에게 새로운 의무를 부과하거나 권리를 제한하는 내용인 경우 그 적용일자 30일 전부터 상당한 기간 동안 이를 회사의 웹페이지 및 모바일앱을 통해 공지하고, 회원에게 전자적형태로 약관의 개정사실을 발송하여 고지합니다.
                    
                    제6조(약관 외 준칙)
                    
                    본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 및 건전한 거래관행에 따릅니다.
                    
                    제7조(서비스의 내용)
                    
                    회사가 제공하는 서비스는 아래와 같습니다.
                    
                    길 안내 등 생활편의 서비스 제공
                    
                    
                    제8조(서비스 이용요금)
                    
                    회사의 서비스는 무료제공을 원칙으로 합니다.
                    전항에도 불구하고 무선 서비스 이용시 발생하는 데이터 통신료는 별도이며, 이 때 부과되는 데이터 통신료는 회원이 가입한 각 이동통신사의 정책에 따릅니다.
                    멀티미디어 메시지 서비스(MMS) 등으로 게시물을 등록할 경우 발생하는 요금은 각 이동통신사의 요금정책에 따라 회원이 부담합니다.
                    
                    제9조(서비스내용 변경 통지 등)
                    
                    회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 회원이 등록한 전자우편 주소로 이메일을 발송하여 서비스 내용의 변경 사항 또는 종료를 사전 일주일 전에 통지합니다.
                    전항의 경우 불특정 다수의 회원을 상대로 통지하는 때에는 회사의 웹페이지 등을 통해 공지함으로써 회원들에게 통지할 수 있습니다.
                    
                    제10조(서비스이용의 제한 및 중지)
                    
                    회사는 아래 각 호에 해당하는 사유가 발생한 경우에는 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다.
                    회원이 회사의 서비스 운영을 고의 또는 과실로 방해하는 경우
                    서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우
                    전기통신사업법에 규정된 기간통신사업자가 서비스를 중지했을 경우
                    국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때
                    기타 중대한 사유로 회사가 서비스 제공을 지속하는 것이 곤란한 경우
                    회사가 전항에 따라 서비스의 이용을 제한하거나 중지한 때에는 해당사실을 인터넷 등에 공지하거나 고객에게 통지합니다. 다만 회사가 통제할 수 없는 사유로 인하여 서비스를 중단하게 되는 경우 이를 사후에 통지할 수 있습니다.
                    
                    
                    제11조(개인위치정보의 이용 또는 제공)
                    
                    회사가 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 본 약관에 대한 개인위치정보주체의 동의를 얻어야 합니다.
                    회사는 회원이 제공한 개인위치정보를 해당 회원의 동의 없이 서비스 제공 이외의 목적으로 이용하지 않습니다. 다만, 고객이 미리 요청한 경우 해당 내용을 고객이 지정한 통신단말장치(휴대전화 등)나 이메일 주소로 통보할 수 있습니다.
                    회사는 타사업자 또는 이용 고객의 민원처리 등을 위해 회원의 위치정보 이용 · 제공사실 확인자료를 자동 기록 · 보존하며, 해당 자료는 1년간 보관합니다.
                    회사가 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우, 위치정보를 수집한 당해 통신 단말장치로 매회 회원에게 제공받는 자, 제공일시, 제공목적을 즉시 통보합니다. 다만 다음 각호의 경우에는 회원이 미리 지정한 통신단말장치 또는 전자우편주소로 통보합니다.
                    개인위치정보를 수집한 통신단말장치가 문자, 음성 또는 영상 수신기능을 갖추지 아니한 경우
                    회원이 다른 방법을 요청한 경우
                    
                    
                    제12조(개인위치정보의 보유기간 및 이용기간)
                    
                    회사가 회원의 개인위치정보를 이용하였다면 회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항의 규정에 따라 기록 · 보존해야 하는 위치정보이용 제공사실 확인자료 이외의 해당 개인위치정보를 같은 법 제23조에 따라 고객이 동의한 목적범위 내에서 이용하고 고객 응대를 위하여 1년간 보유하며, 이 기간이 지나면 즉시 파기합니다.
                    전항에도 불구하고 관계법령 등에서 개인위치정보를 보존할 의무 및 필요성이 있는 경우에는 그에 따라 보존합니다.
                    
                    
                    제13조(개인위치정보 주체의 권리)
                    
                    회원은 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다.
                    회원은 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있습니다.
                    회원은 회사에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유 없이 회원의 요구를 거절할 수 없습니다.
                    본인에 대한 위치정보 이용, 제공사실 확인자료
                    본인의 위치정보가 제3자에게 제공된 이유 및 내용
                    회원은 회사가 정한 절차에 따라 제1항 내지 제3항의 권리를 행사할 수 있습니다.
                    
                    제14조(법정대리인의 권리)
                    
                    회사는 14세 미만 회원에 대해서는 당해 회원과 회원의 법정대리인으로부터 모두 동의를 받은 경우에만 개인위치정보를 이용한 서비스를 제공합니다. 이 경우 법정대리인은 본 약관에 의한 회원의 권리를 모두 가지며 회사는 법정대리인을 회원으로 봅니다.
                    회사는 14세 미만 회원의 개인위치정보 및 위치정보 이용, 제공사실에 관한 확인자료를 본 약관에 명시 또는 고지한 범위를 넘어 이용하거나, 제3자에게 제공하고자 하는 경우 당해 회원과 회원의 법정대리인에게 모두 동의를 받아야합니다. 다만 다음 각호의 경우는 제외합니다.
                    개인위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우
                    통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우
                    기타 관계법령에 특별한 규정이 있는 경우
                    
                    제15조(위치정보관리책임자의 지정)
                    
                    회사는 위치정보를 적절히 관리, 보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보의 관리책임자로 지정하고 운영합니다.
                    회사의 위치정보관리책임자는 위치기반서비스의 제공에 관한 제반 사항을 담당 · 관리하는 부서의 총괄팀장으로서, 구체적인 사항은 본 약관의 부칙에 따릅니다.
                    
                    제16조(손해배상)
                    
                    회사가 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 제26조의 규정을 위반한 행위를 하여 회원에게 손해가 발생한 경우 회원은 회사에 대하여 손해배상 청구를 할 수 있습니다.
                    회원이 고의 또는 과실로 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회원은 회사에 발생한 모든 손해를 배상해야 합니다.
                    
                    제17조(면책)
                    
                    회사는 다음 각 호의 사유로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대한 책임을 부담하지 않습니다.
                    천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우
                    제3자의 고의적인 서비스 방해가 있는 경우
                    회원의 귀책사유로 서비스 이용에 장애가 있는 경우
                    기타 회사의 고의 또는 과실이 없는 사유에 해당하는 경우
                    회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도 및 정확성 등에 대한 보증을 하지 않으며 이로 인하여 회원에게 발생한 손해에 대하여 책임을 부담하지 않습니다.
                    회사는 회원이 서비스를 이용하며 기대하는 수익을 상실한 것에 대한 책임과, 그 밖의 서비스를 통하여 얻은 자료로 인하여 회원에게 발생한 손해에 대한 책임을 부담하지 않습니다.
                    
                    제18조(분쟁의 조정)
                    
                    회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 '위치정보의 보호 및 이용 등에 관한 법률' 제28조의 규정에 따라 방송통신위원회에 재정을 신청할 수 있습니다.
                    회사 또는 고객은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 '개인정보보호법' 제43조의 규정에 따라 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.
                    
                    제19조(회사의 연락처)
                    
                    회사의 상호 및 주소 등은 다음과 같습니다.
                    
                    법인명 : 카자잇
                    대표이사 : 강석호
                    소재지 :
                    연락처 :
                    
                    부 칙
                    
                    제1조(시행일)
                        
                    본 약관은 2023.08.31부터 시행합니다.
                    
                    제2조(위치정보관리책임자)
                    
                    위치정보관리책임자는 2023.08.31를 기준으로 다음과 같이 지정합니다.
                    
                    소속 : 카자잇
                    성명 : 강석호
                    직위 : 총괄팀장
                    전화 : 02-1234-1234
                    """
                    
        personalInfoTextView.text = termsText
    }
}


