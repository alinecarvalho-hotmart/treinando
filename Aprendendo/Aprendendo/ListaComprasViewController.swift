
import UIKit


class ItemCell: UITableViewCell{
    
    @IBOutlet weak var labelProduto: UILabel!
    @IBOutlet weak var labelQuantidade: UILabel!
    
}

class ListaComprasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var itemTextField: UITextField?
    @IBOutlet weak var quantidadeTextField: UITextField?
    @IBOutlet weak var listaComprasTableView: UITableView?
    
    
    @IBAction func adicionarButton(_ sender: Any) {
        
        guard let itens = pegarDados() else { return }
        adicionarItem(item: itens)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaComprasTableView?.delegate = self
        listaComprasTableView?.dataSource = self
    }
    
    func pegarDados() -> Item? {
        guard let produto = itemTextField?.text else { return nil }
        guard let quantidadeForm = quantidadeTextField?.text, let quantidade = Int(quantidadeForm) else { return nil }
        
        let item = Item(nome: produto, quantidade: quantidade)
        
        itemTextField?.clearsOnBeginEditing =  true
        quantidadeTextField?.clearsOnBeginEditing = true
        
        
        return item
        
    }
    
    func adicionarItem(item: Item) {
        lista.append(item)
        listaComprasTableView?.reloadData()
    }
    
    var lista = [Item]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemCell
        let item = lista[indexPath.row]
        
        cell.labelProduto.text = item.nome
        cell.labelQuantidade.text = String(item.quantidade)
        cell.accessoryType = .none
        
        
        let deleteItem = UILongPressGestureRecognizer(target: self, action:#selector(deleteItem(_:)) )
        cell.addGestureRecognizer(deleteItem)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let item = tableView.cellForRow(at: indexPath) else { return }

        if item.accessoryType == .none {
            item.accessoryType = .checkmark
        } else {
            item.accessoryType = .none
        }
    }

    
    @objc func deleteItem(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended{
            let celula = sender.view as! UITableViewCell
            guard let indexPath = listaComprasTableView?.indexPath(for: celula) else { return }
            let item = lista[indexPath.row]
            if let position = lista.firstIndex(of: item) {
                lista.remove(at: position)
            }
            listaComprasTableView?.reloadData()
        }
    }

}
