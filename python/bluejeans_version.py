"""
The modile is exclusively for checking Bluejeans version.

Sample output:
==============
In [45]: check_bluejeans_version('Linux')
Out[45]: 
{'content_length': 48011996,
 'file': 'bluejeans-1.32.7.x86_64.rpm',
 'url': 'https://swdl.bluejeans.com/desktop/linux/1.32/1.32.7/bluejeans-1.32.7.x86_64.rpm'}

In [46]: check_bluejeans_version('Windows')
Out[46]: 
{'content_length': 230336,
 'file': 'BlueJeansLauncher_live_71.exe',
 'url': 'https://swdl.bluejeans.com/desktop/win/launchers/BlueJeansLauncher_live_71.exe'}

In [47]: check_bluejeans_version('Linux')
Out[47]: 
{'content_length': 48011996,
 'file': 'bluejeans-1.32.7.x86_64.rpm',
 'url': 'https://swdl.bluejeans.com/desktop/linux/1.32/1.32.7/bluejeans-1.32.7.x86_64.rpm'}
"""
import re
import requests


url = 'https://www.bluejeans.com/downloads'

def check_bluejeans_version(platform='Linux'):
    """Search for the version of Bluejeans installer for different platforms.

    We are looking for the following records:

        var downloadUrls = {
            'Windows': 'https://swdl.bluejeans.com/desktop/win/launchers/BlueJeansLauncher_live_71.exe',
            'MacOS': 'https://swdl.bluejeans.com/desktop/mac/launchers/BlueJeansLauncher_live_168.dmg',
            'Linux': 'https://swdl.bluejeans.com/desktop/linux/1.32/1.32.7/bluejeans-1.32.7.x86_64.rpm'
        }

    """
    available_platforms = ['Windows', 'MacOS', 'Linux']
    assert platform in available_platforms, \
        'Platform "{}" is not found. It must be one of {}'.format(platform, available_platforms)

    r = requests.get(url)

    if r.status_code != 200:
        raise ValueError('URL {} cannot be accessed. Return code: {}'.format(url, r.status_code))

    search = "'{}':".format(platform)

    bj_url = None
    bj_file = None
    for row in r.text.split('\n'):
        if re.search(search, row):
            bj_url = row.split(search)[1].strip().replace("'", "").replace(',', '')
            break

    if bj_url_file:
        bj_file = bj_url.split('/')[-1]

    content_length = check_content_length(bj_url)
    return {
        'url': bj_url,
        'file': bj_file,
        'content_length': content_length,
    }


def check_content_length(url):
    h = requests.head(url)
    if h.status_code != 200:
        raise ValueError('URL {} cannot be accessed. Return code: {}'.format(url, h.status_code))
        
    content_length = int(h.headers['Content-Length'])
    return content_length

