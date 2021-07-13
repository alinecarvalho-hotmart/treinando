

import UIKit

class ListaTableViewController: UITableViewController {
    
    // MARK: - Table view data source
    
    var itens = [Item(nome: "IMC"),
                 Item(nome: "Lista de compras")]
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Itens de teste"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let itemOfItens = itens[indexPath.row]
        
        itemCell.textLabel?.text = itemOfItens.nome
        
        return itemCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = itens[indexPath.row]
        let cell = selectedCell.nome

        switch cell {
        case "IMC":
            performSegue(withIdentifier: "imc", sender: nil)
        case "Lista de compras":
            performSegue(withIdentifier: "lista", sender: nil)
        default:
            print("unexpected segue identifier")
        }

    }
}
