## Trabalho: Geração de imagens vetoriais

### Linguagens  utilizadas: Python e Haskell

# Python  :

![Screenshot_2023-01-25_18-33-19](https://user-images.githubusercontent.com/82295321/214696149-430af9b0-01a0-4924-924f-0b5d7f38b9d4.png)

Neste projeto, fora utilizada a biblioteca  <a href="https://pycairo.readthedocs.io/en/latest/" targe="_blank">PyCairo</a>


##  Para instalar a PyCairo é facil: 

```bash
  pip install pycairo
```

## Certo, agora que já sabemos o que foi utilizado e como instalar a mesma, vamos a algumas informações importantes:

### O que é a PyCairo ? 

Bom, Pycairo é um módulo Python que fornece ligações para a biblioteca gráfica cairo. Esta biblioteca é usada para criar arquivos SVG, ou seja, vetoriais em python. A maneira mais fácil e rápida de abrir um arquivo SVG para visualizá-lo (somente leitura) é com um navegador da web moderno como o Chrome, Firefox, Edge ou Internet Explorer - quase todos eles devem fornecer algum tipo de suporte de renderização para o formato SVG. 

### Você pode talvez estar se perguntando o que é um SVG, bom fazer o que né, enfim

O arquivo SVG é um arquivo gráfico que usa um formato de gráfico vetorial bidimensional criado pelo World Wide Web Consortium (W3C). Ele descreve imagens usando um formato de texto baseado em XML. Os arquivos SVG são desenvolvidos como um formato padrão para exibir gráficos vetoriais na web.

### Certo, as principais perguntas já foram respondidas, podemos seguir em frente, como o PyCairo "Desenha" seus SVG's na tela ?

Bom podemos dividir isso tudo em 5 etapas: 

Na Primeira importaremos o módulo Pycairo.

```
import cairo
```

Na Segunda etapa, iremos criar um objeto de superfície SVG e adicione contexto a ele.

```
with cairo.SVGSurface("example.svg", 800, 800) as surface:
```

Na Terceira etapa, Temos a criação de função para a forma de quadrado

```
triangulo = cairo.Context(surface)
```

Na Quarta etapa, iremos chamar a função com parâmetros e prencher a cor interna do objeto usando fill() e o close_path() pra finalizar o desenho
```
    triangulo.set_source_rgb("pink")

    triangulo.rotate(31 * math.pi / 180)

    triangulo.scale(0.5, 0.5)
    triangulo.translate(202, 120)
    triangulo.move_to(170, 90)
    triangulo.line_to(400, 200)
    triangulo.line_to(150, 350)
    
    triangulo.fill()
    triangulo.close_path()
 ```
 
 E por fim pra renderizaar o desenho e rodar o código  iremos usar: 
 
 ```
   triangulo.stroke()
   triangulo.stroke()
 ```
 ### Após efetuar todas as instlações, juntamente com esse README.md,  irá ter um diretorio com o nome Diamond, dentro dele você irá econtarar todos os arquivos do projeto, e se tudo correr bem, após rodar o código, você ira ter uma imagem igual a está:
 
![Screenshot_2023-01-25_19-09-07](https://user-images.githubusercontent.com/82295321/214703214-8c92a71a-e7d5-4463-9b8f-b56544683a76.png)

 
Bom é isso, agora que você sabe  já sabe como instalar e utilizar a biblioteca, basta liberar sua criatividade e com ela desenvolver  as mais diversas formas e desenhos. Abaixo deixarei alguns links para você se aprofundar ainda mais na utilização do PyCairo ^^

https://pycairo.readthedocs.io/en/latest/

https://pypi.org/project/pycairo/

https://cairographics.org/

https://github.com/Hansimov/pycairo-examples

https://acervolima.com/pycairo-desenho-de-diferentes-tipos-de-juncoes-de-linha/

# Haskell: 

Para executar o programa, usaremos o código “Main.hs”. Para executar o programa devem ser seguidos alguns passos.

1. Deve-se abrir um console no local onde o arquivo está salvo e digitar o comando “ghci Main.hs”
2. Digitar “main”, para chamr a função principal que irá gerar o resultado.

Após o programa ser executado uma imagem chamada “output.sgv” será gerada e ela se parecerá com a imagem abaixo:

## Comparação

Ambas os programas apesar de gerarem uma imagem similar são feitos de forma bem diferentes pois possuem várias diferenças que valem apena ser destacadas.
Primeiramente, as linguagens utilizadas para a criação dos códigos, Python e Haskell, possuem a diferença de Python ser uma linguagem imperativa, um tipo de linguagem que descreve as ações que devem ser feitas, enquanto Hakell é uma linguagem declarativa, sendo uma linguagem que no que o programa deve realizar sem especificar como o programa deve alcançar o resultado desejado.

Além disso as duas liguagens seguem paradgmas diferentes enquanto Python é uma linguagem multiparadigma, podendo ser orientado a objetos, imperativo, procedural e funcional, já a linguagem Haskell é uma linguagem puramente funcional, oque faz com que seu códigos se tornem diferentes.

Uma diferença bem evidente entre os códigos é a sua complexidade, enquanto em Python o programa se  torna bem mais simples, com todo o código na “Main”, em Haskell são necessárias várias funções distintas para obter o mesmo resultado.

Para gerar uma imagem svg em Haskell foi necessário criar uma função manualmente, que gerasse a string de uma imagem svg com as dimensões e parametros corretos da imagem já com Python, não foi necessario criar uma função, devido a utilização do PyCairo.

Agora após termos abordado as diferenças vale ressaltar também as semelhasnças, em ambos os códigos foi utilizado um comando para gerar números aleatores para a definição do rgb, em Python foi o “random.randint” já em Haskell foi utilizado o “RamdomRs” que, no código, são usados para gerar números aleatórios de 0 á 255 para definir o rgb.

Para finalizar concluimos que por se tratarem de linguagens que seguem paradigmas diferentes os códigos acabaram gerando a mesma imagem de forma bem diferente, mostrando que apesar de se tratar de uma mesma imagem em formato svg a forma de costrui-la pode ser bem diferente dependendo do paradigma que a linguagem escolhida seguir. 




