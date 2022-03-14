import axios from "axios"
import { authHeader, getJwtToken, getUserIdFromToken } from "./auth"

const API_URL = "http://54.205.253.120:8000"
const USER_ID = getUserIdFromToken(getJwtToken())

class Api {

  getUserProfile() {
    return axios.get(
      API_URL + `/user_settings?userid=eq.${USER_ID}`
    )
  }

  setUserDefaultTimes(defaultTimes) {
    return axios.patch(
      API_URL + `/User?userid=eq.${USER_ID}`,
      {
        defaulttimes: defaultTimes
      },
      {
        headers: authHeader()
      }
    )
  }

  setUserSettings(firstname, lastname, emailaddress) {
    return axios.patch(
      API_URL + `/User?userid=eq.${USER_ID}`,
      {
        firstname,
        lastname,
        emailaddress
      },
      {
        headers: authHeader()
      }
    )
  }

  addArticle(article) {
    return axios.post(
      API_URL + "/articles",
      {
        ...article,
        // add user id from JWT token
        userid: USER_ID,
      },
      {
        headers: authHeader(),
      }
    );
  }

  updateArticle(article) {
    return axios.patch(
      API_URL + `/articles?articleid=eq.${article.articleid}`,
      article,
      {
        headers: authHeader(),
      }
    );
  }

  deleteArticle(id) {
    return axios.delete(API_URL + `/articles?articleid=eq.${id}`, {
      headers: authHeader(),
    });
  }

  publishArticle(id) {
    return axios.post(
      API_URL + "/rpc/publish",
      { id: id },
      {
        headers: authHeader(),
      }
    );
  }

  login(email, password) {
    return axios.post(API_URL + "/rpc/login", { email, password });
  }

  signup(firstname, lastname, email, password) {
    return axios.post(API_URL + "/rpc/signup", { firstname, lastname, email, password });
  }
}

export default new Api();
