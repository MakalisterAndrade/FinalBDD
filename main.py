from kivymd.app import MDApp

from view.python.manager import ScreenManagement

from view.python.main import MainScreen


class Evento(MDApp):

    def __init__(self):

        super().__init__()
        self.manager = ScreenManagement()

    def build(self):

        main = MainScreen(name="main")

        self.manager.add_widget(main)
        self.manager.main()

        return self.manager


if __name__ == '__main__':
    Evento().run()