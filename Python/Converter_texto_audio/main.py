from gtts import gTTS
from playsound import playsound

language = 'pt-br'

#Obs: Realizar o teste em um texto menor.
audio = gTTS(    
    text = """Python é uma linguagem de programação de alto nível, amplamente reconhecida por sua simplicidade e legibilidade, o que a torna uma excelente escolha tanto para iniciantes quanto para desenvolvedores experientes. Criada por Guido van Rossum e lançada pela primeira vez em 1991, Python tem uma sintaxe que prioriza a legibilidade do código, permitindo que os programadores expressem conceitos de maneira concisa e clara. Um dos principais atrativos de Python é sua versatilidade. Ela é usada em diversas áreas da tecnologia, como desenvolvimento web, ciência de dados, automação, inteligência artificial, aprendizado de máquina, entre outras.
         A comunidade ativa e a vasta coleção de bibliotecas e frameworks disponíveis são outros pontos fortes da linguagem. Ferramentas como Django e Flask facilitam o desenvolvimento de aplicações web, enquanto bibliotecas como NumPy, pandas, e Matplotlib são essenciais para análise de dados e visualização. Para aprendizado de máquina e inteligência artificial, bibliotecas como TensorFlow, PyTorch, e scikit-learn são amplamente utilizadas.
         Python também é conhecida por sua portabilidade, rodando em diversas plataformas, incluindo Windows, macOS e Linux, além de suportar integração com outras linguagens como C, C++ e Java. Sua facilidade de uso e a ampla documentação tornam Python uma ferramenta poderosa para prototipagem rápida, permitindo que desenvolvedores testem ideias e funcionalidades de maneira eficiente. Além disso, Python é uma escolha popular para automação de tarefas, com scripts simples capazes de realizar desde manipulação de arquivos até automação de tarefas administrativas em servidores.
         O crescimento exponencial do uso de Python nos últimos anos também é impulsionado pela sua adoção em ambientes educacionais, onde é usada para ensinar lógica de programação, desenvolvimento de software, e até ciência de dados em universidades ao redor do mundo. Python é uma linguagem que continua evoluindo, com uma comunidade de desenvolvedores que contribui constantemente para seu ecossistema, mantendo-a relevante e atualizada. Essa evolução contínua e o suporte da comunidade garantem que Python permaneça como uma das linguagens de programação mais populares e influentes no mundo da tecnologia.
         """,
        lang=language,
)

audio.save('audio.mp3')
playsound('audio.mp3')