" Python language settings

" Load the virtualenv if we are in one.
py << EOF
import os
import sys

if 'VIRTUAL_ENV' in os.environ:
  base = os.environ['VIRTUAL_ENV']

  # This is pilfered from virtualenv's `activate_this.py` script. Instead of
  # just calling that for the current virtualenv, we reproduce it here so that
  # we can also support virtuale environment created with pyvenv (Python 3+).
  old_os_path = os.environ.get('PATH', '')
  os.environ['PATH'] = os.path.join(base, 'bin') + os.pathsep + old_os_path
  if sys.platform == 'win32':
    site_packages = os.path.join(base, 'Lib', 'site-packages')
  else:
    site_packages = os.path.join(base, 'lib', 'python%s' % sys.version[:3], 'site-packages')
  prev_sys_path = list(sys.path)
  import site
  site.addsitedir(site_packages)
  sys.real_prefix = sys.prefix
  sys.prefix = base
  new_sys_path = []
  for item in list(sys.path):
    if item not in prev_sys_path:
      new_sys_path.append(item)
      sys.path.remove(item)
  sys.path[:0] = new_sys_path
EOF
