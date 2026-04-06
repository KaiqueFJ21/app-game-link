# 🧪 Guia de Testes - GameLink App

## 📋 Casos de Teste

### 1. **Tela de Login**

#### Teste 1.1: Login Válido
- **Passos**:
  1. Abrir o app
  2. Inserir email: `usuario@gamelink.com`
  3. Inserir senha: `senha123`
  4. Clicar em "ENTRAR"
- **Resultado Esperado**: Navegar para HomeScreen com sucesso

#### Teste 1.2: Email Inválido
- **Passos**:
  1. Inserir email: `emailinvalido`
  2. Inserir senha: `senha123`
  3. Clicar em "ENTRAR"
- **Resultado Esperado**: Mostrar erro "Email inválido"

#### Teste 1.3: Senha Muito Curta
- **Passos**:
  1. Inserir email: `usuario@gamelink.com`
  2. Inserir senha: `123`
  3. Clicar em "ENTRAR"
- **Resultado Esperado**: Mostrar erro "Senha deve ter pelo menos 6 caracteres"

#### Teste 1.4: Campos Vazios
- **Passos**:
  1. Deixar campos vazios
  2. Clicar em "ENTRAR"
- **Resultado Esperado**: Mostrar erro "Email e senha são obrigatórios"

#### Teste 1.5: Toggle de Visibilidade de Senha
- **Passos**:
  1. Inserir senha
  2. Clicar no ícone de olho
- **Resultado Esperado**: Senha fica visível/invisível

#### Teste 1.6: Link para Registro
- **Passos**:
  1. Clicar em "Registre-se"
- **Resultado Esperado**: Navegar para RegisterScreen

---

### 2. **Tela de Registro**

#### Teste 2.1: Registro Válido
- **Passos**:
  1. Clicar em "Registre-se" na tela de login
  2. Inserir username: `novousuario`
  3. Inserir email: `novo@gamelink.com`
  4. Inserir senha: `senha123`
  5. Confirmar senha: `senha123`
  6. Marcar checkbox de termos
  7. Clicar em "REGISTRAR"
- **Resultado Esperado**: Navegar para HomeScreen

#### Teste 2.2: Senhas Não Coincidem
- **Passos**:
  1. Inserir senha: `senha123`
  2. Confirmar senha: `senha456`
  3. Clicar em "REGISTRAR"
- **Resultado Esperado**: Mostrar erro "As senhas não coincidem"

#### Teste 2.3: Termos Não Aceitos
- **Passos**:
  1. Preencher todos os campos
  2. Não marcar checkbox de termos
  3. Clicar em "REGISTRAR"
- **Resultado Esperado**: Mostrar erro "Você deve aceitar os termos de serviço"

#### Teste 2.4: Username Muito Curto
- **Passos**:
  1. Inserir username: `ab`
  2. Preencher outros campos
  3. Clicar em "REGISTRAR"
- **Resultado Esperado**: Mostrar erro "Username deve ter pelo menos 3 caracteres"

#### Teste 2.5: Voltar para Login
- **Passos**:
  1. Clicar em "Faça login"
- **Resultado Esperado**: Voltar para LoginScreen

---

### 3. **Tela Home (Dashboard)**

#### Teste 3.1: Exibição de Estatísticas
- **Passos**:
  1. Fazer login com sucesso
  2. Verificar se os cards de estatísticas aparecem
- **Resultado Esperado**: 
  - Card de Nível com valor "25"
  - Card de Vitórias com valor "150"
  - Card de Taxa de Vitória com valor "75%"
  - Card de Ranking com valor "#245"

#### Teste 3.2: Desafio Ativo Visível
- **Passos**:
  1. Na tela home, scroll down
  2. Verificar seção "Desafios Ativos"
- **Resultado Esperado**: Mostrar desafio "Torneio 1v1 Valorant" com botão "Participar"

#### Teste 3.3: Botão Sair
- **Passos**:
  1. Clicar em "Sair" no card de boas-vindas
- **Resultado Esperado**: Voltar para LoginScreen e limpar dados de sessão

#### Teste 3.4: Navegação por Abas
- **Passos**:
  1. Clicar em aba "Chat"
  2. Verificar se tela de chat aparece
  3. Clicar em aba "Ranking"
  4. Verificar se tela de ranking aparece
  5. Clicar em aba "Loja"
  6. Verificar se tela de loja aparece
  7. Clicar em aba "Home"
  8. Verificar se volta para dashboard
- **Resultado Esperado**: Todas as abas funcionam corretamente

---

### 4. **Tela de Chat**

#### Teste 4.1: Tela Visível
- **Passos**:
  1. Clicar em aba "Chat"
- **Resultado Esperado**: Mostrar mensagem "Chat em Desenvolvimento"

---

### 5. **Tela de Ranking**

#### Teste 5.1: Tela Visível
- **Passos**:
  1. Clicar em aba "Ranking"
- **Resultado Esperado**: Mostrar mensagem "Ranking em Desenvolvimento"

---

### 6. **Tela de Loja**

#### Teste 6.1: Tela Visível
- **Passos**:
  1. Clicar em aba "Loja"
- **Resultado Esperado**: Mostrar mensagem "Loja em Desenvolvimento"

---

## 🔄 Testes de Fluxo Completo

### Fluxo 1: Login → Home → Sair
1. Abrir app
2. Fazer login
3. Verificar dashboard
4. Clicar em sair
5. Verificar se volta para login

### Fluxo 2: Registro → Home → Sair
1. Abrir app
2. Clicar em "Registre-se"
3. Preencher formulário
4. Clicar em "REGISTRAR"
5. Verificar dashboard
6. Clicar em sair

### Fluxo 3: Navegação entre Abas
1. Fazer login
2. Clicar em cada aba
3. Verificar se todas funcionam
4. Voltar para home

---

## 🎨 Testes de UI/UX

### Cores e Tema
- [ ] Fundo escuro (#0a0e27) aplicado corretamente
- [ ] Cores neon (cyan #00D9FF e verde #00FF88) visíveis
- [ ] Gradientes em botões funcionam
- [ ] Borders brilhantes em inputs aparecem

### Responsividade
- [ ] App funciona em telas pequenas (4.5")
- [ ] App funciona em telas médias (5.5")
- [ ] App funciona em telas grandes (6.7"+)
- [ ] Textos legíveis em todas as telas
- [ ] Botões clicáveis em todas as telas

### Animações
- [ ] Transições suaves entre telas
- [ ] Loading spinner aparece durante login
- [ ] Erros aparecem com animação

---

## 🔒 Testes de Segurança

### Validação de Dados
- [ ] Email validado corretamente
- [ ] Senha não exibida por padrão
- [ ] Dados persistem em SharedPreferences
- [ ] Logout limpa dados de sessão

### Persistência
- [ ] Login persiste após fechar app
- [ ] Logout remove dados de sessão
- [ ] Dados do usuário carregam corretamente

---

## 📊 Testes de Performance

### Velocidade
- [ ] App abre em menos de 3 segundos
- [ ] Login completa em menos de 2 segundos
- [ ] Navegação entre abas é instantânea
- [ ] Scroll suave sem lag

### Memória
- [ ] App não consome muita memória
- [ ] Sem memory leaks
- [ ] Imagens carregam corretamente

---

## 🐛 Bugs Conhecidos

(Adicionar bugs encontrados durante testes)

---

## ✅ Checklist de Entrega

- [ ] Todos os testes passam
- [ ] Sem erros no console
- [ ] App funciona em Android
- [ ] App funciona em iOS
- [ ] App funciona em Web
- [ ] Documentação atualizada
- [ ] Código formatado
- [ ] Sem warnings

---

## 📱 Dispositivos Testados

| Dispositivo | SO | Versão | Status |
|-------------|----|---------|----|
| Emulador Android | Android | 12 | ✅ |
| Emulador iOS | iOS | 16 | ✅ |
| Navegador Chrome | Web | Latest | ✅ |

---

**Última atualização**: Abril de 2026
**Responsável**: Equipe de QA
