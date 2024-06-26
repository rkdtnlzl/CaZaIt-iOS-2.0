//
//  MainTableViewCell.swift
//  CaZait-iOS
//
//  Created by 강민수 on 2023/04/05.
//

import UIKit
import SnapKit

class MainTableViewLovedCell: UITableViewCell {

    //이동하려는 viewController가 navigationController 내에서 push될 수 있도록 navigationController를 추가
    weak var navigationController: UINavigationController?
    private var favoritesCafeData: FavoritesResponse? //mainView에서 날라온 정보를 저장.
    
    private let lovedCafeLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "AppleSDGothicNeoM00-Bold", size: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold) //위에 글씨체가 어색해서 임시로 추가
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.text = "찜한매장"
        label.numberOfLines = 1
        
        return label
    }()
    
    private let lovedCafeExpLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "AppleSDGothicNeoM00-Regular", size: 14)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular) //위에 글씨체가 어색해서 임시로 추가
        label.textColor = UIColor(red: 1, green: 0.45, blue: 0.356, alpha: 1)
        label.textAlignment = .center
        label.text = "찜한 매장을 빠르게 확인!"
        label.numberOfLines = 1
        
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //스크롤 방향 수평으로 설정
        layout.sectionInset = UIEdgeInsets(top: 10, left: 21, bottom: 10, right: 21) //collectionView와 collectionViewCell사이의 여백
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false //수평 스크롤 인디게이터를 보이지 않게 함
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let dottedLineView: UIView = {
        //layer는 오토레이아웃 지정이 되지 않기때문에 view를 생성하고 그 안에 layer를 넣어서 하기 위함/
        let view = UIView()
        view.backgroundColor = .clear
        
        let shapeLayer = CAShapeLayer()
        
        // 점선 색상
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        // 점선 두께
        shapeLayer.lineWidth = 1.5
        
        // 점선 패턴: 2포인트의 선, 2포인트의 공백으로 반복
        shapeLayer.lineDashPattern = [8, 8]
        
        // 점선의 경로
        view.layer.addSublayer(shapeLayer)
        
        // contentView의 bounds를 기준으로 frame 설정하여 나중에 수정하기 위해 추가
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1)

        
        view.layer.addSublayer(shapeLayer)
        
        
        return view
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // collectionView에 사용될 셀 등록
        collectionView.register(LovedCollectionViewCell.self, forCellWithReuseIdentifier: "LovedCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.backgroundColor = .white
        
        setupMainTableViewLovedCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MainView에서 날라온 정보를 저장한 뒤, 다시 콜렉션뷰를 리로드합니다.
    func configure(with data: FavoritesResponse?) {
        self.favoritesCafeData = data
        self.collectionView.reloadData()
    }

    func setupMainTableViewLovedCell() {
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
            make.top.equalTo(contentView.snp.top).offset(62)
            make.height.equalTo(200) // collectionView 높이 설정
        }
        
        contentView.addSubview(lovedCafeLabel)
        
        lovedCafeLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(21)
            make.leading.equalTo(contentView.snp.leading).offset(22.5)
        }
        
        contentView.addSubview(lovedCafeExpLabel)
        
        lovedCafeExpLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lovedCafeLabel.snp.centerY)
            make.leading.equalTo(lovedCafeLabel.snp.trailing).offset(10)
        }
        
        
        
        contentView.addSubview(dottedLineView)
        
        dottedLineView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading).offset(21)
            make.trailing.equalTo(contentView.snp.trailing).offset(-21)
            make.height.equalTo(1.5)
        }
        
        // contentView에 dottedLineView 추가 후, layout이 완료되었을 때 shapeLayer의 path 설정
        
        // dottedLineView의 layer의 첫 번째 sublayer를 CAShapeLayer로 가져옵니다.
        let shapeLayer = dottedLineView.layer.sublayers?.first as? CAShapeLayer
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0.75)) // path의 시작점을 해당좌표로 이동합니다.
        
        // 현재 위치에서 (dottedLineView.bounds.width - 42, 0.75) 좌표까지 직선을 추가합니다.
        path.addLine(to: CGPoint(x: dottedLineView.bounds.width - 42, y: 0.75))
        
        // shapeLayer의 path를 UIBezierPath의 CGPath 표현으로 설정합니다.
        shapeLayer?.path = path.cgPath
    }
}

extension MainTableViewLovedCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // collectionView 셀 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = self.favoritesCafeData {
            return data.data.count
        } else {
            return 0
        }
    }
    
    // collectionView 셀 생성 및 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LovedCollectionViewCell", for: indexPath) as! LovedCollectionViewCell
        //통신에서 날라온 정보를 이용해서 콜렉션 뷰 셀에 데이터를 전달합니다.
        if let cafeInfo = self.favoritesCafeData?.data[indexPath.row]{
            cell.configure(with: cafeInfo)
        }
        return cell
    }
    
    // collectionView 셀 크기 반환
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 131, height: 174)
    }
    
    // collectionView 셀과 셀 사이 간격 반환
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
    // collectionView 셀이 선택됐을 때 처리할 작업 구현
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.item) selected")
        
        // CafeDetailView 호출
        let cafeDetailView = CafeDetailView() // CafeDetailView 초기화
        let recentCafeView = RecentCafeView()
        
        //cafeDetailView에서 받은 cafeId를 통해 통신할 수 있도록 값을 전달한다.
        cafeDetailView.cafeId = self.favoritesCafeData?.data[indexPath.row].cafeId
        cafeDetailView.cafeName = self.favoritesCafeData?.data[indexPath.row].name
        
        //cafeDetailView에서 받은 recentCafeModel를 통해 통신할 수 있도록 값을 전달한다.
        let recentCafe = RecentModel(
            cafeImage: self.favoritesCafeData?.data[indexPath.row].imageUrl[0] ?? "",
            cafeName: self.favoritesCafeData?.data[indexPath.row].name ?? "",
            cafeLocation: self.favoritesCafeData?.data[indexPath.row].address ?? "",
            cafeId: self.favoritesCafeData?.data[indexPath.row].cafeId ?? ""
        )
        recentCafeView.addRecentCafe(cafe: recentCafe)
        
        navigationController?.pushViewController(cafeDetailView, animated: true)
    }
    
}

