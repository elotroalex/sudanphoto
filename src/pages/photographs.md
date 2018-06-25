---
layout: page
title: "Photographs"
permalink: /en/photos.html
language: en
pid: photos
order: 6
menu: true
---
The photographs below all come from archive collections that can be viewed in full in the offices of Khartoum University’s History Department, Faculty of Arts. They have been selected because they show different aspects of Sudanese history, including the beginnings of Khartoum University, activities of Sufi orders, prominent politicians, musicians, athletes, and daily life from the 1950s and 60s. In the process, they illustrate the diversity of Sudanese life in the period of early independence.

{% include search.html %}

{% assign on_website = site.data.archive-en | where: 'on_website', 'yes' %}
<table class="photo-grid" style="margin-top:50px;">
  {% assign count = 0 %}
  <tr>
    {% for image in on_website %}
      {% assign third = count | modulo: 3 %}
      {% if third == 0 %}</tr><tr>{% endif %}
      <td>
        <a href="{{ site.baseurl }}/archive/en/{{ image.pid | downcase }}.html">
          <img src="http://photos.uofk.edu/thumbnails/{{ image.pid }}-thumb.jpg" alt="{{ image.pid }}-thumb"/>
        </a>
      </td>
      {% assign count = count | plus: 1 %}
    {% endfor %}
  </tr>
</table>
