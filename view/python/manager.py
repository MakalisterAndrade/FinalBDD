from kivy.uix.screenmanager import ScreenManager, SlideTransition


class ScreenManagement(ScreenManager):

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

    def main(self):
        self.current = "main"


    def back(self):
        self.transition = SlideTransition(direction="right")
        self.main()
        self.transition = SlideTransition(direction="left")