# V.I.A – Vetor Inteligente de Agendamentos

Projeto desenvolvido na Fábrica de Projetos.

## Sobre o Projeto

O **V.I.A (Vetor Inteligente de Agendamentos)** é uma aplicação web voltada para a gestão inteligente de áreas públicas de carga e descarga.

O sistema tem como objetivo reduzir conflitos de horário, evitar uso indevido das vagas e melhorar a organização do tráfego urbano por meio de agendamento digital e controle de permanência.

---

## Objetivo

Desenvolver uma plataforma web que permita:

- Agendamento de vagas públicas de carga e descarga
- Controle de tempo de permanência
- Registro automático de infrações
- Organização logística para empresas e motoristas

---

## Público-Alvo

- **Empresas** que utilizam áreas públicas de carga e descarga
- **Motoristas** responsáveis pela utilização das vagas

---

## Principais Funcionalidades

- Cadastro e autenticação de usuários
- Cadastro de empresas e veículos
- Agendamento de vagas com controle de horário
- Visualização de calendário com disponibilidade
- Tolerância automática de 30 minutos
- Registro automático de infrações após tolerância
- Notificação de encerramento de tempo

---

## Regras de Negócio

- Uma vaga não pode ser reservada por dois usuários no mesmo horário
- Um veículo não pode possuir dois agendamentos simultâneos
- Tempo máximo de uso: 3 horas
- Tolerância de 30 minutos após o horário final
- Agendamentos apenas para horários futuros
- Cancelamento permitido até 30 minutos antes do horário inicial

---

## Segurança

- Senhas criptografadas com hash seguro
- Autenticação via JWT
- Proteção contra SQL Injection e XSS
- Validação de CNPJ e e-mail
- Controle de acesso baseado em autenticação

---

## Stack Tecnológica

### Frontend

- Vue.js

### Backend

- Node.js
- Express

### Banco de Dados

- PostgreSQL

### UX/UI

- Figma

### Integrações

- API Google Maps

### Deploy

- Vercel
- Railway

### Organização

- Trello

### Como Instalar 

* Git Clone https://github.com/LipeS-exe/F-bricaDeProjeto-VIA-2026.git
* npm install

## Licença

Projeto acadêmico desenvolvido para fins educacionais.
