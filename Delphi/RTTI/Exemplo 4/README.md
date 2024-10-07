# Projeto Delphi: Exemplo de RTTI com Formulário e Componentes

Este projeto Delphi demonstra o uso de **RTTI (Run-Time Type Information)** para inspecionar e manipular dinamicamente campos, métodos e propriedades de um formulário (`TForm`) e seus componentes visuais. Além disso, implementa a validação de campos com atributos personalizados.

## Funcionalidades

- **Inspeção RTTI de Campos**: Percorre os campos declarados no formulário e exibe suas informações.
- **Inspeção RTTI de Métodos**: Lista os métodos do formulário utilizando RTTI.
- **Inspeção RTTI de Propriedades**: Exibe as propriedades declaradas no formulário.
- **Validação de Campos**: Utiliza atributos como `[NotEmpty]`, `[Length]`, e `[MinMaxValue]` para validar os componentes de entrada no formulário.
- **Exibição Dinâmica de Valores de Componentes**: Exibe dinamicamente os valores atuais dos componentes visuais (`TEdit`, `TComboBox`, `TCheckBox`, `TRadioGroup`) em memos.

## Componentes Utilizados

- **`TEdit`**: Campos de entrada de texto.
- **`TComboBox`**: Lista suspensa de seleção.
- **`TCheckBox`**: Botões de seleção (marcar/desmarcar).
- **`TRadioGroup`**: Opções de rádio (seleção única).
- **`TMemo`**: Exibe as informações coletadas sobre os campos, métodos e propriedades.

## Memos

- **`mmLeft`**: Exibe o nome dos campos, métodos ou propriedades e sua classe de origem.
- **`mmClient`**: Exibe o tipo dos campos e detalhes dos métodos ou propriedades.
- **`mmRight`**: Exibe os valores atuais dos componentes visuais encontrados no formulário.

## Atributos de Validação

- **`[NotEmpty]`**: Valida se o campo não está vazio.
- **`[Length(2, 50)]`**: Valida o comprimento do campo (mínimo 2, máximo 50).
- **`[MinMaxValue(1000, 2000)]`**: Valida se o valor numérico está entre 1000 e 2000.

## Como Executar

1. Abra o projeto no Delphi.
2. Compile e execute o projeto.
3. Utilize os botões do formulário para inspecionar campos, métodos e propriedades.
4. Veja os resultados nos **memos**:
   - Informações sobre os campos, métodos ou propriedades aparecerão nos `TMemo`s correspondentes.
   - Valores dos componentes visuais serão exibidos no `mmRight`.

## Validação de Campos

Ao clicar no botão de validação (`btnValidarCampos`), os campos do formulário são validados de acordo com os atributos definidos diretamente nos componentes:

- Se um campo estiver vazio ou fora dos parâmetros definidos (comprimento ou valor), o sistema exibirá mensagens de erro ou alerta.

## Estrutura do Projeto

- **Unit `View.Main.pas`**: Contém toda a lógica de interação com o formulário, incluindo a aplicação de RTTI e validação dos campos.
- **Formulário**: Exibe o layout com botões, campos de entrada e memos para exibição de informações.

## Tecnologias Utilizadas

- **Delphi**: Linguagem de programação principal.
- **RTTI**: Usada para inspeção em tempo de execução de campos, métodos e propriedades.
- **Atributos personalizados**: Usados para validação de campos de forma dinâmica.

## Como Personalizar

Se quiser adicionar novos campos, métodos ou propriedades à inspeção RTTI, basta atualizar o formulário e ajustar o código para processá-los dinamicamente.

## Licença

Este projeto está sob a licença MIT. Sinta-se à vontade para usá-lo e modificá-lo de acordo com suas necessidades.
