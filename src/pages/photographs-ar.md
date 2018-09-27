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

{% include search.html %}

{% assign on_website = site.data.archive | where: 'on_website', 'yes' %}
{% assign ar_photos = on_website | where: 'language', 'ar' %}

<table class="photo-grid" style="margin-top:50px;">
  {% assign count = 0 %}
  <tr>
    {% for image in ar_photos %}
      {% assign third = count | modulo: 3 %}
      {% if third == 0 %}</tr><tr>{% endif %}
      <td>
        <a href="{{ site.baseurl }}/archive/ar/{{ image.pid | downcase }}.html">
          <img src="http://photos.uofk.edu/thumbnails/{{ image.pid }}-thumb.jpg" alt="{{ image.pid }}-thumb"/>
        </a>
      </td>
      {% assign count = count | plus: 1 %}
    {% endfor %}
  </tr>
</table>
