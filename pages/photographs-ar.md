---
layout: page
title: "الصور"
permalink: /ar/photos.html
language: ar
pid: photos
order: 6
menu: true
---
الصور المعروضة في الموقع  هي جزء من المجموعة  الموجودة بأرشيف قسم التاريخ بكلية الأداب بجامعة الخرطوم، وقد تم اختيار هذه الصور لتعبر عن مختلف الاحداث التاريخية ،حيث تتضمن في البدء صور عن بدايات جامعة الخرطوم في فترة ما بعد الاستقلال  ثم نشاطات بعض الطرق الصوفية  وبعض ابرز الشخصيات السياسية والفنانين والرياضيين بالاضافة لعدد من الصور عن حياة السودانيين اليومية في الفترة 1950-1960  لتعكس مدي تطور وتنوع .الحياة في المجتمع السوداني  في بدايات استقلال السودان

{% assign on_website = site.data.photos-en | where: 'on_website', 'yes' %}
## Where on_website = yes : {{ on_website.size }}

<table class="photo-grid" style="margin-top:50px;">
  {% assign count = 0 %}
  <tr>
    {% for image in on_website %}
      {% assign third = count | modulo: 3 %}
      {% if third == 0 %}</tr><tr>{% endif %}
      <td>
        <a href="{{ site.baseurl }}/photopages/ar/{{ image.pid }}.html">
          <img src="http://sudanphoto.uofk.edu/thumbnails/{{ image.pid }}-thumb.jpg" alt="{{ image.pid }}-thumb"/>
        </a>
      </td>
      {% assign count = count | plus: 1 %}
    {% endfor %}
  </tr>
</table>

{% assign on_server = site.data.photos-en | where: 'on_server', 'yes' %}
## Where on_server = yes : {{ on_server.size }}

<table class="photo-grid" style="margin-top:50px;">
  {% assign count = 0 %}
  <tr>
    {% for image in on_server %}
      {% assign third = count | modulo: 3 %}
      {% if third == 0 %}</tr><tr>{% endif %}
      <td>
        <a href="{{ site.baseurl }}/photopages/ar/{{ image.pid }}.html">
          <img src="http://sudanphoto.uofk.edu/thumbnails/{{ image.pid }}-thumb.jpg" alt="{{ image.pid }}-thumb"/>
        </a>
      </td>
      {% assign count = count | plus: 1 %}
    {% endfor %}
  </tr>
</table>


{% assign meta_only = site.data.photos-en | where: 'on_server', 'no' %}
## Metadata only: {{ meta_only.size }}

{% for image in meta_only %}<a href="{{ site.baseurl }}/photopages/en/{{ image.pid }}.html">{{ image.pid }}</a>{% unless forloop.last %}, {% endunless %}{% endfor %}
