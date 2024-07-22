import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var weatherImageView: UIImageView!
    
    private let weatherImages = ["Clear", "Cloudy", "Fog", "Light snowfall", "Mostly cloudy", "Partly cloudy", "Rain", "Thunder"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        displayRandomWeather()
    }
    
    private func displayRandomWeather(){
        let randomIndex = Int.random(in: 0..<weatherImages.count)
        updateWeather(randomIndex)
    }
    
    private func updateWeather(_ index: Int){
        let weatherImage = weatherImages[index]
        weatherImageView.image = UIImage(named: weatherImage)
        animationFade()
    }
    
    private func animationFade(){
        let animation = CATransition()
        animation.duration = 0.5
        animation.type = .fade
        weatherImageView.layer.add(animation, forKey: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        guard let weatherCell = cell as? WeatherCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        weatherCell.weatherImage.image = UIImage(named: weatherImages[indexPath.row])
        weatherCell.weatherType.text = weatherImages[indexPath.row].localized()
        
        return weatherCell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateWeather(indexPath.row)
    }
}
