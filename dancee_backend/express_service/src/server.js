//import { scrapeFbEvent, scrapeFbEventFromFbid } from 'facebook-event-scraper';
import {scrapeFbEvent, scrapeFbEventList} from '../facebook-event-scraper/index.mjs';
import express from 'express';

const app = express();
const port = 3000;

app.use(express.json());

app.get('/scrape/event', async (req, res) => {
  const url = req.query.url;
  try {
    const eventData = await scrapeFbEvent(url);
    //console.log(eventData);
    res.json({ payload: eventData });
  } catch (err) {
    res.status(500).json({ error: 'Došlo k chybě při získávání dat' });
  }
});

app.get('/scrape/event/list', async (req, res) => {
  const url = req.query.url;
  try {
    const eventData = await scrapeFbEventList(url);
    res.json({ payload: eventData });
  } catch (err) {
    res.status(500).json({ error: 'Došlo k chybě při získávání dat' });
  }
});

app.listen(port, () => {
    console.log(`Server běží na http://localhost:${port}`);
});
