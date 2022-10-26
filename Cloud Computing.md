# Cloud Computing

# Aula 21/10

- O que é cloud computing → serviço de computação em nuvem que tem como base principal a utilização de recursos de TI sob demanda, ou seja, você paga apenas pela que você consome, isso dá a liberdade ao consumidor de montar a sua máquina ou rede da empresa dele de forma dinâmica de acordo com as suas necessidades.
- A Computação em nuvem é para todos
- O limite em nuvem diz-se que é ilimitado, pois é quase impossível existir uma empresa que possa usar o recurso todo de um provedor de nuvem.
- Definição das vantagens de utilizar a computação em nuvem
- Nuvem Pública x Nuvem Privada
    - Vantagens das nuvens públicas:
        - **Redução de custos** – não há necessidade de comprar hardware ou software e você paga somente pelos serviços que usa.
        - **Sem manutenção** – seu provedor de serviços fornece a manutenção.
        - **Escalabilidade quase ilimitada** – recursos sob demanda estão disponíveis para atender às suas necessidades de negócios.
        - **Alta confiabilidade** – uma ampla rede de servidores assegura contra falhas.
- Máquina virtual → é uma emulação de um hardware
- **Revisar o assunto de cloud aula dia 21/10 das 10:00 as 11:30**
- serveless → o usuario nao se preocupa com a infra da rede, ele é feito de forma autonoma pelo provedor de cloud, diferente de IaaS, onde nele eu preciso realizar toda a infra da minha rede.
- Aula da Tarde: Qual o diferencial do Google Cloud Plataform?
    - panorama geral de como é o cenário de Cloud na america latina.
    - Dentro do Big Data : Dataflow, Pub/Sub e Dataproc, ferramentas robustas que conseguimos configurar de forma muito rápida.
    

# Aula 24/10

- Cadastro da conta do GCP
- Apresentações dos grupos da aula invertida

## GPC:

- A nível geral, todos os projetos têm um Id único.
- Todo faturamento é feito a nível de projeto.
- Dica: **nome do projeto:** pode ser alterado de forma a ter duplicatas mas os nº de projeto e Id são únicos.
- Google Cloud status → mostra o status de todos os serviços da plataforma.
- Dentro do Google Cloud ele não chama pela solução e sim pelo nome do serviço. Ex: Vm’s ele chama de Compute Engine e na AWS é EC2.
- O shell, te permite alocar até 10Gb de espaço disponível de forma gratuita automaticamente.
- Azure, AWS e GCP - **IAM** tem o mesmo nome da solução.
    - Não existe projeto sem proprietário
    - papéis = regras (roles)
    - Dentro da empresa, nunca deixe alguém com o mesmo nível de hierarquia de projeto, sendo como proprietário.
    - Tem três principais e dai a gente vai organizando de acordo com a necessidade, sendo eles, administrador, redator ou leitor.
- Criando um novo projeto, é possível alterar o nome do projeto, mas não é possível editar o ID do projeto pois ele é único no mundo.
- Todos os nomes de atribuição dentro do GCP não é possível utilizar letras maiúsculos e caracteres especiais diferentes do hifens. Segue uma padronização de infraestrutura multicloud.
- A nível de organização, o GCP acompanha o nível de hierarquia de pastas, que se aproximam do conceito de grupos e dessa forma é possível organizar os times que trabalham em cada projeto e quais os recursos que esse time irá consumir além de ter o controle de gastos e promover a segurança de informações sensíveis entre setores da empresa dentro do ambiente Cloud.
- Configurações de Billing (Faturamento), realizar a criação de Budgets e alerts (Orçamentos e alertas) para ter o controle financeiro das atividades na plataforma.

```bash
gcloud compute instances create teste --project=bc26-aulas-gabrielcalasans --zone=us-west1-b --machine-type=g1-small --network-interface=network-tier=PREMIUM,subnet=default --maintenance-policy=TERMINATE --provisioning-model=STANDARD --service-account=1060126177066-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=teste,image=projects/debian-cloud/global/images/debian-11-bullseye-v20220920,mode=rw,size=10,type=projects/bc26-aulas-gabrielcalasans/zones/us-west1-b/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any
```

# Aula 25/10 - Máquinas Virtuas (VM)

- Montando uma nova VM
- Boas práticas:
    - Nome da máquina: coisa-semana-nºmáquina
    - exemplo: web-sem2-m01
    - sempre que colocar mais de uma máquina em uma região, colocar em zonas diferentes
    - Máquinas E2 oferecem mais disponibilidade a baixo custo, amplamente utilizada no dia a dia.
    - Dentro dos SO’s o mais recomendado é o Debian, que prioriza a segurança e estabilidade, caso seja um sistema já implementado, usar a versão Linux 10, se vou colocar um novo sistema, Linux 11 mais recente.

Após a máquina criada, faremos a atualização do SO com o comando ***sudo apt update***

Comandos mais utilizados:

| Comando | Função |
| --- | --- |
| sudo apt update | Busca as atualizações disponíveis |
| sudo apt upgrade | Pega o que tem de atualizável, baixa e instala |
| apt install | Busca um novo apt e instala |
| pwd | (Print Work Diretory) verifica onde você está no sistema |
| ls | (List) lista o que tem no diretório |
| ls -l | Lista com detalhes |
| mkdir | criar diretório |
| cd /pasta cd .. cd /home/ cd ~ | navega pelos diretórios |
| vim e nano | cria arquivo (no vim, para iniciar a digitação, pressiona i primeiro, esc para sair da edição, :w para salvar, :q para sair ou :q! para sair sem salvar as alterações ou :wq para salvar e sair) |
| rm e rmdir | remove pastas ou arquivos/ remove apenas pastas (rm - r remove tudo que tem dentro da pasta) |

## Segunda parte da aula - Servidores Web

Definição e conceitos principais. A comunicação entre servidor x cliente é feito pelo protocolo HTTP.

- ************************Conceito de Alta Disponibilidade:************************
    
    O **Auto-Scaling**, é um serviço onde você determina o numero min e max de máquinas que vão prover o seu serviço e a partir desse dado a própria plataforma identifica a necessidade de aumentar ou diminuir a demanda operacional, garantindo alta disponibilidade com otimização dos gastos.
    
    O **Auto Healing**, promove a disponibilidade da aplicação, de tempos em tempos ele irá fazer uma verificação de disponibilidade da aplicação e no caso de haver algum problema que torne ela indisponível, ele mata a máquina e sobe outra com as características do modelo já predefinidos.
    
    Mantendo esses dois serviços disponíveis, garante que minha aplicação, pelo menos a nível de infraestrutura, ela esteja sempre estável e escalável. O trabalho de gerenciar esses serviços é do **Load Balance,** além de receber e balancear o fluxo de requisições à minha aplicação. 
    
    Esse conceito de ter várias máquinas trabalhando em conjunto para atender um serviço específico é um exemplo de **clusterização,** que é o **instace group.**
    
    Agora iremos criar um modelo de servidor web de alta disponibilidade que use os conceitos falados nesse tópicos.
    
    - Criamos primeiro um modelo para que o Load Balance consiga deixar a máquina disponível para subir de forma automatizada.
        - Na opção de script de inicialização você define o que você precisa que o sistema execute assim que criar uma nova máquina.
            
            exemplo de script:
            
            ```bash
            #! **/bin/bash
             apt update
             apt -y install apache2
             cat <<EOF > /var/www/html/index.html
             <html><body><p>Olá, essa é minha página web!</p></body></html>**
            ```
            
    
    # Aula dia 26/10
    
    - Com o template nós podemos criar uma nova instancia ou um grupo de instancia, somente precisamos setar a região e zona. configurações do grupo:
    
    ![Untitled](Cloud%20Computing%2052b8d498824a4139b5b96a05bf3d043f/Untitled.png)
    
    Após criar a grupo de instancias, nós criamos o **health check** para fazer a verificação de integridade da minha aplicação e no caso da verificação falhar x vezes (numero que cadastrarmos como consecutive failures) aí ela mata a máquina e cria uma nova no lugar (**Auto Healing**).
    
    Para verificar o altoScalling: instalar o htop (sudo apt htop), a gente precisa colocar o uso da CPU acima do programado e subir uma terceira máquina.
    
    comando: **cat /dev/zero > /dev/null** a máquina vai entrar em um loop infinito, que vai fazer ela trabalhar em 100%.
    
    ### Load Balance:
    
    Após deixar a aplicação do servidor web com alta disponibilidade, precisamos configurar o load balance para que ele realize a gerência dos acessos a nossa aplicação.
    
    Nele, nós fazemos a configuração de **front-end**, para basicamente criar a porta e o ip que ficará disponível para aplicação do DNS e utilização do usuário e o back-end, para realizar de fato o balanceamento entre as requisições e máquinas, bem como definir parâmetros de utilização máxima.