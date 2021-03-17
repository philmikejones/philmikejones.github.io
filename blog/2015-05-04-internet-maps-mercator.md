
# Why do internet maps use Mercator?

date: 2015-05-04

I've often wondered why Google, as well as other internet map providers, use the [Mercator projection](http://en.wikipedia.org/wiki/Mercator_projection). It was originally designed for nautical navigation by keeping lines of latitude perpendicular to lines of longitude. The [cost was that land areas were distorted](http://en.wikipedia.org/wiki/Mercator_projection#Uses), and the distortion increases nearer the poles, making countries in very low or very high latitudes look bigger than they really are. Using the Mercator projection, Greenland looks bigger than Australia for example, but in fact Australia is about three times the area of Greenland.

The [answer given by John H, a Google employee](https://productforums.google.com/d/msg/maps/A2ygEJ5eG-o/KbZr_B0h2hkJ), is:

> [Google] Maps uses Mercator because it preserves angles. The first launch of Maps actually did not use Mercator, and streets in high latitude places like Stockholm did not meet at right angles on the map the way they do in reality. While this distorts a &#8216;zoomed-out view' of the map, it allows close-ups (street level) to appear more like reality. The majority of our users are looking down at the street level for businesses, directions, etc&#8230; so we're sticking with this projection for now. In the meantime, you might want to look at our favorite 3D view of the world.

For more information on this problem, its implications, and the reasons Google use Mercator, see <span class="feed_item_answer_user">Anders Kaseorg<span class="IdentitySig ActorNameSig IdentityNameSig">&#8216;s answer to &#8216;</span></span><span id="__w2_sAjNSqz_question_text"><a href="http://www.quora.com/Why-does-Google-use-the-Mercator-projection-on-their-maps-as-opposed-to-an-equal-area-proportion-map">Why does Google use the Mercator projection on their maps, as opposed to an equal-area proportion map?</a>&#8216; His answer also references <a href="https://productforums.google.com/d/msg/maps/A2ygEJ5eG-o/KbZr_B0h2hkJ">Joel H's answer</a> (above) to its original question,  &#8216;<a href="https://productforums.google.com/forum/#!topic/maps/A2ygEJ5eG-o"><span id="t-t" class="G3J0AAD-mb-X">Why does Google maps use the inaccurate, ancient and distorted Mercator Projection?</span></a><span id="t-t" class="G3J0AAD-mb-X">&#8216;</span><span id="t-t" class="G3J0AAD-mb-X"><br /> </span></span>

So now I know why Mercator is used, I wanted to test projections to see how much difference it makes. I've chosen Reykjavik, Iceland, as it is the northernmost (i.e. highest latitude) capital city in the world, so it will accentuate any differences in projection. I also loved visiting Reykjavik, so it's nice to remind myself of my holiday there!

<div class="googlemaps">
</div>

To explore this, I downloaded administrative boundary data of Iceland (country outline, regions) from [DIVA-GIS](http://diva-gis.org/Data) and roads from [geofabrik](http://download.geofabrik.de/europe/iceland.html). I separated out the capital region then clipped the roads for just this region, leaving the following map (in EPSG:3857 Pseudo Mercator):<figure id="attachment_1659" class="thumbnail wp-caption alignnone" style="width: 644px">

<img class="size-large wp-image-1659" src="https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/reykjavik-1024x760.png?fit=634%2C470" alt="Reykjavik region with roads" srcset="https://i1.wp.com/philmikejones.me/wp-content/uploads/20../_static/reykjavik.png?w=1178 1178w, https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/reykjavik.png?resize=300%2C223 300w, https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/reykjavik.png?resize=768%2C570 768w, https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/reykjavik.png?resize=1024%2C760 1024w, https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/reykjavik.png?resize=660%2C490 660w" sizes="(max-width: 634px) 100vw, 634px" data-recalc-dims="1" /><figcaption class="caption wp-caption-text">Reykjavik in EPSG:3857 (Pseudo Mercator) with roads</figcaption></figure> 

So let's take a look at some simple directions from the Hallgrimskirkja (for the awesome views) back in to town, making sure we take a couple of turns:

<div class="googlemaps">
</div>

And the same directions in QGIS using the Psuedo Mercator projection:


[<img class="size-large wp-image-1667" src="https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-pseudo-mercator-1024x670.png?fit=634%2C415" alt="Directions in Reykjavik" srcset="https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-pseudo-mercator.png?w=1336 1336w, https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-pseudo-mercator.png?resize=300%2C196 300w, https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-pseudo-mercator.png?resize=768%2C502 768w, https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-pseudo-mercator.png?resize=1024%2C670 1024w, https://i1.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-pseudo-mercator.png?resize=660%2C432 660w" sizes="(max-width: 634px) 100vw, 634px" data-recalc-dims="1" />](https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-pseudo-mercator.png)<figcaption class="caption wp-caption-text">Directions from Hallgrimskirkja to Lækjargata, Reykjavik, in Pseudo Mercator (internet maps) projection</figcaption></figure> 

And finally, the resultant directions when transformed to the WGS84 datum without projection:<figure id="attachment_1668" class="thumbnail wp-caption alignnone" style="width: 644px">

[<img class="size-large wp-image-1668" src="https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-no-projection.png?resize=634%2C415" alt="Directions without projection" data-recalc-dims="1" />](https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-no-projection.png)<figcaption class="caption wp-caption-text">Same directions without projection</figcaption></figure> 

The result is almost an [isometric projection](http://en.wikipedia.org/wiki/Isometric_projection) of the equivalent Google Map, and changes the angle of the left turn at the right-most point on the map from approximately 90<span class="_Tgc"><b>°</b></span> to 56<span class="_Tgc"><b>°</b></span>. Clearly the unprojected map is inferior for local directions compared to the map projected in Pseudo Mercator, and at high latitudes it makes a noticeable difference.