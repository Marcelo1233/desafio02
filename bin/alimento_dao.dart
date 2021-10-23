import 'dart:io';

import 'alimento.dart';

class AlimentoDAO {
  // Cria alimento e retorna true caso tenha sucesso e false se falhar
  bool create(Alimento alimento) {
    try {
      final file = File('arquivo.csv');
      String contents;
      if (file.existsSync()) {
        final dadosSalvos = file.readAsStringSync();
        contents = dadosSalvos + '\n' + alimento.toCSV();
      } else {
        contents = alimento.toCSV();
      }
      file.writeAsStringSync(contents);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Retorna lista com todos os alimentos
  List<Alimento> listAll() {
    final alimentos = <Alimento>[];
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    for (var row in dadosSalvos) {
      final colunas = row.split(';');
      String codigo = colunas[0];
      String nome = colunas[1];
      String cientifico = colunas[2];
      String ingles = colunas[3];
      String grupo = colunas[04];

      print(
          "Codigo: $codigo | Nome: $nome | Nome Cientifico: $cientifico| Inglês: $ingles | Grupos:$grupo");
    }
  }

  // Retorna alimento com o respectivo código
  Alimento getByCod(String codigoAlimento) {
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    for (var item in dadosSalvos) {
      final columns = item.split(';');
      if (columns[0] == codigoAlimento) {
        print(
            "Codigo: ${columns[0]} | Nome: ${columns[1]} | Nome Cientifico: ${columns[2]}| Inglês: ${columns[3]} | Grupos:${columns[4]} ");
      }
    }

    return null;
  }

  // Atualiza alimento e retorna com novos valores
  Alimento update(String codigoAtualizar) {
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    String contents = "";
    for (var row in dadosSalvos) {
      final colunas = row.split(';');
      String codigo = colunas[0];
      String nome = colunas[1];
      String cientifico = colunas[2];
      String ingles = colunas[3];
      String grupo = colunas[4];
      if (codigo == codigoAtualizar) {
        print("Digite o codigo do alimento");
        String codigoA = stdin.readLineSync();

        print("Digite o nome");
        String nomeA = stdin.readLineSync();

        print("Digite o nome científico");
        String cientificoA = stdin.readLineSync();

        print("Digite o nome em inglês");
        String inglesA = stdin.readLineSync();

        print("Digite o grupo");
        String grupoA = stdin.readLineSync();

        contents += "$codigoA;$nomeA;$cientificoA;$inglesA;$grupoA; \n";
      } else {
        contents += "$codigo;$nome;$cientifico;$ingles;$grupo; \n";
      }
    }
    file.writeAsStringSync(contents);
  }

  // Deleta alimento e retorna true caso tenha sucesso e false se falhar
  delete(String codigoExcluir) {
    final file = File('arquivo.csv');
    final dadosSalvos = file.readAsLinesSync();
    String contents = "";
    for (var row in dadosSalvos) {
      final colunas = row.split(';');
      String codigo = colunas[0];
      String nome = colunas[1];
      String cientifico = colunas[2];
      String ingles = colunas[3];
      String grupo = colunas[4];
      if (codigo == codigoExcluir) {
        print("linha apagada");
      } else {
        contents += "$codigo;$nome;$cientifico;$ingles;$grupo; \n";
      }
    }
    file.writeAsStringSync(contents);
  }
}