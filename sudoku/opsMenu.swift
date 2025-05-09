import Foundation

func Ajuda(){
    limparTerminal()
    print("\u{001B}[1;90;107m")
    printPersonalizado(20, 3, "Como eu escolho qual cor eu gostaria de utilizar?")
    print("\u{001B}[1;37;49m")
    printPersonalizado(20, 4, "Digite o codigo numerico anterior a cor desejada(1 a 9):" )
    printPersonalizado(21, 6, "'[1] - Green' = \u{001B}[32m1 ✅\u{001B}[0m" )
    printPersonalizado(50, 6, "'Green\u{001B}[31m or \u{001B}[0m'0' ❌" )
    
    print("\u{001B}[0m")
    
    print("\u{001B}[1;90;107m")
    printPersonalizado(20, 9, "Como eu escolho a posiçao na qual eu gostaria de alterar?")
    print("\u{001B}[1;37;49m")
    printPersonalizado(20, 11, " Mova-se💨 até a posição desejada       Confirme✅ ")
    printPersonalizado(35, 12, "↓↓↓")
    printPersonalizado(61, 12, "↓↓↓")
    printPersonalizado(35, 13, "W(↑)")
    printPersonalizado(40, 14, "D(→)")
    printPersonalizado(30, 14, "(←)A")
    printPersonalizado(35, 14, "S(↓)")
    printPersonalizado(61,
                       13, "P(↲)")
    print("\u{001B}[0m")
    
    print("\u{001B}[1;90;107m")
    printPersonalizado(20, 16, "↓↓ Cores não podem se repetir em fileiras, colunas e quadrantes ↓↓")
    print("\u{001B}[0m")
    //Tabela Errada
    printPersonalizado(18, 18, "_________________________")
    printPersonalizado(18, 19, "|🟥  ◾️  ◾️ | ◾️  🟥  ◾️|←❌")
    printPersonalizado(18, 21 ,"|◾️  ◾️  🟥 |←❌  ◾️  ◾️|")
    printPersonalizado(18, 22 ,"-------------------------")
    printPersonalizado(18, 23 ,"|◾️  ◾️  ◾️ | ◾️  ◾️  ◾️|")
    printPersonalizado(18, 25 ,"|◾️  ◾️  ◾️ | ◾️  ◾️  ◾️|")
    printPersonalizado(18, 26 ,"-------------------------")
    printPersonalizado(18, 27 ,"|🟥  ◾️  ◾️ | ◾️  ◾️  ◾️|")
    printPersonalizado(20, 28 ,"↑")
    printPersonalizado(18, 29 ,"|❌  ◾️  ◾️ | ◾️  ◾️  ◾️|")
    printPersonalizado(18, 30 , "-------------------------")
    printPersonalizado(47, 24 ,"←❌ - ✅→")
    //Tabela Certa
    printPersonalizado(60, 18, "_________________________")
    printPersonalizado(60, 19, "|🟩  ◾️  🟦 |←✅  ◾️  ◾️|")
    printPersonalizado(60, 21 ,"|◾️  ◾️  ◾️ | ◾️  ◾️  ◾️|")
    printPersonalizado(60, 22 ,"-------------------------")
    printPersonalizado(60, 23 ,"|◾️  🟩  ◾️ | ◾️  ◾️  ◾️|")
    printPersonalizado(66, 24 ,"↑")
    printPersonalizado(60, 25 ,"|◾️  ✅  ◾️ | ◾️  ◾️  ◾️|")
    printPersonalizado(60, 26 ,"-------------------------")
    printPersonalizado(60, 27 ,"|◾️  ◾️  ◾️ | ◾️  🟩 ←✅|")
    printPersonalizado(60, 29 ,"|◾️  ◾️  ◾️ | ◾️  ◾️  ◾️|")
    printPersonalizado(60, 30 , "-------------------------")
    print("\u{001B}[1;90;107m")
    printPersonalizado(20, 34 , "Gostaria De Retornar Para O Menu?(S ; N) - ")
    let imput : String? = readLine()
    print("\u{001B}[0m")
    
    if let imputVal : String = imput{
        let imputUpper : String = imputVal.uppercased()
        switch imputUpper{
        case "S":
            break
        default:
            Ajuda()
        }
    }
}

func TelaVitoria(){
    let Vitoria : [String] = [
        " " ,
        "██████╗  █████╗ ██████╗  █████╗ ██████╗ ███████╗███╗   ██╗███████╗       ██████╗",
        "██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝    ██╗██╔══██╗",
        "██████╔╝███████║██████╔╝███████║██████╔╝█████╗  ██╔██╗ ██║███████╗    ╚═╝██║  ██║",
        "██╔═══╝ ██╔══██║██╔══██╗██╔══██║██╔══██╗██╔══╝  ██║╚██╗██║╚════██║    ██╗██║  ██║",
        "██║     ██║  ██║██║  ██║██║  ██║██████╔╝███████╗██║ ╚████║███████║    ╚═╝██████╔╝",
        "╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝       ╚═════╝",                                                                                                 ]
    
    print("\u{1B}[2J\u{1B}[H")//Limpar terminal
    for i in 0..<7{
        movCursorSemEnter(i+15, 12)
        print("\u{001B}[32m" + Vitoria[i] + "\u{001B}[0m")
    }
}
func TelaDerrota(){
    let Derrota : [String] = [
        " ",
        "██████╗ ███████╗██████╗ ██████╗  ██████╗ ████████╗ █████╗         ██╗",
        "██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗    ██╗██╔╝",
        "██║  ██║█████╗  ██████╔╝██████╔╝██║   ██║   ██║   ███████║    ╚═╝██║",
        "██║  ██║██╔══╝  ██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══██║    ██╗██║",
        "██████╔╝███████╗██║  ██║██║  ██║╚██████╔╝   ██║   ██║  ██║    ╚═╝╚██╗",
        "╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝        ╚═╝",
    ]
    print("\u{1B}[2J\u{1B}[H")//Limpar terminal
    texCor = 1
    for i in 0..<7{
        movCursorSemEnter(i+20, 12)
        print("\u{001B}[\(texCor);91m" + Derrota[i] + "\u{001B}[0m")
        texCor += 1
        if texCor == 4{
            texCor = 1
        }
    }
}

