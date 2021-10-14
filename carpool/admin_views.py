from django.views.generic import TemplateView


class Admin_View(TemplateView):
    template_name = 'admin/admin_index.html'