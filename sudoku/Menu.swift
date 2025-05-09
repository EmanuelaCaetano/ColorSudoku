import Foundation

//menu colorido
var xTerm : Int = 33
var yTerm : Int = 12
var texCor:Int = 30
func printPersonalizado(_ xTerm : Int ,_ yTerm :  Int ,_ input : String) {
    fputs("\u{1B}[\(yTerm);\(xTerm);f\(input)", stdout) //"add"
    fflush(__stdoutp) //"commit"do fpush
}
func movCursorSemEnter(_ posColuna : Int ,_ posLinha : Int){
    fputs("\u{1B}[\(posColuna);\(posLinha)f", stdout)
    fflush(__stdoutp)}

func printMenu(){
    let textaoLista: [String] = [
        "                                         " ,
        " ██████╗ ██████╗ ██╗      ██████╗ ██████╗",
        "██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗",
        "██║     ██║   ██║██║     ██║   ██║██████╔╝",
        "██║     ██║   ██║██║     ██║   ██║██╔══██╗",
        "╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║",
        " ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝",
        "",
        "███████╗██╗   ██╗██████╗  ██████╗ ██╗  ██╗██╗   ██╗",
        "██╔════╝██║   ██║██╔══██╗██╔═══██╗██║ ██╔╝██║   ██║",
        "███████╗██║   ██║██║  ██║██║   ██║█████╔╝ ██║   ██║",
        "╚════██║██║   ██║██║  ██║██║   ██║██╔═██╗ ██║   ██║",
        "███████║╚██████╔╝██████╔╝╚██████╔╝██║  ██╗╚██████╔╝",
        "╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝"
    ]
    
    print("\u{1B}[2J\u{1B}[H")//Limpar terminal
    for i in 0..<14{
        movCursorSemEnter(i, 19)
        print("\u{001B}[\(texCor)m" + textaoLista[i] + "\u{001B}[0m")
        texCor += 1
        if texCor == 36{
            texCor = 31
        }
        
    } //imprime Textao(sim precisa ser assim,assim ↓ nao funciona)
    //printPersonalizado(50 , 0 , textao)
    
    print("\u{001B}[1;90;107m")
    printPersonalizado(xTerm, yTerm + 5, "[1] - Dificil")
    printPersonalizado(xTerm , yTerm + 6 , "[2] -  Medio ")
    printPersonalizado(xTerm, yTerm + 7, "[3] -  Facil ")
    print("\u{001B}[2;37;49m")
    printPersonalizado(xTerm, yTerm + 9, "[4] -  Ajuda ")
    printPersonalizado(xTerm, yTerm + 10, "[5] -   Sair ")
    printPersonalizado(xTerm, yTerm + 13, " ")
    print("\u{001B}[0m")
}
func inputMenu(_ input : String? ) -> String{
    if let inputVal = input {
        switch inputVal{
        case "1":
            return "D"
        case "2":
            return "M"
        case "3":
            return "F"
        case "4":
            return "A"
        case "5":
            return "S"
        default:
            return "?"
        }
    }
    else{
        return "?"
    }
}
