import { scrapeFbEvent, scrapeFbEventFromFbid } from 'facebook-event-scraper';

const url = 'https://www.facebook.com/events/1136370914719109';

// Scrape event using URL
async function example() {
  try {
    const eventData = await scrapeFbEvent(url);
    console.log(eventData);
  } catch (err) {
    console.error(err);
  }
}

// Scrape event using FBID
async function example2() {
  try {
    const eventData2 = await scrapeFbEventFromFbid('1234567890');
    console.log(eventData2);
  } catch (err) {
    console.error(err);
  }
}

example();
