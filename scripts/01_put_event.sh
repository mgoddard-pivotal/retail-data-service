#!/bin/bash


curl -H 'Content-Type: application/json' -X PUT -d \
  '{"possibly_sensitive": false, "in_stock": true, "retweeted": false, "in_reply_to_user_id": null, "date_time": "05/26/17 01:16:56", "offer_id": "f76b4931-5f77-443d-adbf-347fbd886473", "make_offer": true, "is_quote_status": false, "created_at": "Fri May 26 01:16:45 +0000 2017", "in_reply_to_status_id": null, "top_term": "dress", "in_reply_to_screen_name": null, "id_str": "867912355610583041", "id": 867912355610583041, "source": "twitter", "lang": "en", "truncated": false, "relevant_labels": ["dress", "clothing", "day dress", "red", "sleeve", "bridal party dress", "pink", "cocktail dress", "gown", "peach"], "offer_text": "Hey, @miapisjef. We have some hot new dresses here: https://goo.gl/maps/mDzTzVkWah82  Use code #stylish for 30% off in store today!", "coordinates": null, "offer_items": [{"url": "https://storage.googleapis.com/retail-image/172766-149-Hobbs_Red_Wren_Dress.jpg", "desc": "Hobbs Red Wren Dress"}, {"url": "https://storage.googleapis.com/retail-image/L56138-60-Jessica_Wright_Ruched_Long_Sleeve_Bodycon_Dress.jpg", "desc": "Jessica Wright Ruched Long Sleeve Bodycon Dress"}, {"url": "https://storage.googleapis.com/retail-image/L52811-85-BCBGeneration_A_line_Dress.jpg", "desc": "BCBGeneration A line Dress"}, {"url": "https://storage.googleapis.com/retail-image/155583-130-Hobbs_Emerald_Cassie_Dress.jpg", "desc": "Hobbs Emerald Cassie Dress"}], "favorite_count": 0, "sentiment": {"score": 0.4, "magnitude": 1.3}, "entities": {"user_mentions": [], "hashtags": [], "urls": [], "symbols": [], "media": [{"type": "photo", "sizes": {"small": {"w": 311, "resize": "fit", "h": 466}, "medium": {"w": 311, "resize": "fit", "h": 466}, "large": {"w": 311, "resize": "fit", "h": 466}, "thumb": {"w": 150, "resize": "crop", "h": 150}}, "display_url": "pic.twitter.com/WUPtNukjH0", "media_url_https": "https://pbs.twimg.com/media/DAtxr2nXcAAchJa.jpg", "indices": [45, 68], "id_str": "867912351407894528", "url": "https://t.co/WUPtNukjH0", "expanded_url": "https://twitter.com/miapisjef/status/867912355610583041/photo/1", "id": 867912351407894528, "vision_labels": ["dress", "clothing", "day dress", "red", "sleeve", "bridal party dress", "pink", "cocktail dress", "gown", "peach"], "media_url": "http://pbs.twimg.com/media/DAtxr2nXcAAchJa.jpg"}]}, "contributors": null, "favorited": false, "retweet_count": 0, "user": {"default_profile": true, "geo_enabled": false, "profile_background_tile": false, "profile_image_url_https": "https://pbs.twimg.com/profile_images/865318436036952064/Z0KI4e96_normal.jpg", "following": false, "profile_sidebar_fill_color": "DDEEF6", "follow_request_sent": false, "has_extended_profile": true, "created_at": "Tue Mar 14 15:55:28 +0000 2017", "profile_background_color": "F5F8FA", "time_zone": null, "id_str": "841679179854798848", "id": 841679179854798848, "description": "I love travel, food, and fashion", "translator_type": "none", "profile_use_background_image": true, "verified": false, "lang": "en", "screen_name": "miapisjef", "utc_offset": null, "contributors_enabled": false, "url": null, "notifications": false, "profile_text_color": "333333", "name": "Mia Pisjef", "protected": false, "profile_background_image_url": null, "profile_sidebar_border_color": "C0DEED", "profile_link_color": "1DA1F2", "is_translation_enabled": false, "favourites_count": 0, "profile_background_image_url_https": null, "default_profile_image": false, "statuses_count": 139, "location": "San Francisco, CA", "listed_count": 0, "followers_count": 2, "profile_image_url": "http://pbs.twimg.com/profile_images/865318436036952064/Z0KI4e96_normal.jpg", "friends_count": 50, "is_translator": false, "entities": {"description": {"urls": []}}}, "extended_entities": {"media": [{"type": "photo", "sizes": {"small": {"w": 311, "resize": "fit", "h": 466}, "medium": {"w": 311, "resize": "fit", "h": 466}, "large": {"w": 311, "resize": "fit", "h": 466}, "thumb": {"w": 150, "resize": "crop", "h": 150}}, "display_url": "pic.twitter.com/WUPtNukjH0", "media_url_https": "https://pbs.twimg.com/media/DAtxr2nXcAAchJa.jpg", "indices": [45, 68], "id_str": "867912351407894528", "url": "https://t.co/WUPtNukjH0", "expanded_url": "https://twitter.com/miapisjef/status/867912355610583041/photo/1", "id": 867912351407894528, "media_url": "http://pbs.twimg.com/media/DAtxr2nXcAAchJa.jpg"}]}, "place": null, "geo": null, "text": "OMG!  I will own this dress.  Love the red \u2764 https://t.co/WUPtNukjH0", "in_reply_to_user_id_str": null, "in_reply_to_status_id_str": null}' \
  http://localhost:8080/retailEvent/event
