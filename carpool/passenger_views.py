from django.views.generic import TemplateView


class Passenger_Index(TemplateView):
    template_name = 'passenger/passenger_index_publishride.html'