#Projeto Final do módulo

#Criar um dataset com pelo menos cinco colunas numéricas e três categóricas.

# Definindo uma semente para os números randômicos se manterem os mesmos (Reproducibilidade).
set.seed(42) # Porque 42 é a resposta para o universo e tudo mais. 

# Criação aleatória de dataset de tamanho 1000. 
# Os valores numéricos tamanho, envergadura estão em mm. 

dataset <- data.frame(bioma = sample(c('Cerrado', 'Caatinga', 'Pantanal', 'Amazônia', 'Mata Atlântica', 'Pampa'), size=1000, replace=T),
                      alimentacao = sample(c('Onivoro', 'Hematofago', 'Frugivoro', 'Carnivoro'), size=1000, replace=T, prob = c(0.4, 0.1, 0.3, 0.2)),
                      status = sample(c('LC', 'NT', 'VU', 'EN', 'CE', 'EW','EX'), size=1000, replace=T),
                      populacao = rnorm(1000, mean=300, sd=20),
                      exemplares = sample.int(100, size=1000, replace=T),
                      idade = sample.int(20, size=1000, replace=T),
                      tamanho = sample(1:500, size=1000, replace=T),
                      envergadura = sample(200:300, size=1000, replace=T))

dataset

#Grave seu dataset no disco
write.table(dataset, file='especimes.txt', sep = ',')

#Você deverá extrair do dataset:

#Somas e medias das colunas numéricas do dataset usando ??pply

apply(dataset[,4:8], FUN=mean, MARGIN=2)

sapply(dataset[,4:8],FUN=sum)

#Usar split
bioma_status <- split(dataset$bioma, dataset$status)

#Mostra um gráfico
plot(dataset$bioma, dataset$populacao)

#Histograma
hist(dataset$populacao, main = paste('Histograma Exemplar X População'), xlab='População', ylab='Exemplar')



