# Preload some common modules for convenience.
from pprint import pprint
import re

# Automatically load Django stuff.
try:
    import django
except ImportError:
    pass
else:
    for app in django.apps.apps.get_app_configs():
        for model in app.get_models():
            globals()[model.__name__] = model
    from django.conf import settings
