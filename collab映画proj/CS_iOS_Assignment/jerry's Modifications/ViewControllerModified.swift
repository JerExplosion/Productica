//
//  ViewControllerModified.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/13/20.
//  Copyright © 2020 Backbase. All rights reserved.
//
       
import MBProgressHUD
import UIKit

class ViewControllerModified: UIViewController,UITableViewDataSource, UIScrollViewDelegate {
  
    let movieService = MovieService.init()
    let popularVM = PopularVM.init() 
  
  @IBOutlet weak var moviesTableView: UITableView!
  @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var horizontalImageScroller: UIScrollView!
     
   var imgScrollerframe = CGRect(x: 0, y: 0, width: 0, height: 0)
   var imgArrayForScroller = [UIImage]()
           
  override func viewDidLoad() {
    super.viewDidLoad()
    let title = UILabel()
    title.text = "MOVIEBOX"
    title.font = .boldSystemFont(ofSize: 21)
    title.textColor = .white 
    navigationItem.titleView = title
       
    horizontalImageScrollerSetup()
    
    // MARK: - additions & modifications
    
    collectionViewSetup()
//    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
 //   self.navigationController?.navigationBar.shadowImage = UIImage()
    
  //  title.font = UIFont(name: "Georgia", size: 21)
    self.navigationController?.navigationBar.barTintColor = .black
    //  xibCollectRegistrationSetup()
    self.moviesCollectionView.register(NewVersionOfMovieCollectionViewCell.nibbing(), forCellWithReuseIdentifier: GloballyApplied.newMovieCollectionViewCellNibID)

    movieService.fetchMovies {
      self.moviesCollectionView.reloadData()
    }
    
    getData()
  }
  
  func getData() {
    popularVM.fetchPopularMovies() {
      MBProgressHUD.hide(for: self.view, animated: true)
      self.moviesTableView.reloadData()
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return popularVM.getNumberOfMovies()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:MovieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                       for: indexPath) as! MovieCell
    cell.configure(movie: popularVM.getMovie(at: indexPath.row))
    return cell
  }
}

extension ViewControllerModified: UITableViewDelegate {
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if ((moviesTableView.contentOffset.y + moviesTableView.frame.size.height) >= moviesTableView.contentSize.height) {
      self.perform(#selector(loadTable), with: nil, afterDelay: 1.0)
    }
  }
    
    // MARK: -
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idNum = popularVM.getMovie(at: indexPath.row).id
        let sBoard = UIStoryboard.init(name: GloballyApplied.mainSB, bundle: nil)
        guard let desintation = sBoard.instantiateViewController(withIdentifier: GloballyApplied.newDetailsViewControllerStoryboardID) as? NewDetailsViewController else { return }
        // id = id
        desintation.modalPresentationStyle = .overCurrentContext
        desintation.idNumb = idNum
        self.present(desintation, animated: true, completion: nil)
    }
    
  
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let id = popularVM.getMovie(at: indexPath.row).id
//    let sb = UIStoryboard(name: "Main", bundle: nil)
//    let dVC = sb.instantiateViewController(identifier: "DetailViewController") as DetailViewController
//    dVC.id = id
//    dVC.modalPresentationStyle = .overCurrentContext
//    present(dVC, animated: true, completion: nil)
//  }
  
  @objc func loadTable() {
    if popularVM.getNumberOfMovies() < popularVM.getTotalResult() {
      MBProgressHUD.showAdded(to: self.view, animated: true)
      getData()
    }
  }
}

extension ViewControllerModified: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movieService.getNumberOfMovies()
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
    let movie = movieService.getMovie(at: indexPath.row)
    cell.configure(movie: movie)
    return cell
  }
  
}

extension ViewControllerModified: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width/4 , height: collectionView.frame.height)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
}

extension ViewControllerModified: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let id = movieService.getMovie(at: indexPath.row).id
    let sb = UIStoryboard(name: "Main", bundle: nil)
    let dVC = sb.instantiateViewController(identifier: "DetailViewController") as DetailViewController
    dVC.id = id
    dVC.modalPresentationStyle = .overCurrentContext
    present(dVC, animated: true, completion: nil)
  }
}
