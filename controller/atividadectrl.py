from kivy.uix.button import Button
from kivy.uix.label import Label
from peewee import ModelSelect

from model.models import Atividade

class AtividadeCtrl:
    _lista = []

    def salvar_atualizar_atividade(self, horario, id=None):
        try:
            if id:
                atividade = Atividade.get_by_id(id)
                atividade.horario = horario
            else:
                atividade = Atividade(horario = horario)
            atividade.save()
            return "Operação realizada com sucesso!!!"
        except Exception as e:
            print(e)
            return "Não foi possível salvar ou atualizar!!!"

    def excluir_atividade(self, id):
        try:
            Atividade.delete_by_id(id)
            return "Atividade excluída com sucesso!!!"
        except Exception as e:
            print(e)
            return "Não foi possível excluir a atividade!!!"

    def buscar_por_id(self, id):
        self._lista = []
        try:
            atividade = Atividade.get_by_id(id)
            self._lista.append(self._montar_atividade(atividade.id, atividade.horario))
            return self._lista
        except Exception as e:
            return None


    def buscar_todas(self):
        try:
            atv = Atividade.select()
            # self._lista = []
            for a in atv:
                self._lista.append(self._montar_atividade(a.id, a.horario))
            return self._lista
        except Exception as e:
            return None

    def _montar_atividade(self, id, horario):
        minhaatividade = {
            'lblAtvId': self._criarLabel(id, 0.2),
            'lblHora': self._criarLabel(horario, 0.2),
            'btAtualizar': self._criarBotao("Atualizar"),
            'btExcluir': self._criarBotao("Excluir")
        }
        return minhaatividade

    def _criarLabel(self, texto, tam):
        label = Label()
        label.text = str(texto)
        label.size_hint_y = None
        label.size_hint_x = tam
        label.height = '30dp'
        return label

    def _criarBotao(self, texto):
        botao = Button(text=texto,
                       font_size='10sp',
                       size_hint_y = None,
                       height='30dp',
                       size_hint_x = .1)
        return botao