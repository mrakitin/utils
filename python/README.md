```py
In [1]: %run -i bluejeans_version.py

In [2]: check_bluejeans_version()
Out[2]: 
{'content_length': 48011996,
 'file': 'bluejeans-1.32.7.x86_64.rpm',
 'url': 'https://swdl.bluejeans.com/desktop/linux/1.32/1.32.7/bluejeans-1.32.7.x86_64.rpm'}

In [3]: check_bluejeans_version('Linux')
Out[3]: 
{'content_length': 48011996,
 'file': 'bluejeans-1.32.7.x86_64.rpm',
 'url': 'https://swdl.bluejeans.com/desktop/linux/1.32/1.32.7/bluejeans-1.32.7.x86_64.rpm'}

In [4]: check_bluejeans_version('MacOS')
Out[4]: 
{'content_length': 328329,
 'file': 'BlueJeansLauncher_live_168.dmg',
 'url': 'https://swdl.bluejeans.com/desktop/mac/launchers/BlueJeansLauncher_live_168.dmg'}

In [5]: check_bluejeans_version('Windows')
Out[5]: 
{'content_length': 230336,
 'file': 'BlueJeansLauncher_live_71.exe',
 'url': 'https://swdl.bluejeans.com/desktop/win/launchers/BlueJeansLauncher_live_71.exe'}

In [6]: check_bluejeans_version('Solaris')
---------------------------------------------------------------------------
AssertionError                            Traceback (most recent call last)
~/src/mrakitin/utils/python/bluejeans_version.py in <module>()
----> 1 check_bluejeans_version('Solaris')

~/src/mrakitin/utils/python/bluejeans_version.py in check_bluejeans_version(platform)
     50     available_platforms = ['Windows', 'MacOS', 'Linux']
     51     assert platform in available_platforms, \
---> 52         'Platform "{}" is not found. It must be one of {}'.format(platform, available_platforms)
     53 
     54     r = requests.get(url)

AssertionError: Platform "Solaris" is not found. It must be one of ['Windows', 'MacOS', 'Linux']

In [7]: 
```
