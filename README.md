# Marketplace Web

![Captura de Tela](imagens/Captura%20de%20Tela%202025-05-25%20às%2001.06.33.png)

## Sobre o Projeto

Marketplace Web é uma aplicação Flutter para web que permite a integração entre lojas e clientes em uma única plataforma. Este projeto implementa um marketplace completo com funcionalidades para diferentes tipos de usuários (clientes e estabelecimentos).

## Principais Características

### Para Clientes
- Navegação por categorias de produtos
- Busca de estabelecimentos e produtos
- Carrinho de compras
- Gerenciamento de pedidos
- Sistema de pagamento integrado
- Perfil de usuário personalizável

### Para Estabelecimentos
- Painel administrativo completo
- Cadastro e gerenciamento de produtos
- Controle de estoque
- Visualização e gerenciamento de pedidos
- Relatórios e análises de vendas
- Configuração de perfil da loja

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento multiplataforma
- **Modular**: Arquitetura modular para organização do código
- **MobX**: Gerenciamento de estado reativo e fluxo de dados unidirecional
- **Reactive Forms**: Validação e gerenciamento de formulários
- **Responsive Framework**: Layout responsivo para diferentes tamanhos de tela
- **Dio**: Cliente HTTP para requisições de API
- **Shared Preferences**: Armazenamento de dados locais
- **JWT**: Autenticação segura

## Arquitetura

O projeto segue uma arquitetura modular organizada por funcionalidades:

```
lib/
  ├── app/
  │   ├── core/                    # Núcleo da aplicação
  │   │   ├── client/              # Cliente HTTP
  │   │   └── request_core.dart    # Gerenciador de requisições
  │   ├── models/                  # Modelos de dados
  │   ├── modules/                 # Módulos da aplicação
  │   │   ├── client/              # Módulo de cliente
  │   │   ├── login/               # Módulo de autenticação
  │   │   ├── register/            # Módulo de registro
  │   │   └── store/               # Módulo de loja
  │   ├── routes/                  # Rotas da aplicação
  │   └── utils/                   # Utilitários
  └── main.dart                    # Ponto de entrada da aplicação
```

### Fluxo de Autenticação

A aplicação implementa um sistema de autenticação completo com:
- Login para clientes e estabelecimentos
- Armazenamento seguro de tokens JWT
- Proteção de rotas para usuários autenticados
- Níveis de acesso diferentes por perfil

### Interface Responsiva

## Configuração e Execução

### Requisitos
- Flutter 3.0.0 ou superior
- Dart 3.0.0 ou superior

### Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/new_marketplace_web.git
```

2. Navegue até o diretório do projeto:
```bash
cd new_marketplace_web
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Execute o projeto:
```bash
flutter run -d chrome
```

## Estrutura de Módulos

### Módulo de Login
Gerencia a autenticação de usuários com suporte para diferentes perfis (cliente e estabelecimento).

### Módulo de Cliente
Implementa a experiência de usuário para clientes do marketplace, incluindo:
- Navegação por categorias
- Visualização de produtos
- Carrinho de compras
- Histórico de pedidos

### Módulo de Loja
Fornece ferramentas para gerenciamento de estabelecimentos, incluindo:
- Cadastro e edição de produtos
- Gerenciamento de pedidos
- Configurações da loja
- Relatórios de vendas

## Contribuição

Para contribuir com o projeto:

1. Faça um fork do projeto
2. Crie uma nova branch (`git checkout -b feature/nova-funcionalidade`)
3. Faça commit das suas alterações (`git commit -m 'Adiciona nova funcionalidade'`)
4. Faça push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a MIT License - veja o arquivo LICENSE para mais detalhes.

## Contato

Nathan Oliveira - nathan.oliveira@exemplo.com
