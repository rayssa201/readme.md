PETVIDA
Aplicativo de Gerenciamento para Clínica Veterinária

Documento completo do projeto trimestral Desenvolvimento utilizando PHP
IDENTIFICAÇÃO
Integrantes Professor
Local
Ano
INFORMAÇÃO
Rhayane e Raissa Uilian Lourenço Itaperuçu – Paraná 2026
Este documento reúne a proposta do aplicativo, funcionalidades, regras, organização técnica, integração com API pública, estrutura de dados, relatórios, divisão de tarefas e planejamento de testes.
Observação: este arquivo descreve o planejamento do sistema. As funcionalidades serão consideradas prontas somente depois de implementadas e testadas.
PETVIDA | Projeto de Clínica Veterinária em PHP
Página 2
Sumário
1. Apresentação e justificativa
2. Objetivos
3. Público-alvo e perfis de acesso
4. Funcionalidades do aplicativo
5. Fluxo de uso e regras de negócio
6. Tecnologias e integração com API 7. Estrutura de dados sugerida
8. Relatórios e indicadores
9. Segurança e privacidade
10. Divisão de tarefas da equipe
11. Organização dos arquivos PHP
12. Etapas do desenvolvimento
13. Plano de testes
14. Uso do Git e GitHub
15. Diário do Copiloto
16. Resultados esperados e conclusão
Cadastrar e atualizar tutores e animais.
Criar, confirmar, remarcar e cancelar consultas.
Evitar conflitos de horários para o mesmo profissional.
Manter um histórico organizado dos atendimentos.
Permitir que clientes consultem seus próprios agendamentos.
Disponibilizar orientações gerais sobre cuidados preventivos com animais. Consumir uma API pública por meio do PHP, se exigido pela atividade.
Produzir relatórios simples a partir dos dados registrados.
Trabalhar em equipe, documentar o desenvolvimento e testar as funcionalidades.
Desenvolver um aplicativo para gerenciamento de uma clínica veterinária, utilizando PHP para processar os cadastros, agendamentos, consultas aos dados e regras de funcionamento.
2.2 Objetivos específicos
O PetVida será umsistema webde apoio à rotina de uma clínica veterinária. A proposta é reunir, em um só lugar, o cadastro
dos tutores, os dados dos animais, o agendamento de consultas, o histórico de atendimentos e orientações educativas para os clientes. O projeto será desenvolvido utilizando PHP, conforme a tecnologia informada pela equipe.
A organização centralizada pode facilitar a localização de informações, reduzir conflitos na agenda e apoiar o atendimento aos tutores. A aplicação também poderá apresentar relatórios básicos para que a equipe acompanhe a quantidade de consultas e os serviços mais procurados.
2.1 Objetivo geralPerfil
Administrador Recepção Veterinário(a) Tutor/cliente
PETVIDA | Projeto de Clínica Veterinária em PHP
Responsabilidades
Gerenciar usuários, serviços, profissionais, horários, cadastros e relatórios. Cadastrar tutores e animais, agendar consultas e atualizar os status.
Consultar a agenda e registrar informações pertinentes ao atendimento. Consultar os próprios dados, animais, agendamentos e orientações educativas.
Página 3
4. Funcionalidades do aplicativo

3. Público-alvo e perfis de acesso
4.2 Cadastro de tutores
4.3 Cadastro de animais
4.1 Página inicial e painel
4.5 Histórico de atendimentos
4.4 Agendamento de consultas
4.6 Área do cliente e orientações

Resumo das consultas do dia e dos próximos dias. Avisos sobre consultas que aguardam confirmação. Atalhos para cadastros, agenda e histórico.
Nome completo, telefone, e-mail e endereço.
Validação de campos obrigatórios e opção de atualização dos dados. Associação dos dados de contato aos animais cadastrados.
Lista de consultas anteriores por animal e data.
Registro de resumo e recomendações por profissionais autorizados. Possibilidade de registrar data sugerida para retorno, quando indicada.
Seleção do animal, serviço, profissional, data e horário.
Consulta aos horários disponíveis antes de confirmar o agendamento. Status: solicitado, confirmado, concluído, cancelado ou não compareceu. Opção de remarcar ou cancelar conforme as regras da clínica.
Campo para informar o motivo da consulta e observações iniciais.
Visualização dos próprios animais e agendamentos.
Informações gerais sobre vacinação, alimentação, higiene, prevenção de parasitas e transporte seguro. Contato, endereço e horário de funcionamento da clínica.
Aviso para procurar um médico-veterinário quando houver preocupação com a saúde do animal.
Nome, espécie, raça quando conhecida, sexo, data de nascimento aproximada e observações relevantes. Vínculo do animal ao tutor responsável.
Registro de informações fornecidas pelo tutor que possam ser úteis ao atendimento.
As orientações terão caráter educativo e não substituirão consulta, diagnóstico ou prescrição veterinária.
Etapa
1. Identificação 2. Cadastro
3. Escolha
4. Validação
5. Confirmação 6. Atendimento
Ação do sistema
O usuário autorizado acessa o sistema conforme seu perfil.
A recepção localiza ou cadastra o tutor e o animal.
Seleciona serviço, profissional, data e horário disponíveis.
O sistema verifica campos obrigatórios e conflitos de horário.
O agendamento é salvo com um status inicial.
O status é atualizado e, quando aplicável, o histórico é registrado.
PETVIDA | Projeto de Clínica Veterinária em PHP
Página 4
5. Fluxo de uso e regras de negócio

6. Tecnologias e integração com API

Regras de negócio
6.2 Tratamento de falhas
6.3 Armazenamento e consultas
Para que cadastros e agendamentos continuem disponíveis depois de fechar a página, eles precisam ser salvos em banco de dados. Se o trabalho exigir MySQL, a conexão e as consultas podem ser feitas pelo PHP com PDO e consultas preparadas, reduzindo riscos de injeção de SQL.
Fluxo básico de um agendamento
6.1 API pública sugerida: BrasilAPI CEP
A BrasilAPI pode ser utilizada para consultar informações de endereço a partir de um CEP e ajudar no preenchimento do cadastro de um tutor. A chamada será feita pelo PHP, tratando a resposta JSON e verificando se a consulta foi bem-sucedida. Se a API estiver indisponível ou o CEP não for encontrado, o sistema deverá permitir que o usuário informe o endereço manualmente.
●
●
●
●
●
●
●
●
●
●
●
Validar o CEP antes da consulta.
Verificar erros de conexão e o código HTTP retornado.
Não assumir que a resposta sempre terá todos os campos.
Mostrar mensagem clara e permitir preenchimento manual quando necessário.
Um tutor pode ter vários animais cadastrados.
Cada consulta deve estar vinculada a um animal, data, horário e status válido.
O sistema deve evitar dois agendamentos ativos para o mesmo profissional no mesmo intervalo. Consultas canceladas deixam de ocupar o horário conforme as regras definidas pela clínica.
O tutor só pode visualizar seus próprios dados e os animais vinculados à sua conta. Informações clínicas ficam disponíveis somente a perfis autorizados.
O sistema deve informar erros de preenchimento e indisponibilidade com mensagens claras.
A linguagem de programaçãoutilizadapela equipe será PHP. O PHP processará formulários, validará dados, aplicará as
regras e poderá acessar serviços externos por meio de cURL. Se a atividade exigir persistência, o projeto também precisará de um banco de dados compatível, como MySQL; o banco de dados é um componente de armazenamento, não uma segunda linguagem de programação.
Tabela
usuarios tutores animais
Campos principais
id, nome, e-mail, senha protegida, perfil
id, nome, telefone, e-mail, endereço
id, tutor_id, nome, espécie, raça, sexo, nascimento, observações
id, nome, descrição, duração, valor
id, animal_id, serviço_id, profissional_id, data/hora, status, motivo
id, consulta_id, resumo, recomendações, retorno sugerido
id, título, categoria, conteúdo, status
PETVIDA | Projeto de Clínica Veterinária em PHP
Finalidade
Controle de acesso, se houver login. Dados dos clientes.
Cadastro de animais vinculados a tutores.
Catálogo de serviços da clínica. Agenda e controle das consultas.
Página 5
7. Estrutura de dados sugerida
servicos consultas
orientacoes
atendimentos
Histórico do atendimento.
Conteúdo educativo para clientes.
Relacionamentos principais
●
●
●
●
●
Um tutor pode estar relacionado a vários animais.
Um animal pode ter várias consultas ao longo do tempo.
Uma consulta pode gerar um atendimento registrado.
Cada consulta pode estar ligada a um serviço e a um profissional. As orientações podem ser organizadas por categoria.
Nota: a estrutura final deve ser ajustada ao que a equipe realmente implementar e às exigências do professor.
Etapa
1. Identificação 2. Cadastro
3. Escolha
4. Validação
5. Confirmação 6. Atendimento
Ação do sistema
O usuário autorizado acessa o sistema conforme seu perfil.
A recepção localiza ou cadastra o tutor e o animal.
Seleciona serviço, profissional, data e horário disponíveis.
O sistema verifica campos obrigatórios e conflitos de horário.
O agendamento é salvo com um status inicial.
O status é atualizado e, quando aplicável, o histórico é registrado.
PETVIDA | Projeto de Clínica Veterinária em PHP
Página 4
5. Fluxo de uso e regras de negócio

6. Tecnologias e integração com API

Regras de negócio
6.2 Tratamento de falhas
6.3 Armazenamento e consultas
Para que cadastros e agendamentos continuem disponíveis depois de fechar a página, eles precisam ser salvos em banco de dados. Se o trabalho exigir MySQL, a conexão e as consultas podem ser feitas pelo PHP com PDO e consultas preparadas, reduzindo riscos de injeção de SQL.
Fluxo básico de um agendamento
6.1 API pública sugerida: BrasilAPI CEP
A BrasilAPI pode ser utilizada para consultar informações de endereço a partir de um CEP e ajudar no preenchimento do cadastro de um tutor. A chamada será feita pelo PHP, tratando a resposta JSON e verificando se a consulta foi bem-sucedida. Se a API estiver indisponível ou o CEP não for encontrado, o sistema deverá permitir que o usuário informe o endereço manualmente.

6.3 Armazenamento e consultas
Para que cadastros e agendamentos continuem disponíveis depois de fechar a página, eles precisam ser salvos em banco de dados. Se o trabalho exigir MySQL, a conexão e as consultas podem ser feitas pelo PHP com PDO e consultas preparadas, reduzindo riscos de injeção de SQL.

Relatório
Consultas por mês e status
Serviços mais solicitados
Consultas por profissional
Média de consultas por período
Integrante
Rhayane
Área
Backend — integração externa
Backend — regras e segurança
O que apresenta
Volume mensal e situação dos agendamentos.
Quais serviços têm mais agendamentos. Distribuição da agenda por profissional.
PETVIDA | Projeto de Clínica Veterinária em PHP
Foco técnico
PHP e cURL
Exemplo de cálculo
COUNT(*) agrupado por mês e status.
Responsabilidades principais
Realizar a integração com API pública via PHP; tratar JSON, erros de conexão e respostas HTTP.
Implementar validações, regras de agendamento, controle de horários, permissões e mensagens de erro.
Planejar tabelas e relacionamentos para tutores, animais, consultas e atendimentos; conferir consistência dos dados.
Organizar páginas e formulários PHP, testar fluxos, registrar problemas e preparar o documento de apresentação.
Página 6
8. Relatórios e indicadores

9. Segurança e privacidade

10. Divisão de tarefas da equipe

11. Organização sugerida dos arquivos PHP

Validar osdados noservidor, mesmo que os formulários também tenham validação visual.
Utilizar consultas preparadas no acesso ao banco de dados.
Se houver login, armazenar senhas com hash apropriado, nunca em texto puro. Controlar as permissões de cada perfil.
Evitar expor dados pessoais ou informações clínicas a usuários não autorizados. Não incluir senhas, chaves de API ou dados reais de clientes no GitHub.
Tratar falhas da API sem exibir detalhes técnicos sensíveis ao cliente.
Manter cópias de segurança de acordo com os recursos disponíveis.
Osistema deverápermitir analisar osdados que foram efetivamente registrados. Caso a atividade peça pelo menos dois
relatórios analíticos, estas opções podem ser implementadas com consultas SQL executadas pelo PHP:
Trabalho conjunto: revisar cadastros, agendamentos, permissões, orientações, relatórios e funcionamento geral antes da apresentação.
Os relatórios devem ser apresentados em tabelas claras. Se o ambiente e o escopo permitirem, os dados também poderão ser representados em gráficos. O gráfico precisa refletir dados salvos no sistema, e não valores inventados para demonstração.
Umaestruturasimplespodesepararpáginasporfunção.Osnomesabaixosão sugestões e podem ser adaptados ao projeto real:
A divisãoprincipalficaequilibrada:duasáreasparaRhayane e duas áreas para Raissa. As duas integrantes devem participar
da integração e dos testes finais.
Raissa
Raissa
Rhayane
Banco de dados
Interface, testes e documentação
PHP
MySQL e modelagem
Páginas PHP e documentação
Média de atendimentos por período definido.
COUNT(*) agrupado por serviço. COUNT(*) agrupado por profissional.
AVG() sobre dados agrupados conforme o modelo.
●
●
●
●
●
●
●
●
petvida/
index.php
login.php
painel.php
tutores.php
animais.php
■■■
■■■
■■■
■■■
■■■

PETVIDA | Projeto de Clínica Veterinária em PHP
Página 7
■■■ ■■■ ■■■ ■■■ ■■■ ■■■
consultas.php atendimentos.php orientacoes.php relatorios.php conexao.php api_cep.php
O arquivo conexao.php poderá concentrar a conexão com o banco, se houver. O arquivo api_cep.php poderá conter a lógica da consulta externa. Dados de acesso devem ficar protegidos e fora de repositórios públicos.


Data
Teste
Cadastro de tutor
Etapa
1. Planejamento
2. Modelagem 3. Cadastros 4. Agenda
Atividades
Definir requisitos, telas, dados e regras.
Procedimento
Enviar dados válidos e inválidos.
Tarefa/pergunta feita à IA
PETVIDA | Projeto de Clínica Veterinária em PHP
Sugestão aproveitada ou descartada
_________________________ ___
Resultado esperado
Salvar dados válidos e apontar campos incorretos.
O vínculo correto fica registrado. Consulta é criada com status definido. O sistema impede o conflito.
Resultado esperado
Escopo definido.
Como foi verificado
Página 8
13. Plano de testes
15. Diário do Copiloto

14. Uso do Git e GitHub

12. Etapas do desenvolvimento
5. API
____/____/20 26
Cancelamento
6. Relatórios
7. Testes
8. Documentação
Permissões
API indisponível Relatórios
Cadastro de animal Agendamento Conflito de horário
_________________________ ___
Vincular um animal a um tutor. Selecionar horário disponível.
Tentar reservar o mesmo intervalo para o profissional.
Cancelar uma consulta ativa.
Tentar acessar dados de outro tutor. Simular falha na consulta de CEP. Comparar os totais com os registros salvos.
Organizar as entidades e os relacionamentos. Criar cadastro e edição de tutores e animais. Implementar disponibilidade, status, remarcação e cancelamento.
Realizar chamada externa em PHP e tratar erros.
Criar pelo menos dois relatórios baseados nos dados salvos. Testar cadastros, permissões, conflitos e falhas.
Revisar este documento e registrar o uso de ferramentas.
Estrutura de dados planejada. Cadastros funcionando.
Fluxo de consultas funcionando.
Status muda e horário é liberado conforme a regra.
O acesso não autorizado é bloqueado. Mensagem clara e alternativa manual. Resultados correspondem aos dados reais.
Consulta de CEP funcional, se adotada.
Informações analíticas disponíveis. Problemas corrigidos.
Entrega pronta para apresentação.
_________________________ ___
Sea atividade exigirum “Diáriodo Copiloto”, a equipe deve registrar como ferramentas de IA foram utilizadas durante o
desenvolvimento, incluindo o que foi pedido, o que foi aproveitado, o que foi alterado e como o resultado foi testado. O texto deve refletir o uso real, sem inventar etapas.
O guiaenviado pela equipe apresentaouso de Git e GitHub no Visual Studio Code em Linux Mint. Para organizar o trabalho
em equipe, recomenda-se registrar alterações com commits claros, sincronizar o repositório com cuidado e revisar as mudanças antes da entrega.
Criar um repositório para o projeto PetVida.
Fazer commits pequenos e descritivos, por exemplo: “Cria cadastro de tutores”. Separar tarefas em branches se isso fizer parte da rotina ensinada.
Revisar e testar alterações antes de juntá-las à versão principal.
Nunca enviar senhas, credenciais ou dados pessoais reais para o repositório.
●
●
●
●
●

Data
Tarefa/pergunta feita à IA
PETVIDA | Projeto de Clínica Veterinária em PHP
Sugestão aproveitada ou descartada
_________________________ ___
_________________________ ___
Como foi verificado
Página 9
____/____/20 26
____/____/20 26
_________________________ ___
_________________________ ___
_________________________ ___
_________________________ ___
16. Resultados esperados e conclusão

Referências de apoio enviadas pela equipe

Catálogode APIs Públicas: +20OpçõesProntas paraoProjeto — material de apoio para escolha de API pública.
Guia Prático: Git e GitHub no Visual Studio Code — Linux Mint — material de apoio para controle de versão e trabalho em equipe.
Projeto Trimestral de Desenvolvimento Web: PHP, MySQL e APIs Públicas — requisitos da atividade, conforme descritos nos materiais compartilhados.
Espera-se que o PetVida facilite aorganizaçãoda clínica,reunindo cadastro de tutores e animais, agendamentos, histórico de
atendimentos e orientações educativas. A proposta também permite aplicar conceitos de programação em PHP, organização de dados, integração com API, segurança, testes e colaboração por meio do GitHub.
A divisão de responsabilidades dá a Rhayane duas áreas principais — integração externa e regras/segurança em PHP — e a Raissa duas áreas — banco de dados e interface/testes/documentação. As duas trabalharão juntas na revisão final. O projeto deve ser apresentado com transparência, distinguindo as funcionalidades implementadas daquelas que ainda estiverem planejadas.
●
●
●
PETVIDA | Rhayane e Raissa | Professor Uilian Lourenço | Itaperuçu – Paraná | 2026

