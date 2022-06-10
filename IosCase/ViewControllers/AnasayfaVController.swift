
import AlamofireImage
import ImageSlideshow
import Network
import UIKit

class AnasayfaVController: BaseVController {
    @IBOutlet var scrollViewAnasayfa: UIScrollView!
    @IBOutlet var blogSlide: ImageSlideshow!
    @IBOutlet var ustSlide: ImageSlideshow!
    @IBOutlet var markalarCV: UICollectionView!
    @IBOutlet var kategoriCV: UICollectionView!
    @IBOutlet var cokSatanlarCV: UICollectionView!
    @IBOutlet weak var lblCokSatanlar: UILabel!
    @IBOutlet weak var btnTumu: UIButton!
    @IBOutlet weak var lblBlog: UILabel!
    
    
    private let spacing: CGFloat = 5.0
    var kategoriler: [Kategori] = []
    var cokSatanlar: [CokSatan] = []
    var markalar: [Markalar] = []
    var animationContainerView: UIView!

    lazy var anasayfaVModel: AnasayfaVModel = {
        let vm = AnasayfaVModel(view: self.view)
        vm.delegate = self
        return vm
    }()

    override func viewDidLoad() {
                
        
        
        
        config()
//        Navigation bar sola resim ekleme
        let logo = UIBarButtonItem(image: UIImage(named: "LOGO")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        logo.isEnabled = false
        navigationItem.leftBarButtonItem = logo
        
    }

    override func viewDidAppear(_ animated: Bool) {
        startTimer()
    }

    func config() {
        scrollViewAnasayfa.delegate = self
        kategoriCV.delegate = self
        kategoriCV.dataSource = self
        markalarCV.delegate = self
        markalarCV.dataSource = self
        cokSatanlarCV.dataSource = self
        cokSatanlarCV.dataSource = self
        btnTumu.titleLabel?.font = UIFont(name: "Quicksand-SemiBold",size: 14)

//        // Collection view cell equaled size config
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
//        layout.minimumLineSpacing = spacing
//        layout.minimumInteritemSpacing = spacing
//        kategoriCV?.collectionViewLayout = layout

        anasayfaVModel.getCategories(url: "https://mocki.io/v1/87f0826f-cef4-4fd3-9968-1358a68ca2da")
        anasayfaVModel.getCokSatan(url: "https://mocki.io/v1/87f0826f-cef4-4fd3-9968-1358a68ca2da")
        anasayfaVModel.getSliderPics(url: "https://mocki.io/v1/51c577a0-b7fa-45db-aeb0-0d3e58c01c64")
        anasayfaVModel.getMarkalar(url: "https://mocki.io/v1/f017b1c1-dbda-40f6-a032-ee2e0a3a0dee")
        
    }



    @objc func scrollToNextCell() {
     
        let cellSize = CGSize(width: view.frame.size.width, height: markalarCV.frame.size.height)

        
        let contentOffset = markalarCV.contentOffset

        if markalarCV.contentSize.width <= markalarCV.contentOffset.x + cellSize.width {
            markalarCV.scrollRectToVisible(CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)

        } else {
            markalarCV.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
        }
    }

    
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true)
    }

    func addPics(_ data: [String], on view: ImageSlideshow) {
        var alamofireSource: [AlamofireSource] = []
        for pic in data {
            alamofireSource.append(AlamofireSource(urlString: pic)!)
        }
        
        view.setImageInputs(alamofireSource)
        view.contentScaleMode = UIView.ContentMode.scaleToFill
        view.slideshowTransitioningDelegate
    }
}

extension AnasayfaVController: AnasayfaVModelDelegate {
    func getCategoryCompleted(data: [Kategori]) {
        kategoriler = data
        kategoriCV.reloadData()
    }

    func getCoksatanCompleted(data: [CokSatan]) {
        cokSatanlar = data
        cokSatanlarCV.reloadData()
    }

    func getMarkalarCompleted(data: [Markalar]) {
        markalar = data
        markalarCV.reloadData()
    }

    func getSliderCompleted(data: [Slider]) {
        if data.count > 0 {
            let veri = data.map({ $0.picture }) as! [String]
            addPics(veri, on: ustSlide)
            addPics(veri, on: blogSlide)
        }
    }
}

extension AnasayfaVController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 && scrollView == scrollViewAnasayfa {
            scrollView.contentOffset.x = 0
        }
    }
}

extension AnasayfaVController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == markalarCV {
            return markalar.count
        } else if collectionView == kategoriCV {
            return kategoriler.count
        } else {
            return cokSatanlar.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellCV: UICollectionViewCell

        if collectionView == markalarCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarkaCVCell", for: indexPath) as! MarkaCVCell
            var tmp: [String] = []
            tmp.append(markalar[indexPath.row].picture!)
            addPics(tmp, on: cell.markaResim)
            cellCV = cell
        } else if collectionView == kategoriCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KategoriCvCell", for: indexPath) as! KategoriCVCell
            var tmp: [String] = []
            tmp.append(kategoriler[indexPath.row].picture!)
            addPics(tmp, on: cell.kategoriResim)
            cell.title?.text = kategoriler[indexPath.row].title
            cellCV = cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CokSatanlarCVCell", for: indexPath) as! CokSatanlarCVCell
            var tmp: [String] = []
            tmp.append(cokSatanlar[indexPath.row].picture!)
            addPics(tmp, on: cell.urunResim)
            cell.title?.text = kategoriler[indexPath.row].title

            cellCV = cell
        }

        return cellCV
    }
}

// Collection view cell equaled size delegate method

// extension AnasayfaVController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numberOfItemsPerRow: CGFloat = 5
//        let spacingBetweenCells: CGFloat = 15
//
//        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) // Amount of total spacing in a row
//
//        if let collection = kategoriCV {
//            let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
//            return CGSize(width: width, height: collectionView.bounds.height)
//        } else {
//            return CGSize(width: 0, height: 0)
//        }
//    }
// }
