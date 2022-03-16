<template>
  <div id="container">
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
        Group to Modify
        <b-form-select v-model="groupSelected" :options="groups.map(group => {
          return {text: group.groupname, value: group.groupid}})" />     
      </div>
      <!-- Group View -->
      <div class="right">
        <!-- Members -->
        <div class="list">
          <p>Members</p>
          <div v-for="(member, index) in groupMembers" :key="index">{{`${member.firstname} ${member.lastname}`}}<b-button @click="deleteMember(member)" variant="danger" class="ml-auto">Delete</b-button></div>
        </div>

        <!-- Events -->
        <div class="list">
          <p>Events</p>
          <div v-for="(event, index) in groupEvents" :key="index">{{event.eventname}}<b-button @click="deleteEvent(event)" variant="danger">Delete</b-button></div>
        </div>
      </div>
    </div>

    <!-- User View -->
    <div class="view" v-else>
      <div class="left">
        User to Modify
        <b-form-select v-model="userSelected" :options="users.map((user) => {return {text: `${user.firstname} ${user.lastname}`, value: user.userid}})" />     
      </div>
      <div class="right">
        <b-form-checkbox
          v-model="userSelected.isAdmin"
        >
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
      groupSelected: {},
      groups: [{groupname: 'group 1', groupid: 1}, {groupname: 'group 2', groupid: 2}, {groupname: 'Group 3', groupid: 3}],
      groupMembers: [],
      groupEvents: [],

      userSelected: {},
      users: [{userid: 1, firstname: 'Jeffrey', lastname: 'Crowley'}, {userid: 2, firstname: 'Trevor', lastname: 'McClellan'}, {userid: 3, firstname: 'Josh', lastname: 'Haviland'}, {userid: 4, firstname: 'Derek', lastname: 'Hansen'}]
    }
  },
  created() {
    Api
    // TODO: Api.getAllGroups()
  },
  watch: {
    groupSelected(newValue, oldValue) {
      if (newValue != oldValue) {
        this.groupMembers = [{userid: 1, firstname: 'Jeffrey', lastname: 'Crowley'}, {userid: 2, firstname: 'Trevor', lastname: 'McClellan'}, {userid: 3, firstname: 'Josh', lastname: 'Haviland'}]
        // TODO: Api set groupMembers and groupEvents
      }
    },
    userSelected(newValue, oldValue) {
      if (newValue != oldValue) {
        this
      }
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
  align-items: stretch;
}
</style>