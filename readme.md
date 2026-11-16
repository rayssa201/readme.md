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
