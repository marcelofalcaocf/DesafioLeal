//
//  ExericiosViewController.swift
//  DesafioLeal
//
//  Created by Marcelo Falcao Costa Filho on 24/05/22.
//

import UIKit

final class ExerciciosViewController: UIViewController {
    @IBOutlet weak var exercicosCollectionView: UICollectionView!
    
    var treinoSelectionado: TreinoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exercicosCollectionView.dataSource = self
    }
}

extension ExerciciosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return treinoSelectionado!.exercicios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ExerciciosCollectionViewCell {
            cell.construirCell(modelo: treinoSelectionado!.exercicios[indexPath.item])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
