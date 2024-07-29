# flake8: noqa

# Preload some common modules for convenience.
import datetime
import os
import re
import sys
from pprint import pprint
from timeit import timeit

try:
    from colors import green
except ImportError:
    green = str


print('Imported the following items for your convenience: %s' % green('datetime, os, re, sys, pprint.pprint as pprint, timeit.timeit as timeit'))

q = quit
print('Aliased quit as %s' % green('q'))

# Automatically load Django stuff.
try:
    import django
except ImportError:
    pass
else:
    print('Imported %s' % green('django'))
    models = []
    for app in django.apps.apps.get_app_configs():
        for model in app.get_models():
            globals()[model.__name__] = model
            models.append(model.__name__)
    print('Imported the following Django models for this app: %s' % green(', '.join(sorted(models))))

    from django.conf import settings
    print('Imported Django settings as %s' % green('settings'))
