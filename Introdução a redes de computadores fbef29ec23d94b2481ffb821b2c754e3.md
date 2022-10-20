# Introdução a redes de computadores

## Dia 17/10

- Qual a função do engenheiro de dados?
- Passagem geral sobre os módulos do curso
- Dúvidas sobre o processo do bootcamp
- Passagem geral sobre a dinâmica
- Anúncios sobre a prova de infraestrutura que ocorrerá em 18/10

## Dia 18/10

- Apresentações pessoais
- Apresentação do *Classroom* e *Teacheble*
- Prova de nivelamento de infraestrutura
- Correção da prova:
    - 1- Faz a tradução de ip/http e visse-versa: **Servidor DNS**
    - 2- DNS é o serviço padrão da internet, que faz especificamente a transferência de msg de texto: **Falsa, quem faz é o HTTP**
    - 3- qual protocolo faz os computadores obterem endereço IP automaticamente e diretamente colocado no roteador de maneira ativa: **DHCP**
    - 4- Carrega o endereço fixo, geralmente imutável de um disp de rede: **MAC**
    - 5- Nome que se dar a conexão de rede entre dois países: **Internet**
    - 6- A ARPANET foi o único modelo anterior à internet: **Errada**
    - 7- É responsável por “controlar” e distribuir de forma automatizada as configurações de rede em um conexão e geralmente é uma função que está presente no roteador: **DHCP**
    - 8- Sistemas responsáveis por conectar nossos dispositivos com a internet de maneira ampla: **ISP**
    - 9- Topologia de REDE: **Desenho para um entendimento da rede**
    - 10- Modelo utilizado em massa nas redes mundiais: **Estrela**
    - 11- O gatway funciona como uma ponte que interliga dois ip’s numa mesma rede: **falso (interliga dois ip’s em redes diferentes)**
    - 12- Problema causado pela distância entre a requisição do dado pelo cliente e o servidor que o dado se encontra: **Delay**
    - 13- Quando um servidor ou serviço está sobrecarregado ou o meio de transmissão apresenta falhas de congestionamento o problema ocorre e pode ser percebido em transmissão em “tempo real”, falamos de: **Jitter**
    - 14- É o principal meio de transmissão de redes, devido a não sofrer interferência eletromagnética e conseguir transmitir uma altíssima largura de banda: **Cabo de Fibra Ótica**
    - 15- comumente utilizado em uma rede de dados. Esse meio é utilizado devido a sua maleabilidade e custo beneficio mas pode sofrer interferência eletromagnética: **Cabo UTP**
- Reunião com Juliana do Placement.
- Aula em conteúdo do teacheble (revisão de redes).

## Dia 19/10

- Continuação do conteúdo de revisão de Hardware
    - Dentro do assunto de Hardware:
        - cache - Auxilia o processador ao executar os processos do pc, diminuindo o gargalo entre memória RAM e Processador.
    - falamos sobre os componentes de hardware, passamos por HD ou SSD, placa de vídeo, processador, placa mãe, memória RAM e dispositivos de entrada e saída.
- Reunião com os representantes jurídicos da SoulCode
- Aula com Igor, continuação do assunto de redes.
    - Conexão de rede - só existe uma rede quando há dois ou mais dispositivos conectados e trocando informações
    - MAC - obrigatório para se entrar em rede e único e insubstituível. (se compara a um CPF)
    - O MAC obtém as configurações necessárias para acessar a rede, são 4 informações:
        - IP - é o endereço de referência do dispositivo, geralmente randômico. existem 2 versões atualmente:
            - IPv4 - vai de 0.0.0.0 à 255.255.255.255
            - IPv6 - vai do 0.0.0.0 ao F.F.F.F
        - Mascara - Ela mascara a rede, como o próprio nome já diz.
            - IP privado são divididos em redes locais
            - IP’s públicos são utilizados na rede comum.
        - Gateway - ele é a rota, determina as pontes de entrada/saída da rede. Em 99,99% dos casos ele é o próprio roteador.
        - DNS - é um tradutor que faz a tradução entre domínios e IP’s. exemplo:
            - domínio = [www.google.com](http://www.google.com) > DNS traduz > IP = 255.255.255.255
            - É possível acessar um endereço na rede, mesmo sem o DNS, sabendo o IP do endereço que você quer acessar, não precisa de tradução e consequentemente não precisa do DNS.
            - Para saber o IP de um endereço basta fazer o teste no cmd. ex: ping www.google.com, isso vai me retornar o IP da google além do teste de latência.