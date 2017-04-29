#Lendo o arquivo
especimes_data <- read.table('./especimes.txt', sep=',', header=TRUE)

#Adicionando os atributos dependentes
especimes_data['envergaduraXtamanho'] = (especimes_data$envergadura / especimes_data$tamanho) * 100

especimes_data$status <- ordered(especimes_data$status, levels = c('LC', 'NT', 'VU', 'EN', 'CE', 'EW','EX'))

especimes_data['exemplaresXidade'] = especimes_data$idade/ especimes_data$exemplares

#Criando um xyplot para verificar o padrão de envergadura e tamanho com relação ao status de conservação
library(lattice)

xyplot(envergadura ~ tamanho | status, data = especimes_data, layout = c(7,1)) # coluna e linhas

# Verificando o padrão da população organizada pelo status de conservação
library(ggplot2)

qplot(populacao, data = especimes_data, fill = status)

