# TL++ and ADPL tools
Ferramentas em TL++ e ADVPL

## Ferramentas:

### StringBuilder
Monta uma string e retorna uma string, semelhante ao StringBuilder do Java.

```clipper
stringBuilder := StringBuilder():new()

stringBuilder:append("Hoje é ")
stringBuilder:append(dDatabase)
stringBuilder:append(" e está fazendo ")
stringBuilder:append(30)
stringBuilder:append(" graus na sombra")

alert(stringBuilder:toString())
```
