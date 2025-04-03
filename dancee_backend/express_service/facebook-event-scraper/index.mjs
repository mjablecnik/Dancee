var __async = (__this, __arguments, generator) => {
  return new Promise((resolve, reject) => {
    var fulfilled = (value) => {
      try {
        step(generator.next(value));
      } catch (e) {
        reject(e);
      }
    };
    var rejected = (value) => {
      try {
        step(generator.throw(value));
      } catch (e) {
        reject(e);
      }
    };
    var step = (x) => x.done ? resolve(x.value) : Promise.resolve(x.value).then(fulfilled, rejected);
    step((generator = generator.apply(__this, __arguments)).next());
  });
};

// src/enums.ts
var EventType = /* @__PURE__ */ ((EventType2) => {
  EventType2[EventType2["Upcoming"] = 0] = "Upcoming";
  EventType2[EventType2["Past"] = 1] = "Past";
  return EventType2;
})(EventType || {});

// src/utils/url.ts
var fbidToUrl = (fbid) => {
  if (!fbid.match(/^[0-9]{8,}$/)) {
    throw new Error("Invalid FB ID");
  }
  return `https://www.facebook.com/events/${fbid}?_fb_noscript=1`;
};
var validateAndFormatUrl = (url) => {
  var _a;
  const fbid = (_a = url.match(
    /facebook\.com\/events\/(?:.+\/.+\/)?([0-9]{8,})/
  )) == null ? void 0 : _a[1];
  if (!fbid) {
    throw new Error("Invalid Facebook event URL");
  }
  return `https://www.facebook.com/events/${fbid}?_fb_noscript=1`;
};
var validateAndFormatEventPageUrl = (url, type) => {
  const regex = /facebook\.com\/[a-zA-Z0-9]+(?:\/(past_hosted_events|upcoming_hosted_events|events))?$/;
  const result = regex.test(url);
  if (!result) {
    throw new Error("Invalid Facebook page event URL");
  }
  const types = /(past_hosted_events|upcoming_hosted_events|events)$/;
  if (!types.test(url)) {
    if (type === 1 /* Past */) {
      url += "/past_hosted_events";
    } else if (type === 0 /* Upcoming */) {
      url += "/upcoming_hosted_events";
    } else {
      url += "/events";
    }
  } else if (type === 1 /* Past */) {
    url = url.replace(types, "past_hosted_events");
  } else if (type === 0 /* Upcoming */) {
    url = url.replace(types, "upcoming_hosted_events");
  }
  return `${url}?_fb_noscript=1`;
};
var validateAndFormatEventProfileUrl = (url, type) => {
  const regex = /facebook\.com\/profile\.php\?id=\d+(&sk=(events|past_hosted_events|upcoming_hosted_events))?$/;
  const result = regex.test(url);
  if (!result) {
    throw new Error("Invalid Facebook profile event URL");
  }
  const types = /(past_hosted_events|upcoming_hosted_events|events)$/;
  if (!types.test(url)) {
    if (type === 1 /* Past */) {
      url += "&sk=past_hosted_events";
    } else if (type === 0 /* Upcoming */) {
      url += "&sk=upcoming_hosted_events";
    } else {
      url += "&sk=events";
    }
  } else if (type === 1 /* Past */) {
    url = url.replace(types, "past_hosted_events");
  } else if (type === 0 /* Upcoming */) {
    url = url.replace(types, "upcoming_hosted_events");
  }
  return url;
};
var validateAndFormatEventGroupUrl = (url) => {
  const regex = /facebook\.com\/groups\/\d+(?:\/events$)?/;
  const result = regex.test(url);
  if (!result) {
    throw new Error("Invalid Facebook group event URL");
  }
  if (!url.match("/events")) {
    url += "/events";
  }
  return `${url}?_fb_noscript=1`;
};

// src/utils/json.ts
var findJsonInString = (dataString, key, isDesiredValue) => {
  const prefix = `"${key}":`;
  let startPosition = 0;
  while (true) {
    let idx = dataString.indexOf(prefix, startPosition);
    if (idx === -1) {
      return { startIndex: -1, endIndex: -1, jsonData: null };
    }
    idx += prefix.length;
    const startIndex = idx;
    const startCharacter = dataString[startIndex];
    if (startCharacter === "n" && dataString.slice(startIndex, startIndex + 4) === "null") {
      return { startIndex, endIndex: startIndex + 3, jsonData: null };
    }
    if (startCharacter !== "{" && startCharacter !== "[") {
      throw new Error(`Invalid start character: ${startCharacter}`);
    }
    const endCharacter = startCharacter === "{" ? "}" : "]";
    let nestedLevel = 0;
    let isIndexInString = false;
    while (idx < dataString.length - 1) {
      idx++;
      if (dataString[idx] === '"' && dataString[idx - 1] !== "\\") {
        isIndexInString = !isIndexInString;
      } else if (dataString[idx] === endCharacter && !isIndexInString) {
        if (nestedLevel === 0) {
          break;
        }
        nestedLevel--;
      } else if (dataString[idx] === startCharacter && !isIndexInString) {
        nestedLevel++;
      }
    }
    const jsonDataString = dataString.slice(startIndex, idx + 1);
    const jsonData = JSON.parse(jsonDataString);
    if (!isDesiredValue || isDesiredValue(jsonData)) {
      return { startIndex, endIndex: idx, jsonData };
    }
    startPosition = idx;
  }
};

// src/utils/eventListParser.ts
var getEventListFromPageOrProfile = (html) => {
  const { jsonData } = findJsonInString(html, "collection");
  if (!jsonData) {
    throw new Error(
      "No event data found, please verify that your URL is correct and the events are accessible without authentication"
    );
  }
  const events = [];
  jsonData.pageItems.edges.forEach((event) => {
    events.push({
      id: event.node.node.id,
      name: event.node.node.name,
      url: event.node.node.url,
      date: event.node.node.day_time_sentence,
      isCanceled: event.node.node.is_canceled,
      isPast: event.node.actions_renderer.event.is_past
    });
  });
  return events;
};
var getEventListFromGroup = (html, type = 0 /* Upcoming */) => {
  const { jsonData } = findJsonInString(
    html,
    type === 0 /* Upcoming */ ? "upcoming_events" : "past_events"
  );
  if (!jsonData) {
    throw new Error(
      "No event data found, please verify that your URL is correct and the events are accessible without authentication"
    );
  }
  const events = [];
  if (jsonData.edges.length > 0) {
    jsonData.edges.forEach((event) => {
      events.push({
        id: event.node.id,
        name: event.node.name,
        url: event.node.url,
        date: event.node.day_time_sentence,
        isCanceled: event.node.is_canceled,
        isPast: event.node.is_past
      });
    });
  }
  return events;
};

// src/utils/network.ts
import axios from "axios";
var fetchEvent = (url, proxy) => __async(void 0, null, function* () {
  try {
    const response = yield axios.get(url, {
      headers: {
        accept: "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
        "accept-encoding": "gzip, deflate, br",
        "accept-language": "en-US,en;q=0.6",
        "cache-control": "max-age=0",
        // NOTE: Need these headers to get all the event data, some combo of the sec fetch headers
        "sec-fetch-dest": "document",
        "sec-fetch-mode": "navigate",
        "sec-fetch-site": "same-origin",
        "sec-fetch-user": "?1",
        "sec-gpc": "1",
        "upgrade-insecure-requests": "1",
        "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"
      },
      proxy
    });
    return response.data;
  } catch (err) {
    throw new Error(
      "Error fetching event, make sure your URL is correct and the event is accessible to the public."
    );
  }
});

// src/utils/htmlParser.ts
var getDescription = (html) => {
  const { jsonData } = findJsonInString(html, "event_description");
  if (!jsonData) {
    throw new Error(
      "No event description found, please verify that your event URL is correct"
    );
  }
  return jsonData.text;
};
var getBasicData = (html) => {
  var _a, _b, _c, _d, _e, _f, _g, _h;
  const { jsonData } = findJsonInString(
    html,
    "event",
    (candidate) => candidate.day_time_sentence
  );
  if (!jsonData) {
    throw new Error(
      "No event data found, please verify that your URL is correct and the event is accessible without authentication"
    );
  }
  return {
    id: jsonData.id,
    name: jsonData.name,
    photo: ((_a = jsonData.cover_media_renderer) == null ? void 0 : _a.cover_photo) ? {
      url: jsonData.cover_media_renderer.cover_photo.photo.url,
      id: jsonData.cover_media_renderer.cover_photo.photo.id,
      imageUri: (_d = (_b = jsonData.cover_media_renderer.cover_photo.photo.image) == null ? void 0 : _b.uri) != null ? _d : (_c = jsonData.cover_media_renderer.cover_photo.photo.full_image) == null ? void 0 : _c.uri
    } : null,
    video: ((_e = jsonData.cover_media_renderer) == null ? void 0 : _e.cover_video) ? {
      url: jsonData.cover_media_renderer.cover_video.url,
      id: jsonData.cover_media_renderer.cover_video.id,
      thumbnailUri: (_f = jsonData.cover_media_renderer.cover_video.image) == null ? void 0 : _f.uri
    } : null,
    formattedDate: jsonData.day_time_sentence,
    startTimestamp: jsonData.start_timestamp,
    isOnline: jsonData.is_online,
    url: jsonData.url,
    // Sibling events, for multi-date events
    siblingEvents: (_h = (_g = jsonData.comet_neighboring_siblings) == null ? void 0 : _g.map(
      (sibling) => ({
        id: sibling.id,
        startTimestamp: sibling.start_timestamp,
        endTimestamp: sibling.end_timestamp,
        parentEvent: { id: sibling.parent_event.id }
      })
    )) != null ? _h : [],
    // If parent exists, and its not the same as the current event, set the parentEvent field
    parentEvent: jsonData.parent_if_exists_or_self && jsonData.parent_if_exists_or_self.id !== jsonData.id ? { id: jsonData.parent_if_exists_or_self.id } : null
  };
};
var getTicketUrl = (html) => {
  var _a;
  const { jsonData } = findJsonInString(
    html,
    "event",
    (candidate) => candidate.event_buy_ticket_url
  );
  return (_a = jsonData == null ? void 0 : jsonData.event_buy_ticket_url) != null ? _a : null;
};
var getUserStats = (html) => {
  const { jsonData: usersRespondedJsonData } = findJsonInString(
    html,
    "event_connected_users_public_responded"
  );
  return {
    usersResponded: usersRespondedJsonData == null ? void 0 : usersRespondedJsonData.count
  };
};
var getLocation = (html) => {
  var _a, _b, _c, _d, _e, _f, _g, _h;
  const { jsonData, startIndex } = findJsonInString(
    html,
    "event_place",
    (candidate) => "location" in candidate
  );
  if (startIndex === -1) {
    throw new Error(
      "No location information found, please verify that your event URL is correct"
    );
  }
  if (jsonData === null) {
    return null;
  }
  return {
    id: jsonData.id,
    name: jsonData.name,
    description: (_b = (_a = jsonData.best_description) == null ? void 0 : _a.text) != null ? _b : null,
    url: (_c = jsonData.url) != null ? _c : null,
    coordinates: jsonData.location ? {
      latitude: jsonData.location.latitude,
      longitude: jsonData.location.longitude
    } : null,
    countryCode: (_f = (_e = (_d = jsonData.location) == null ? void 0 : _d.reverse_geocode) == null ? void 0 : _e.country_alpha_two) != null ? _f : null,
    type: jsonData.place_type,
    address: (_h = (_g = jsonData.address) == null ? void 0 : _g.street) != null ? _h : null,
    // address doesnt exist for custom location events, and is set to an empty string for cities
    city: jsonData.city ? {
      name: jsonData.city.contextual_name,
      id: jsonData.city.id
    } : null
  };
};
var getHosts = (html) => {
  const { jsonData } = findJsonInString(
    html,
    "event_hosts_that_can_view_guestlist",
    // We check for profile_picture field since there are other event_hosts_that_can_view_guestlist keys which have more limited host data (doesnt include profile_picture).
    (candidate) => {
      var _a;
      return (_a = candidate == null ? void 0 : candidate[0]) == null ? void 0 : _a.profile_picture;
    }
  );
  if (jsonData === null) {
    return [];
  }
  return jsonData.map((host) => ({
    id: host.id,
    name: host.name,
    url: host.url,
    type: host.__typename,
    photo: {
      imageUri: host.profile_picture.uri
    }
  }));
};
var getOnlineDetails = (html) => {
  const { jsonData } = findJsonInString(
    html,
    "online_event_setup",
    (candidate) => "third_party_url" in candidate && "type" in candidate
  );
  if (jsonData === null) {
    throw new Error(
      "No online event details found, please verify that your event URL is correct"
    );
  }
  return { url: jsonData.third_party_url, type: jsonData.type };
};
var getEndTimestampAndTimezone = (html, expectedStartTimestamp) => {
  const { jsonData } = findJsonInString(
    html,
    "data",
    (candidate) => "end_timestamp" in candidate && "tz_display_name" in candidate && candidate.start_timestamp === expectedStartTimestamp
  );
  if (jsonData === null) {
    throw new Error(
      "No end date & timezone details found, please verify that your event URL is correct"
    );
  }
  return {
    endTimestamp: jsonData.end_timestamp || null,
    timezone: jsonData.tz_display_name
  };
};
var getCategories = (html) => {
  const { jsonData } = findJsonInString(html, "discovery_categories");
  return jsonData;
};

// src/scraper.ts
var scrapeEvent = (urlFromUser, options) => __async(void 0, null, function* () {
  const dataString = yield fetchEvent(urlFromUser, options.proxy);
  const {
    id,
    name,
    photo,
    video,
    isOnline,
    url,
    startTimestamp,
    formattedDate,
    siblingEvents,
    parentEvent
  } = getBasicData(dataString);
  const { endTimestamp, timezone } = getEndTimestampAndTimezone(
    dataString,
    startTimestamp
  );
  let location = null;
  let onlineDetails = null;
  if (isOnline) {
    onlineDetails = getOnlineDetails(dataString);
  } else {
    location = getLocation(dataString);
  }
  const description = getDescription(dataString);
  const ticketUrl = getTicketUrl(dataString);
  const categories = getCategories(dataString);
  const hosts = getHosts(dataString);
  const { usersResponded } = getUserStats(dataString);
  return {
    id,
    name,
    description,
    location,
    photo,
    video,
    isOnline,
    url,
    startTimestamp,
    endTimestamp,
    formattedDate,
    timezone,
    onlineDetails,
    hosts,
    ticketUrl,
    categories,
    siblingEvents,
    parentEvent,
    usersResponded
  };
});

// src/index.ts
var scrapeFbEvent = (_0, ..._1) => __async(void 0, [_0, ..._1], function* (url, options = {}) {
  const formattedUrl = validateAndFormatUrl(url);
  return yield scrapeEvent(formattedUrl, options);
});
var scrapeFbEventFromFbid = (_0, ..._1) => __async(void 0, [_0, ..._1], function* (fbid, options = {}) {
  const formattedUrl = fbidToUrl(fbid);
  return yield scrapeEvent(formattedUrl, options);
});
var scrapeFbEventListFromPage = (_0, _1, ..._2) => __async(void 0, [_0, _1, ..._2], function* (url, type, options = {}) {
  const formattedUrl = validateAndFormatEventPageUrl(url, type);
  const dataString = yield fetchEvent(formattedUrl, options.proxy);
  return getEventListFromPageOrProfile(dataString);
});
var scrapeFbEventListFromProfile = (_0, _1, ..._2) => __async(void 0, [_0, _1, ..._2], function* (url, type, options = {}) {
  const formattedUrl = validateAndFormatEventProfileUrl(url, type);
  const dataString = yield fetchEvent(formattedUrl, options.proxy);
  return getEventListFromPageOrProfile(dataString);
});
var scrapeFbEventListFromGroup = (_0, _1, ..._2) => __async(void 0, [_0, _1, ..._2], function* (url, type, options = {}) {
  const formattedUrl = validateAndFormatEventGroupUrl(url);
  const dataString = yield fetchEvent(formattedUrl, options.proxy);
  return getEventListFromGroup(dataString, type);
});
var scrapeFbEventList = (_0, _1, ..._2) => __async(void 0, [_0, _1, ..._2], function* (url, type, options = {}) {
  if (url.includes("/groups/")) {
    return scrapeFbEventListFromGroup(url, type, options);
  }
  if (url.includes("/profile.php")) {
    return scrapeFbEventListFromProfile(url, type, options);
  }
  return scrapeFbEventListFromPage(url, type, options);
});
export {
  EventType,
  scrapeFbEvent,
  scrapeFbEventFromFbid,
  scrapeFbEventList,
  scrapeFbEventListFromGroup,
  scrapeFbEventListFromPage,
  scrapeFbEventListFromProfile
};
