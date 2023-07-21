//
//  ViewController.swift
//  ImageScroll
//
//  Created by Vyacheslav Pronin on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var yeaImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(origin: .zero,
                                                  size: .init(width: view.frame.width,
                                                              height: Constant.height)))
        imageView.image = UIImage(named: "yea")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemYellow

        return imageView
    }()
    
    private lazy var topImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: view.center.x - Constant.width/2,
                                                  y: yeaImageView.frame.maxY,
                                                  width: Constant.width,
                                                  height: Constant.height))
        imageView.image = UIImage(named: "top")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.frame)
        scrollView.contentSize.height = view.frame.height * 2
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset <= .zero {
            yeaImageView.frame.origin.y = offset
            yeaImageView.frame.size.height = Constant.height - offset
        }
        scrollView.verticalScrollIndicatorInsets.top = Constant.height - offset - view.safeAreaInsets.top
    }
}

private extension ViewController {
    enum Constant {
        static let height: CGFloat = 270
        static let width: CGFloat = 200
    }
    
    func setup() {
        scrollView.delegate = self
        view.backgroundColor = .systemGreen
        
        view.addSubview(scrollView)
        [yeaImageView, topImageView].forEach {
            scrollView.addSubview($0)
        }
    }
}
