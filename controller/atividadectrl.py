from peewee import ModelSelect

from model.models import Atividade


class AtividadeCtrl:

    def salvar(self, id=None, data=None, horario=None):
        try:
            if id:
                atividade = Atividade.get_by_id(id)
                atividade.data = data
                atividade.horario = horario
            else:
                atividade = Atividade(data=data, horario=horario)
            atividade.save()
            return "Operação realizada com sucesso!!!"

        except Exception as e:
            print(e)
            return "Não foi possível salvar ou atualizar"

    def excluir(self, id):
        try:
            atividade = Atividade.get_by_id(id)
            atividade.delete_instance()
            return "Artigo excluído com sucesso!"
        except Exception as e:
            print(e)
            return "Não foi possível excluir a Atividade!"
