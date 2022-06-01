# Preload some common modules for convenience.
from pprint import pprint

# Automatically load Django models.
try:
    import django
except ImportError:
    pass
else:
    for app in django.apps.apps.get_app_configs():
        for model in app.get_models():
            globals()[model.__name__] = model
