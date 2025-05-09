import Foundation

func matrizGame (_ matrizGerada: [[Int]], _ valor : Int) -> [[Int]] {
    var QuantidadeNumerosVisiveis : Int = valor
    let dicionarioCores = 0
    var gridVazio = [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9)
    for i in 0...8{
        for j in 0...8{
            gridVazio[i][j] = 0
        }
    }
    
    for _ in 0...QuantidadeNumerosVisiveis{
        var sorteio1 : Int = Int.random(in: 0..<9)
        var sorteio2 : Int = Int.random(in: 0..<9)
        gridVazio[sorteio1][sorteio2] = matrizGerada[sorteio1][sorteio2]
    }
    return gridVazio
}

func validarEscolhaUsuario(_ matrizGabarito : [[Int]],_ matrizUsuario : inout [[Int]],_ linha : Int,_ coluna : Int,_ numUsuario : Int) -> Bool{
    if numUsuario == matrizGabarito[linha][coluna]{
        matrizUsuario[linha][coluna] = numUsuario
        return true
    }
    else{
        vidas = vidas - 1
        return false
    }
}

func printMatrizColorida(_ matrizUsuario : [[Int]]){
    var matrizColoridaUsuario = [[String]](repeating: [String](repeating: "0", count: 9), count: 9)
    
    let dicionarioCores = [0: "◾️",
                           1: "🟥",
                           2: "🟧",
                           3: "🟨",
                           4: "🟩",
                           5: "🟦",
                           6: "🟪",
                           7: "⬛️",
                           8: "⬜️",
                           9: "🟫"]
    
    for i in 0...8{
        for j in 0...8{
            for (number, color) in dicionarioCores {
                if matrizUsuario[i][j] == number {
                    matrizColoridaUsuario[i][j] = color
                }
            }
        }
    }
    
    print("------------------------------------")
    for i in 0..<matrizColoridaUsuario.count{
        print("|\(matrizColoridaUsuario[i][0])  \(matrizColoridaUsuario[i][1])  \(matrizColoridaUsuario[i][2]) |\(matrizColoridaUsuario[i][3])  \(matrizColoridaUsuario[i][4])  \(matrizColoridaUsuario[i][5]) |\(matrizColoridaUsuario[i][6])  \(matrizColoridaUsuario[i][7])  \(matrizColoridaUsuario[i][8])|")
        
        if i == 2 || i == 5 || i == 8 {
            print("------------------------------------")
        }
    }
    print("\n1 - 🟥RED | 2 - 🟧ORANGE | 3 - 🟨YELLOW\n\n4 - 🟩GREEN | 5 - 🟦BLUE | 6 - 🟪PURPLE\n\n7 - ⬛️BLACK | 8 - ⬜️WHITE | 9 - 🟫BROWN\n\nAperte P para abandonar o jogo ou caso tenha finalizado.")
}
