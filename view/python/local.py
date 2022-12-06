from kivy.lang import Builder
from kivy.uix.screenmanager import Screen


class LocalScreen(Screen):
    Builder.load_file("view/source/local.kv")