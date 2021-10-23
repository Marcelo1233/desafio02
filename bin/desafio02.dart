import 'dart:io';
import 'alimento.dart';
import 'alimento_dao.dart';
import 'alimento_industrializado.dart';
import 'alimento_natural.dart';

// Função inicial
int showMainMenu() {
  print("____________MENU INICIAL______________");
  print("1 - Digite 1 para adicionar alimento");
  print("2 - Digite 2 para ver lista com os alimentos cadastrados");
  print("3 - Digite 3 para ver um alimento");
  print("4 - Digite 4 para atualizar o alimento");
  print("5 - Digite 5 para Apagar o alimento");
  print("0 - Digite 0 para Finalizar o programa");
  int option = int.parse(stdin.readLineSync());
  return option;
}

int showCreateMenu() {
  print("____________MENU DE CRIAÇÃO___________");
  print("1 - Digite 1 para cadastrar um alimento industrializado");
  print("2 - Digite 2 para cadastrar um alimento natural");
  print("0 - Digite 0 para voltar");
  int option = int.parse(stdin.readLineSync());
  return option;
}

Alimento inputAlimento() {
  int option = showCreateMenu();

  print("Qual é o codigo do alimento? :");
  String codigo = stdin.readLineSync();

  print("Qual é o nome do alimento? :");
  String nome = stdin.readLineSync();

  print(" Como é o nome científico desse alimento? :");
  String cientifico = stdin.readLineSync();

  print("Como é o nome em inglês desse alimento? :");
  String ingles = stdin.readLineSync();

  print("Qual é o grupo desse alimento");
  String grupo = stdin.readLineSync();

  switch (option) {
    case 1:
      print("Qual é a marca do fabricante? :");
      String fabricante = stdin.readLineSync();

      return Industrializado(
        codigo,
        nome.split(','),
        ingles.split(','),
        cientifico,
        grupo,
        fabricante,
      );
    case 2:
      print("Qual é a validade no formado yyyy-MM-dd (2021-09-01)");
      String validade = stdin.readLineSync();
      DateTime datetime = DateTime.parse(validade);

      return Natural(codigo, nome.split(','), ingles.split(','), cientifico,
          grupo, datetime);

    default:
      return null;
  }
}

// Função principal do codigo
void main(List<String> args) {
  final daoAlimento = AlimentoDAO();

  int option = -1;

  do {
    option = showMainMenu();

    switch (option) {
      case 1:
        final alimento = inputAlimento();
        daoAlimento.create(alimento);
        break;
      case 2:
        final alimentos = daoAlimento.listAll();
        break;
      case 3:
        print("Digite o codigo do alimento a ser codigoAlimento");
        String codigoAlimento = stdin.readLineSync();
        daoAlimento.getByCod(codigoAlimento);
        break;
      case 4:
        print("Qual é o codigo do alimento que vai ser atualizado? :");
        String codigoAtualizar = stdin.readLineSync();
        daoAlimento.update(codigoAtualizar);
        break;
      case 5:
        print("Qual é o codigo do alimento que vai ser excluido? :");
        String codigoExcluir = stdin.readLineSync();
        daoAlimento.delete(codigoExcluir);
        break;
      case 0:
        break;
      default:
        print('Comando invalido');
    }
  } while (option != 0);
}