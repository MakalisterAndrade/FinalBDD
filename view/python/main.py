from kivy.lang import Builder
from kivy.uix.screenmanager import Screen
from kivymd.uix.floatlayout import MDFloatLayout
from kivymd.uix.tab import MDTabsBase


class Tab(MDFloatLayout, MDTabsBase):
    pass


class MainScreen(Screen):

    def __init__(self, **kw):
        self.data = {
            'Atividade': ["account", "on_press", self.atividade],
            'Local': ["book-open-page-variant-outline", "on_press", self.local]
        }
        Builder.load_file("view/source/main.kv")
        super().__init__(**kw)

    def on_enter(self):
        print(self.manager.get_screen("main").ids)
