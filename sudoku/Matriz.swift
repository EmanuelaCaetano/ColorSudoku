import Foundation

// Verifica se um número pode ser colocado em um bloco 3x3
func verificaBloco(_ grid: [[Int]], _ inicioLin: Int, _ inicioCol: Int, _ numero: Int) -> Bool {
    for i in 0...2 {
        for j in 0...2 {
            if grid[inicioLin + i][inicioCol + j] == numero {
                return false
            }
        }
    }
    return true
}

// Preenche um bloco 3x3 com números aleatórios sem repetir
func preencherBloco(_ grid: inout [[Int]], _ linha: Int, _ coluna: Int) {
    var numero: Int
    for i in 0...2{
        for j in 0...2 {
            repeat {
                numero = Int.random(in: 1...9)
            } while !verificaBloco(grid, linha, coluna, numero)
            grid[linha + i][coluna + j] = numero
        }
    }
}

// Verifica se um número pode ser colocado na linha
func verificaLinha(_ grid: [[Int]], _ linha: Int, _ numero: Int) -> Bool{
    for j in 0...8{
        if grid[linha][j] == numero {
            return false
        }
    }
    return true
}

// Verifica se um número pode ser colocado na coluna
func verificaColuna(_ grid: [[Int]], _ coluna: Int, _ numero: Int) -> Bool {
    for i in 0...8{
        if grid[i][coluna] == numero{
            return false
        }
    }
    return true
}

// Verifica se um número pode ser colocado em uma posição específica
func verificaPosicao( _ grid: [[Int]], _ linha: Int, _ coluna: Int, _ numero: Int) -> Bool{
    return verificaColuna(grid, coluna, numero) && verificaLinha(grid, linha, numero) && verificaBloco(grid, linha - (linha % 3), coluna - (coluna % 3), numero)
}

// Preenche a diagonal principal da matriz com blocos 3x3
func preencheDiagonal( _ grid: inout [[Int]]){
    for i in stride(from: 0, through: 6, by: 3) {
        preencherBloco(&grid, i, i)
    }
}

// Preenche os blocos restantes do tabuleiro recursivamente
func preencherBlocosRestantes(_ grid: inout [[Int]], _ linha: Int, _ coluna: Int) -> Bool {
    if (linha == 9){
        return true
    }
    if coluna == 9{
        return preencherBlocosRestantes(&grid, linha + 1, 0)
    }
    if grid[linha][coluna] != 0 {
        return preencherBlocosRestantes(&grid, linha, coluna + 1)
    }
    for numero in 1...9{
        if verificaPosicao(grid, linha, coluna, numero){
            grid[linha][coluna] = numero
            if preencherBlocosRestantes(&grid, linha, coluna + 1){
                return true
            }
            grid[linha][coluna] = 0
        }
    }
    return false
}

// Gera e exibe um tabuleiro de Sudoku completo
func matrizGabarito() -> [[Int]] {
    var grid = [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9)
    preencheDiagonal(&grid)
    preencherBlocosRestantes(&grid, 0,0)
    return grid
}

