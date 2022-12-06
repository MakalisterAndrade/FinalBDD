from peewee import ModelSelect

from model.models import Local


class LocalCtrl:

    def salvar(self, id=None, nome=None, capacidade=None):
        try:
            if id:
                local = Local.get_by_id(id)
                local.nome = nome
                local.capacidade = capacidade
            else:
                local = Local(nome=nome, capacidade=capacidade)
            local.save()
            return "Operação realizada com sucesso!!!"

        except Exception as e:
            print(e)
            return "Não foi possível salvar ou atualizar"

    def excluir(self, id):
        try:
            local = Local.get_by_id(id)
            local.delete_instance()
            return "Artigo excluído com sucesso!"
        except Exception as e:
            print(e)
            return "Não foi possível excluir o Local!"
