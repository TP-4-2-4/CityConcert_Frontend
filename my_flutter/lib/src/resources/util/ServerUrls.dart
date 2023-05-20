class ServerUrls {
  static const SERVER_URL='http://cityconcertbackend-production.up.railway.app';

  static const FILTER_BY_NAME_EVENT_URL = '/event/filter_by_name';
  static const FILTER_BY_PRICE_EVENT_URL = '/event/filter_by_price';
  static const FILTER_BY_DATE_EVENT_URL = '/event/filter_by_date';
  static const FILTER_BY_GENRE_EVENT_URL = '/event/filter_by_genre';
  static const FILTER_EVENT_URL = '/event/filter';
  static const GET_EVENTS_URL = '/event/get_all';
  static const GET_EVENT_BY_ID_URL = '/event/get/';
  static const UPDATE_EVENT_URL = '/admin/event/update';
  static const ADD_EVENT_URL = '/admin/event/add';
  static const DELETE_EVENT_URL = '/admin/event/delete/';

  static const GET_VENUES_URL = '/venue/get_all';
  static const GET_VENUE_BY_ID_URL = '/venue/get/';
  static const UPDATE_VENUE_URL = '/admin/venue/update';
  static const ADD_VENUE_URL = '/admin/venue/add';
  static const DELETE_VENUE_URL = '/admin/venue/delete/';

  static const GET_REQUESTS_BY_TYPE_URL = '/request/get_by_type';
  static const GET_REQUEST_BY_ID_URL = '/request/get/';
  static const UPDATE_REQUEST_URL = '/request/update';
  static const ADD_REQUEST_URL = '/request/add';
  static const DELETE_REQUEST_URL = '/request/delete/';

  static const TICKET_BUY_URL = '/ticket/buy/';
  static const TICKET_MAIL_URL = '/ticket/mail/';
  static const TICKET_EXCHANGE_URL = '/ticket/exchange';
  static const GET_TICKET_BY_ID_URL = '/ticket/get/';
  static const UPDATE_TICKET_URL = '/ticket/update';
  static const ADD_TICKET_URL = '/ticket/add';
  static const DELETE_TICKET_URL = '/ticket/delete/';

  static const GET_USER_CURRENT_URL = '/user/current';
  static const GET_USER_BY_ID_URL = '/user/get/';
  static const UPDATE_USER_URL = '/user/update';
  static const ADD_USER_URL = '/user/add';
  static const DELETE_USER_URL = '/user/delete/';

  static const LOGIN_URL = '/login';
  static const REGISTRATION_URL = '/registration';
}
