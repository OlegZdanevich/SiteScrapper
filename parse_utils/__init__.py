def get_film_name(parsed_film_page):
    return parsed_film_page.findAll('h1', {'class': 'title'})[0].getText().rstrip()


def is_premiere(parsed_film_page):
    label = parsed_film_page.find('div', {'class': 'title__labels'}).findAll('span', {'class': 'label'})
    for val in label:
        if val.getText() == "Премьера":
            return True
    return False


def get_film_age_rank(parsed_film_page):
    label = parsed_film_page.find('div', {'class': 'title__labels'}).findAll('span', {'class': 'label'})
    for val in label:
        if val.getText().find("+") != -1:
            return val.getText()
    return "none"


def get_native_film_name(parsed_film_page):
    label = parsed_film_page.find('div', {'class': 'sub_title'})
    if label is not None:
        return label.getText()
    return "none"


def get_poster_url(parsed_film_page):
    return parsed_film_page.find('img', {'class': 'main_image'})["src"]


def get_genre(parsed_film_page):
    genres = parsed_film_page.findAll('a', {'itemprop': 'genre'})
    genres_dict = {}
    for genre in genres:
        genres_dict[genre.getText()] = {"name": genre.getText(), "url": genre["href"]}
    return genres_dict


def get_set_values(text):
    return set(text.split(", "))


def get_table_field_set(parsed_film_page, field_name):
    td = parsed_film_page.find('td', {'class': field_name})
    if td is not None:
        text = td.getText()
        return get_set_values(text)
    return set()


def get_table_field_single(parsed_film_page, field_name):
    td = parsed_film_page.find('td', {'class': field_name})
    if td is not None:
        return td.getText()
    return "none"


def get_table_field_single_with_url(parsed_film_page, field_name):
    td = parsed_film_page.find('td', {'class': field_name})
    if td is not None:
        a_tag = td.find('a')
        if a_tag is not None:
            return {"data": a_tag.getText(), "url": a_tag["href"]}
        return {"data": td.getText(), "url": "none"}
    return {"data": "none", "url": "none"}


def get_year_of_film(parsed_film_page):
    return get_table_field_single_with_url(parsed_film_page, 'year')


def get_duration(parsed_film_page):
    return get_table_field_single(parsed_film_page, 'duration')


def get_country(parsed_film_page):
    return get_table_field_set(parsed_film_page, 'author')


def get_showing_end_date(parsed_film_page):
    end_date = get_table_field_single(parsed_film_page, 'date')
    if end_date != "none":
        return end_date.split("В прокате до ")[1]
    return end_date


def get_afisha_rating(parsed_film_page):
    rating = parsed_film_page.find('span', {'class': 'rating-big__value'})
    if rating is not None:
        return rating.getText()
    return "none"


def get_not_afisha_rating(parsed_film_page, label):
    rating_tag = parsed_film_page.find('td', {'class': 'IMDb'})
    if rating_tag is not None:
        ratings = rating_tag.findAll("b")
        for rating in ratings:
            sibling = rating.findPreviousSibling('p')
            if sibling.getText() == label:
                return rating.getText()
    return "none"


def get_imdb_rating(parsed_film_page):
    return get_not_afisha_rating(parsed_film_page, 'Рейтинг IMDb')


def get_kinopoisk_rating(parsed_film_page):
    return get_not_afisha_rating(parsed_film_page, 'Кинопоиск')


def get_ratings(parsed_film_page):
    return {"afisha": get_afisha_rating(parsed_film_page), "imdb": get_imdb_rating(parsed_film_page),
            "kinopoisk": get_afisha_rating(parsed_film_page)}


def persons_from_string(p_tag, selector_text):
    persons = {}
    a_tags = p_tag.findAll('a')
    for a_tag in a_tags:
        name = a_tag.getText()
        persons[name] = {"name": name, "additional_information": a_tag['href']}
        a_tag.extract()
    names = filter(lambda x: x != "", p_tag.getText().split(selector_text + " ")[1].split(", "))
    for name in names:
        persons[name] = {"name": name, "additional_information": "none"}
    return persons


def get_director(parsed_film_page):
    previous_sibling = parsed_film_page.find('table', {'class': 'movie_info'})
    p_tag = previous_sibling.findNextSibling('p')
    if p_tag is not None:
        if p_tag.getText().find("Режиссер:") != -1:
            return persons_from_string(p_tag, "Режиссер:")
    return {}


def get_actors(parsed_film_page):
    previous_sibling = parsed_film_page.find('table', {'class': 'movie_info'})
    p_tags = previous_sibling.findNextSiblings('p', limit=2)
    for p_tag in p_tags:
        if p_tag is not None:
            if p_tag.getText().find("В ролях:") != -1:
                return persons_from_string(p_tag, "В ролях:")
    return {}


def get_description(parsed_film_page):
    description_div = parsed_film_page.find('div', {'itemprop': 'description'})
    if description_div is not None:
        siblings = description_div.findAll()
        for sibling in siblings:
            sibling.extract()
        return description_div.getText().replace("\n", "").replace("\t", "").strip()
    return "none"


def get_film_videos(parsed_film_page):
    media_div = parsed_film_page.find('div', {'id': 'event-photos'})
    if media_div is not None:
        result = set()
        video_frames = media_div.findAll('a', {'data-action': 'iframe'})
        for video_frame in video_frames:
            result.add(video_frame["href"])
        return result
    return set()


def get_film_images(parsed_film_page):
    media_div = parsed_film_page.find('div', {'id': 'event-photos'})
    if media_div is not None:
        result = set()
        video_frames = media_div.findAll('img')
        for video_frame in video_frames:
            result.add(video_frame["src"])
        return result
    return set()
