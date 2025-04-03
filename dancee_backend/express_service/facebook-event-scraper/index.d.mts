import { AxiosProxyConfig } from 'axios';

interface EventData {
    id: string;
    name: string;
    description: string;
    /** Event location, set to null if the event is online */
    location: EventLocation | null;
    hosts: EventHost[];
    /** Start time in unix */
    startTimestamp: number;
    /** End time in unix, if set */
    endTimestamp: number | null;
    /** Event date in a human-readable format (contains both start and end time) */
    formattedDate: string;
    /** Event timezone */
    timezone: string;
    photo: EventPhoto | null;
    video: EventVideo | null;
    url: string;
    isOnline: boolean;
    categories: EventCategory[];
    /** Only set if isOnline = true */
    onlineDetails: OnlineEventDetails | null;
    ticketUrl: string | null;
    usersResponded: number;
    /**
     * The parentEvent and siblingEvents fields are set to for multi-day events. Each sibling event will be a different date for the parent event.
     */
    parentEvent: ParentEvent | null;
    siblingEvents: SiblingEvent[];
}
interface ParentEvent {
    id: string;
}
interface SiblingEvent {
    id: string;
    startTimestamp: number;
    endTimestamp: number | null;
    parentEvent: ParentEvent;
}
interface OnlineEventDetails {
    /** Only set if type = 'THIRD_PARTY' */
    url: string | null;
    type: 'MESSENGER_ROOM' | 'THIRD_PARTY' | 'FB_LIVE' | 'OTHER';
}
interface EventPhoto {
    url: string;
    id: string;
    imageUri: string | undefined;
}
interface EventVideo {
    url: string;
    id: string;
    thumbnailUri: string;
}
interface EventHost {
    id: string;
    name: string;
    url: string;
    type: 'User' | 'Page';
    photo: {
        imageUri: string;
    };
}
interface EventLocation {
    name: string;
    description: string;
    url: string;
    coordinates: {
        latitude: number;
        longitude: number;
    } | null;
    countryCode: string | null;
    id: string;
    type: 'TEXT' | 'PLACE' | 'CITY';
    address: string;
    city: {
        name: string;
        id: string;
    } | null;
}
interface EventCategory {
    label: string;
    url: string;
}
interface ScrapeOptions {
    proxy?: AxiosProxyConfig;
}
interface ShortEventData {
    id: string;
    name: string;
    url: string;
    date: string;
    isCanceled: boolean;
    isPast: boolean;
}

declare enum EventType {
    Upcoming = 0,
    Past = 1
}

declare const scrapeFbEvent: (url: string, options?: ScrapeOptions) => Promise<EventData>;
declare const scrapeFbEventFromFbid: (fbid: string, options?: ScrapeOptions) => Promise<EventData>;
declare const scrapeFbEventListFromPage: (url: string, type?: EventType, options?: ScrapeOptions) => Promise<ShortEventData[]>;
declare const scrapeFbEventListFromProfile: (url: string, type?: EventType, options?: ScrapeOptions) => Promise<ShortEventData[]>;
declare const scrapeFbEventListFromGroup: (url: string, type?: EventType, options?: ScrapeOptions) => Promise<ShortEventData[]>;
declare const scrapeFbEventList: (url: string, type?: EventType, options?: ScrapeOptions) => Promise<ShortEventData[]>;

export { type EventData, EventType, type ScrapeOptions, type ShortEventData, scrapeFbEvent, scrapeFbEventFromFbid, scrapeFbEventList, scrapeFbEventListFromGroup, scrapeFbEventListFromPage, scrapeFbEventListFromProfile };
