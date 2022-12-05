import models

# Atividade
atividade = models.Atividade()
atividade.data = '03-09-2022'
atividade.horario = '12:00'
atividade.save()

# Local
local = models.Local()
local.nome = 'Escola'
local.capacidade = 90
local.save()

#LocalAtividade
local_atividade = models.LocalAtividade()
local_atividade.local = local
local_atividade.atividade = atividade
local_atividade.save()
