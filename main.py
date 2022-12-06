from kivymd.app import MDApp

from view.python.manager import ScreenManagement

from view.python.main import MainScreen
from view.python.atividade import AtividadeScreen
from view.python.local import LocalScreen
from view.python.localatividade import LocalAtividadeScreen

class CBBD(MDApp):

    def __init__(self):

        super().__init__()
        self.manager = ScreenManagement()

    def build(self):

        main = MainScreen(name="main")

        self.manager.add_widget(main)
        self.manager.main()
        atividade = AtividadeScreen(name="atividade")
        local = LocalScreen(name="local")
        localatividade = LocalAtividadeScreen(name="localatividade")

        self.manager.add_widget(main)
        self.manager.add_widget(atividade)
        self.manager.add_widget(local)
        self.manager.add_widget(localatividade)

        self.manager.main()

        return self.manager


if __name__ == '__main__':
    CBBD().run()
