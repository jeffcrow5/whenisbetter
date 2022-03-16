import axios from "axios"
import { authHeader, getJwtToken, getUserIdFromToken } from "./auth"

const API_URL = "http://54.205.253.120:8000"

function getUserId() {
  getUserIdFromToken(getJwtToken())
}

class Api {

  getUserProfile() {
    return axios.get(
      API_URL + `/user_settings?userid=eq.${getUserId()}`
    )
  }

  setUserDefaultTimes(defaultTimes) {
    return axios.patch(
      API_URL + `/User?userid=eq.${getUserId()}`,
      {
        defaulttimes: defaultTimes
      },
      {
        headers: authHeader()
      }
    )
  }

  updateUserSettings(firstname, lastname, emailaddress) {
    return axios.patch(
      API_URL + `/User?userid=eq.${getUserId()}`,
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

  getAllGroups() {
    return axios.get(API_URL + "/Group");
  }

  toggleUserAdmin(isadmin) {
    return axios.patch(
      API_URL + `/User?userid=eq.${getUserId()}`,
      {
        isadmin
      },
      {
        headers: authHeader()
      }
    )
  }

  getAllUsers() {
    return axios.get(API_URL + "/User");
  }

  getUsersAttendingEvent(eventid) {
    return axios.get(
      API_URL + `/UserAttendsEvent?eventid=eq.${eventid}`
    )
  }

  unattendEvent(eventid) {
    return axios.delete(
      API_URL + `/UserAttendsEvent?userid=eq.${getUserId()}&eventid=eq.${eventid}`,
      {
        headers: authHeader()
      }
    )
  }

  attendEvent(eventid) {
    return axios.post(
      API_URL + `/UserAttendsEvent`,
      {
        userid: getUserId(),
        eventid
      },
      {
        headers: authHeader()
      }
    )
  }

  removeEvent(eventid) {
    return axios.delete(
      API_URL + `/Event?eventid=eq.${eventid}`,
      {
        headers: authHeader()
      }
    )
  }

  createEvent(eventname, eventdesc, eventduration, eventstarttime, groupid) {
    return axios.post(
      API_URL + `/Event`,
      {
        eventname,
        eventdesc,
        eventduration,
        eventstarttime,
        groupid
      },
      {
        headers: authHeader()
      }
    )
  }

  removeUserFromGroup(userid, groupid) {
    return axios.delete(
      API_URL + `/GroupHasUser?userid=eq.${userid}&groupid=eq.${groupid}`,
      {
        headers: authHeader()
      }
    )
  }

  addUserToGroup(userid, groupid) {
    return axios.post(
      API_URL + `/GroupHasUser`,
      {
        userid,
        groupid
      },
      {
        headers: authHeader()
      }
    )
  }

  getGroupFromInviteCode(groupinvitecode) {
    return axios.get(
      API_URL + `/Group?groupinvitecode=eq.${groupinvitecode}`
    )
  }

  deleteGroup(groupid) {
    return axios.delete(
      API_URL + `/Group?groupid=eq.${groupid}`,
      {
        headers: authHeader()
      }
    )
  }

  createGroup(groupname, groupdesc, groupinvitecode, groupadmin, groupimage) {
    return axios.post(
      API_URL + `/Group`,
      {
        groupname,
        groupdesc,
        groupinvitecode,
        groupadmin,
        groupimage
      },
      {
        headers: authHeader()
      }
    )
  }

  deleteUser(userid) {
    return axios.delete(
      API_URL + `/User?userid=eq.${userid}`,
      {
        headers: authHeader()
      }
    )
  }

  registerUser(firstname, lastname, emailaddress, userpassword) {
    return axios.post(
      API_URL + `/User`,
      {
        firstname,
        lastname,
        emailaddress,
        userpassword,
        isadmin: 0
      }
    )
  }

  getUserSettings() {
    return axios.get(
      API_URL + `/User?userid=eq.${getUserId()}`
    )
  }

  adminViewsUser(userid) {
    return axios.get(
      API_URL + `/admin_views_user?userid=eq.${userid}`
    )
  }

  getUserDefaultTimes(userid) {
    return axios.get(
      API_URL + `/user_default_times?userid=eq.${userid}`
    )
  }

  getEventsUserAttending(userid) {
    return axios.get(
      API_URL + `/user_attends_events?userid=eq.${userid}`
    )
  }

  getGroupMembers(groupid) {
    return axios.get(
      API_URL + `/GroupHasUser?groupid=eq.${groupid}`
    )
  }

  getGroupEvents(groupid) {
    return axios.get(
      API_URL + `/GroupHasEvent?groupid=eq.${groupid}`
    )
  }

  getUserIndividualGroupInfo(userid, groupid) {
    return axios.get(
      API_URL + `/user_individual_group_info?userid=eq.${userid}&groupid=eq.${groupid}`
    )
  }

  getUserGroups(userid) {
    return axios.get(
      API_URL + `/user_groups?userid=eq.${userid}`
    )
  }

  getUserInfo(userid) {
    return axios.get(
      API_URL + `/User?userid=eq.${userid}`
    )
  }

  login(email, password) {
    return axios.post(API_URL + "/rpc/login", { email, password });
  }

  signup(firstname, lastname, email, password) {
    this.registerUser(firstname, lastname, email, password).then(() => {
      return axios.post(API_URL + "/rpc/signup", { firstname, lastname, email, password })
    })
  }
}

export default new Api();
