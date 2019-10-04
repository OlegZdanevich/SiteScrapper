import requests
from bs4 import BeautifulSoup


def get_urls_from_afisha(base_url):
    response = requests.get(base_url)
    soup = BeautifulSoup(response.text, 'html.parser')
    films = soup.findAll('li', {'class': 'lists__li'})
    return set(filter(None, map(lambda x: get_urls_function(x, 'name'), films)))


def get_urls_function(x, class_name):
    href_list = x.findAll('a', {'class': class_name})
    if len(href_list) != 0:
        current_url = href_list[0]['href']
        if current_url.find("https://afisha.tut.by/film") != -1:
            return href_list[0]['href']


def get_urls_from_online_cinema(base_url):
    return get_urls_from_online_cinema_page(base_url, set())


def get_urls_from_online_cinema_page(url, result_data):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    films = soup.findAll('li', {'class': 'lists__li'})
    urls = set(filter(None, map(lambda x: get_urls_function(x, 'media'), films)))
    result_data = result_data.union(urls)
    print(len(result_data))
    next_button = soup.find('li', {'class', 'p-next'}).find('a')
    if next_button is not None:
        next_url = next_button['href']
        return get_urls_from_online_cinema_page(next_url, result_data)
    else:
        return result_data


def get_urls_from_afisha_and_online_cinema(base_url_afisha, base_url_online_films):
    online = get_urls_from_online_cinema(base_url_online_films)
    afisha = get_urls_from_afisha(base_url_afisha)
    return afisha.union(online)
