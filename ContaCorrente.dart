abstract class ContaCorrente{
  String _nomeCliente;
  double _saldo;

  ContaCorrente(this._nomeCliente, this._saldo);  //Construtor

  String status(){
    return "Cliente: $_nomeCliente. Saldo: $_saldo";
  }

  bool analisaTransf(valor){
    return _saldo >= valor;
  }
}

class ContaComum extends ContaCorrente{
  ContaComum(nc, s): super(nc, s);  //Construtor
}

class ContaEspecial extends ContaCorrente{
  double _taxajuros;  

  ContaEspecial(this._taxajuros, nc, s): super(nc, s);  //Construtor

  aplicaCorrecao(){
    _saldo = _saldo * (1 + _taxajuros);
  }
}

class Banco{
  List<ContaCorrente> _contas = []; 

  Banco(contas){   //recebe uma lista de contas e adiciona no Banco._contas 
    _contas = contas;
  }

  String Transferencia(c_origem, c_destino, valor){
    if(c_origem.analisaTransf(valor)){
      c_origem._saldo -= valor;
      c_destino._saldo += valor; 
      return "Transferencia realizada com sucesso!";
    }
    else{return "Saldo insuficiente!";}
  }
}

main(){
  ContaComum c1 = ContaComum("Gabriel", 100.0);
  print(c1.status());

  ContaEspecial c2 = ContaEspecial(0.5, "Emmily", 200.0);
  c2.aplicaCorrecao();
  print(c2.status());

  Banco b1 = Banco([c1, c2]);
  print(b1._contas);
  print(b1.Transferencia(c1, c2, 101));
  print(b1.Transferencia(c2, c1, 50));
  print(c1.status());
  print(c2.status());
}