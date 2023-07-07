## Desafio Analytics Engineer

Desafio realizado durante o programa Indicium Lighthouse para trilha de cientista de dados. Este desafio está relacionado à etapa de Analytics Engineer com objetivo de realizar avaliar o conteúdo aprendido durante o ciclo.

## Instruções

1. Para execução do projeto, realize um fork do repositório e um clone para sua máquina local.

```
git clone https://github.com/Lineker98/desafio_ae.git
```

2. Crie um abiente virtual para instalação das dependências com:

- Criação do ambiente virtual para instalação das dependências:
```
pip install virtualenv
```

- Com o venv instalado, e dentro do diretório do projeto, execute:
```
python3 -m venv <nome_do_ambiente>
```

- Para ativação do ambiente, digite no terminal
    - Linux:
    ```console
    source <nome_do_ambiente>/bin/activate
    ```

    - Windows:
    ```
    <name_do_ambientet>\Scripts\activate
    ```

- Para utilizar o mesmo DW (Bigquery), use o comando abaixo e se conecte com o seu BigQuery.
    ```
    pip install dbt-bigquery
    ```

As tabnelas utilizadas são da base de dados Adventure Works e já estão presenets no projeto. Para realziar o carregamento, digite 
    ```
    dbt seed
    ```

## Recursos:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices