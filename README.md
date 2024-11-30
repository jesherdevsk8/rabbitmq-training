Aqui está um exemplo de README bem estruturado para seu projeto:

---

# RabbitMQ Training Projects  

Este repositório contém dois projetos distintos para treinamento com RabbitMQ:  

1. **SyncNotaries**  
2. **RubyDispatcher**  

Ambos os projetos exploram o conceito de mensageria usando RabbitMQ, mas cada um possui um enfoque específico.

---

## 1. SyncNotaries  

O **SyncNotaries** é um projeto focado em sincronizar dados de cartórios e empreendimentos entre dois sistemas usando RabbitMQ e a biblioteca [Bunny](http://rubybunny.info/). Ele simula um sistema onde um **producer** gera mensagens representando eventos de criação, e um **consumer** processa essas mensagens para replicar as informações em outros sistemas.  

### Tecnologias Utilizadas  

- **Ruby on Rails**  
- **RabbitMQ**  
- **Bunny**  

### Objetivo  

Praticar o uso de filas de mensagens para sincronização entre sistemas distintos.  

### Estrutura  

- **Producer**: Envia mensagens para uma fila RabbitMQ.  
- **Consumer**: Recebe e processa mensagens da fila.  

---

## 2. RubyDispatcher  

O **RubyDispatcher** é um projeto genérico, minimalista, implementado apenas com Ruby puro. Ele explora a troca de mensagens entre um **producer** e um **consumer** utilizando RabbitMQ para gerenciar as filas.  

### Tecnologias Utilizadas  

- **Ruby**  
- **RabbitMQ**  
- **Bunny**  

### Objetivo  

Treinar conceitos básicos de mensageria e filas, como:  

- Produção de mensagens.  
- Consumo de mensagens.  
- Comunicação assíncrona entre serviços.  

### Estrutura  

- **Producer**: Envia mensagens para uma fila RabbitMQ.  
- **Consumer**: Recebe mensagens da fila e as processa.  

---

## Pré-requisitos  

Certifique-se de ter as seguintes ferramentas instaladas:  

- [Ruby](https://www.ruby-lang.org) (versão 3.3+ recomendada)  
- [RabbitMQ](https://www.rabbitmq.com/download.html)  
- Biblioteca `bunny` instalada:  

```bash
bundle add bunny

# rodar docker compose
docker compose -f sync_notaries/compose.yml up -d
```

---

## Configuração  

1. Certifique-se de que o RabbitMQ está rodando em sua máquina.  
2. Clone este repositório:  

```bash
git clone https://github.com/seu-usuario/rabbitmq-training.git
cd rabbitmq-training
```

3. Navegue até o projeto desejado (`sync_notaries` ou `ruby_dispatcher`) e execute os scripts em `producer` e `consumer`.  

---

## Execução  

### Producer  

Dentro do diretório do **producer**, execute:  

```bash
ruby producer.rb
```

### Consumer  

No diretório do **consumer**, execute:  

```bash
ruby consumer.rb
```

---

## Licença  

Este projeto está licenciado sob a [MIT License](LICENSE).  

--- 

