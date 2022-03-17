<template>
  <div id="home-page">
    <div class="groups">
      <b-form-radio-group
        v-model="selectedGroup"
        :options="groups.map(group => {
          return {text: group.groupname, value: group}
        })"
        buttons
        button-variant="outline-primary"
        stacked
      ></b-form-radio-group>
      <!-- FIXME: Make API call(s) to add group via invite code -->
      <b-button @click="openModal" class="mt-auto">+ Join Group</b-button>
      <b-modal
      size="md"
      title="Enter Group Invite Code"
      id="join-group-modal"
      @ok="joinGroup">
        <b-form
          @submit.prevent="
            joinGroup();
            $bvModal.hide('join-group-modal')
          "
        >
          <b-form-group label="Invite Code" label-for="invite-code-input">
            <b-form-input
              id="invite-code-input"
              v-model="groupInviteCode"
              autocomplete="off"
            />
          </b-form-group>
        </b-form>
      </b-modal>
    </div>

    <div v-if="Object.keys(selectedEvent).length === 0" class="main-group-panel">
      <b-card class="event-card" v-for="(event, index) in groupEvents" :key="index" :title="event.eventname" border-variant="secondary" @click="setSelectedEvent(event)" role="button">
        <b-card-text class="text-secondary">
          {{event.eventdesc}} 
        </b-card-text>
        <b-card-text>
          {{`Start time: ${new Date(event.eventstarttime).toLocaleTimeString()}`}}
        </b-card-text>
      </b-card>
    </div>

    <div v-else class="selected-event-panel">
      <b-jumbotron>
        <template #header>{{selectedEvent.eventname}}</template>

        <template #lead>
          {{selectedEvent.eventdesc}}
        </template>

        <hr class="my-4">

        <p>
          Start time: {{new Date(selectedEvent.eventstarttime).toLocaleTimeString()}}
        </p>
        
        <div class="text-center">Going?<br>
        <b-button variant="success" @click="userAttendsEvent">Yes</b-button>
        <b-button variant="danger" @click="userUnattendsEvent">No</b-button>
        </div>
      </b-jumbotron>
      <b-button @click="clearSelectedEvent">Back</b-button>
    </div>

    <div class="group-info">
      <h3>Group Members</h3>
      <div v-for="(member, index) in groupMembers" :key="index">
        {{`${member.firstname} ${member.lastname}`}}
      </div>
    </div>
    
  </div>
</template>

<script>
import Api from "../api"
import { getJwtToken, getUserIdFromToken } from "../auth"

export default {
  name: "Home",
  data: function () {
    return {
      // FIXME: Remove these once proper API calls have been made
      groups: [{groupid: 1, groupname: 'Group 1'}, {groupid: 2, groupname: 'Group 2'}, {groupid: 3, groupname: 'Group 17'}],
      selectedGroup: {},
      groupMembers: [],
      groupEvents: [],
      selectedEvent: {},
      groupInviteCode: ''
    };
  },
  beforeCreated() {
    // If not logged in reroute to login page
    if (!localStorage.getItem('accessToken')) {
      this.$router.push({path: '/login'})
    }
  },
  created() {
    Api.getUserGroups().then(response => {
        this.groups = response.data
        this.selectedGroup = this.groups[0]
      })
  },
  watch: {
    selectedGroup(newValue, oldValue) {
      if (newValue != oldValue) {
        this.getGroupMembers(newValue.groupid)
        this.getGroupEvents(newValue.groupid)
      }
    }
  },
  methods: {
    openModal() {
      this.$bvModal.show('join-group-modal')
    },
    setSelectedEvent(event) {
      this.selectedEvent = event
    },
    clearSelectedEvent() {
      this.selectedEvent = {}
    },
    userAttendsEvent() {
      Api.attendEvent(this.selectedEvent.eventid)
      // TODO: Add some visual feedback
    },
    userUnattendsEvent() {
      Api.unattendEvent(this.selectedEvent.eventid)
      // TODO: Add some visual feedback
    },
    getUserGroups() {
      Api.getUserGroups().then(response => {
        this.groups = response.data
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
    joinGroup() {
      Api.getGroupFromInviteCode(this.groupInviteCode).then(response => {
        let group = response.data[0]
        let userid = getUserIdFromToken(getJwtToken())
        Api.addUserToGroup(userid, group.groupid).then(() => {
          this.getUserGroups()
        })
      })
    }
  }
};
</script>

<style scoped>
#home-page {
  display: grid;
  height: 100%;
  grid-template-areas:
    'groups main-panel group-info';
  grid-template-columns: 300px auto 300px; 
}
.groups {
  grid-area: groups;
  background-color: lightgray;
  padding: 20px;
  display: flex;
  flex-direction: column;

}
.main-group-panel {
  grid-area: main-panel;
  display: flex;
  justify-content: space-around;
  padding: 30px;
}
.selected-event-panel {
  grid-area: main-panel;
  display: flex;
  flex-direction: column;

}

.event-card {
  max-height: 200px;
  width: 300px;
}

.group-info {
  grid-area: group-info;
  background-color: lightgray;
  display: flex;
  flex-direction: column;
  padding: 20px;
}
</style>