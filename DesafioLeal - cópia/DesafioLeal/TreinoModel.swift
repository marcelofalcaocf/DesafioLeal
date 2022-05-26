//
//  TreinoModel.swift
//  DesafioLeal
//
//  Created by Marcelo Falcao Costa Filho on 24/05/22.
//

import Foundation

struct TreinoModel {
    let nome: String
    let data: Date
    let imagemURL: URL?
    let descricao: String
    let exercicios: [ExercicioModel]
}
