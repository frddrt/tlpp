# WebDialog
Cria uma janela exibindo um HTML e propiciando uma integração ADVPL/TLPP com o Javascript.

## Metodos

### new(title, filename)
Construtor da classe

#### Parâmetros
	title (Character) => Título da janela que será aberta.
	filename (Character) => Nome do arquivo que será criado na pasta temporária, na máquina local.

#### Retorno
	self (Object) => A instância da classe.

### close()
Encerra a classe, fechando a janela e removendo da memória os objetos criados.

### open()
Abre a janela e exibe o HTML criado.

### setCss(css)
Aplica uma folha de estilo customizada.

#### Parâmetro
	css (Character) => A folha de estilo que deverá ser aplicada.

### setEvent(key, action)
Cria os eventos de integração com o javascript

#### Parâmetros
	key (Character) => A chave que será chamada na integração com o javascript
	action (Codeblock) => Bloco de código que será executado. Recebe 3 parâmetros na seguinte ordem:
		1. A instância atual do objeto webdialog.
		2. O objeto webchannel.
		3. O valor retornado pelo javascript.

### setHtml(html)
Aplica um HTML customizado. Se não for passado um HTML customizado, será utilizado um HTML padrão com a integração com o Bootstrap.
Este HTML contém uma DIV com o ID "app", para ser utilizado na criação das estruturas via código javascript.

#### Parâmetro
	html (Character) => O HTML customizado a ser aplicado.

## Exemplo

```clipper
User Function tela()
	Local webDialog as Object

	webDialog := WebDialog():new("HTML com javascript", "example")
	webDialog:setCss(getCss())
	webDialog:setEvent('<close>', {|dialogo, channel, value| dialogo:close()})
	webDialog:setEvent('<getdata>', {|dialogo, channel, value| sendData(channel)})

	webDialog:open()
Return

Static Function sendData(channel as Object)
	Local json := JsonObject():new(), ontem := dDatabase - 1

	while dataValida(ontem) <> ontem
		ontem -= 1
	end

	json["hoje"] := getSummary(dDatabase)
	json["ohtem"] := getSummary(ontem)

	channel:advplToJS('<senddata>', json:toJson())
Return
```
