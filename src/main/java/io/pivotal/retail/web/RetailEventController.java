package io.pivotal.retail.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import io.pivotal.retail.dao.RetailEventRepository;
import io.pivotal.retail.domain.RetailEvent;
import io.pivotal.retail.util.JsonString;

@RestController
@RequestMapping("/retailEvent")
public class RetailEventController {
	
	private RetailEventRepository repo;
	private Logger logger = LoggerFactory.getLogger(RetailEventController.class);

	@Autowired
	public RetailEventController(RetailEventRepository repo) {
		this.repo = repo;
	}

    @RequestMapping(method = RequestMethod.PUT, value = "/event")
    void addJsonEvent(@RequestBody String jsonStr) throws Exception {
        JSONObject json = new JSONObject(jsonStr);
        RetailEvent event = new RetailEvent();
        event.setJson(jsonStr);
        Long id = json.getLong("id");
        event.setId(id);
        logger.info("addJsonEvent: key (tweet ID) = " + id);

        Date date;
        try {
            date = getTwitterDate(json.getString("created_at"));
        } catch (ParseException pe) {
            throw new RuntimeException(pe);
        }
        event.setCreatedAt(date);
        logger.info("addJsonEvent: created_at = " + date);

        String screenName = json.getJSONObject("user").getString("screen_name");
        event.setScreenName(screenName);
        String location = json.getJSONObject("user").getString("location");
        event.setLocation(location);
        Double sentiment = 0.0;
        if (json.has("sentiment")) {
        	sentiment = json.getJSONObject("sentiment").getDouble("score");
        }
        event.setSentiment(sentiment);
        logger.info("addJsonEvent: (screen_name = " + screenName + ", location = " + location + ", sentiment = " + sentiment + ")");

        // offer_text and top_term are only present if make_offer is true, but check anyhow
        Boolean makeOffer = false;
        if (json.has("make_offer")) {
        	json.getBoolean("make_offer");
        }
        event.setMakeOffer(makeOffer);
        String offerText = "";
        if (makeOffer && json.has("offer_text")) {
            offerText = json.getString("offer_text");
            event.setOfferText(offerText);
        }
        String topTerm = "";
        if (makeOffer && json.has("top_term")) {
            topTerm = json.getString("top_term");
            event.setTopTerm(topTerm);
        }
        repo.save(event);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{tweetId}")
    public String getEventFromTweetId(@PathVariable Long tweetId) {
        String jsonStr = null;
        Optional<RetailEvent> optEvent = repo.findById(tweetId);
        if (optEvent.isPresent()) {
        	jsonStr = optEvent.get().getJson();
        }
        return jsonStr;
    }

    @CrossOrigin()
    @RequestMapping(method = RequestMethod.GET, value = "/{screenName}/{topN}")
    public @ResponseBody List<JsonString> getMostRecentEvents(@PathVariable String screenName, @PathVariable int topN)
    {
        List<JsonString> rv = new ArrayList<>();
        for (RetailEvent evt : repo.findByScreenName(screenName, topN)) {
        	rv.add(new JsonString(evt.getJson()));
        }
        return rv;
    }
    
    @RequestMapping(method = RequestMethod.DELETE, value = "/{tweetId}")
    public void deleteByTweetId(@PathVariable Long tweetId) {
        repo.deleteById(tweetId);
    }

	private final static String TWITTER_DATE = "EEE MMM dd HH:mm:ss ZZZZZ yyyy";
	private static Date getTwitterDate(String date) throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat(TWITTER_DATE);
		sf.setLenient(true);
		return sf.parse(date);
	}
}
