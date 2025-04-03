//import { scrapeFbEvent, scrapeFbEventFromFbid } from 'facebook-event-scraper';
import {scrapeFbEvent, scrapeFbEventList} from '../facebook-event-scraper/index.mjs';
import express from 'express';

const app = express();
const port = 3000;

app.use(express.json());

app.get('/scrape/event', (req, res) => {
    const url = req.query.url;
    scrapeEvent(url);
    res.json({ message: `Query parametr: ${url}` });
});

app.get('/scrape/event/list', (req, res) => {
    const url = req.query.url;
    scrapeEventList(url);
    res.json({ message: `Query parametr: ${url}` });
});

app.listen(port, () => {
    console.log(`Server běží na http://localhost:${port}`);
});


//const url = 'https://www.facebook.com/events/1136370914719109';

async function scrapeEvent(url) {
  try {
    const eventData = await scrapeFbEvent(url);
    console.log(eventData);
  } catch (err) {
    console.error(err);
  }
}

async function scrapeEventList(url) {
  try {
    const eventData = await scrapeFbEventList(url);
    console.log(eventData);
  } catch (err) {
    console.error(err);
  }
}
