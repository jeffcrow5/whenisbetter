<template>
  <div id="container" v-if="isCurrentUserAdmin">
    <b-form-radio-group
      buttons
      button-variant="outline-primary"
      v-model="activeTab"
      :options="['Group View', 'User View']">
    </b-form-radio-group>
    <hr>

    <!-- Group View -->
    <div class="view" v-if="activeTab == 'Group View'">
      <div class="left">
        <h3>Group to Modify</h3>
        <b-form-select v-model="groupSelected" :options="groups.map(group => {
          return {text: group.groupname, value: group.groupid}})" /> 
        <b-button v-if="groupSelected" class="mt-3" variant="danger" @click="deleteGroup">Delete Group</b-button>    
      </div>
      <!-- Group View -->
      <div v-if="groupSelected" class="right">
        <!-- Members -->
        <div class="list">
          <h3>Members</h3>
          <div v-for="(member, index) in groupMembers" :key="index" class="w-100">{{`${member.firstname} ${member.lastname}`}}<b-button @click="deleteMember(member)" variant="danger" class="ml-auto">Delete</b-button></div>
        </div>

        <!-- Events -->
        <div class="list">
          <h3>Events</h3>
          <div v-for="(event, index) in groupEvents" :key="index">{{event.eventname}}<b-button @click="deleteEvent(event)" variant="danger">Delete</b-button></div>
        </div>
      </div>
    </div>

    <!-- User View -->
    <div class="view" v-else>
      <div class="left">
        <h3>User to Modify</h3>
        <b-form-select v-model="userSelected" :options="users.map((user, index) => {return {text: `${user.firstname} ${user.lastname}`, value: users[index]}})" />
        <b-button v-if="userSelected" class="mt-3" variant="danger" @click="deleteUser()">Delete User</b-button>
      </div>
      <div v-if="userSelected" class="right">
        <b-form-checkbox v-model="isAdmin" @change="setAdminStatus">
          Administrator
        </b-form-checkbox>
      </div>
    </div>
  </div>
</template>

<script>
import Api from "../api"

export default {
  name: "Admin",
  data () {
    return {
      activeTab: 'Group View',
      groupSelected: null,
      groups: [{groupname: 'group 1', groupid: 1}, {groupname: 'group 2', groupid: 2}, {groupname: 'Group 3', groupid: 3}],
      groupMembers: [],
      groupEvents: [],
      userSelected: null,
      isAdmin: false,
      isCurrentUserAdmin: false,
      users: [{userid: 1, firstname: 'Jeffrey', lastname: 'Crowley'}, {userid: 2, firstname: 'Trevor', lastname: 'McClellan'}, {userid: 3, firstname: 'Josh', lastname: 'Haviland'}, {userid: 4, firstname: 'Derek', lastname: 'Hansen'}]
    }
  },
  created() {
    Api.getCurrentUser().then((response) => {
        this.isCurrentUserAdmin = response.data[0].isadmin;
        if (this.isCurrentUserAdmin) {
          this.getGroups()
          this.getUsers()
        }
        else {
          this.$router.push('/')
        }
    });
    
  },
  watch: {
    groupSelected(newValue, oldValue) {
      if (newValue != oldValue) {
        this.getGroupMembers(newValue)
        this.getGroupEvents(newValue)
      }
    },
    userSelected(newValue, oldValue) {
      if (newValue != oldValue) {
        this.isAdmin = newValue.isadmin ? true : false
      }
    }
  },
  methods: {
    getGroups() {
      Api.getAllGroups().then(response => {
        this.groups = response.data
      })
    },
    getUsers() {
      Api.getAllUsers().then(response => {
        this.users = response.data
      })
    },
    getGroupMembers(groupID) {
      Api.getGroupMembers(groupID).then(response => {
          this.groupMembers = response.data
        })
    },
    getGroupEvents(groupID) {
      Api.getGroupEvents(groupID).then(response => {
          this.groupEvents = response.data
        })
    },
    deleteMember(member) {
      Api.removeUserFromGroup(member.userid, member.groupid).then(() => {
        this.getGroupMembers(member.groupid)
      })
    },
    deleteEvent(event) {
      Api.removeEvent(event.eventid).then(() => {
        this.getGroupEvents(event.groupid)
      })
    },
    deleteUser() {
      Api.deleteUser(this.userSelected.userid).then(() => {
        this.getUsers()
      })
    },
    deleteGroup() {
      Api.deleteGroup(this.groupSelected)
      .then(() => {
        this.getGroups()
      })
    },
    setAdminStatus() {
      let status = this.isAdmin ? 1 : 0
      let userid = this.userSelected.userid
      Api.toggleUserAdmin(userid, status).then(() => {
        Api.getAllUsers().then(response => {
          this.users = response.data
          this.userSelected = this.users.find(user => user.userid == userid)
        })
      })
    }
  }
};
</script>

<style scoped>
#container {
  padding: 25px;
}

.view {
  display: grid;
  grid-template-areas:
    'left right';
  grid-template-columns: 49% 49%;
  gap: 20px;
  width: 100%;
  
}

.left {
  grid-area: left;
}
.right {
  grid-area: right;
}

.list {
  display: flex;
  flex-direction: column;
  /* align-items: stretch; */
}
</style>