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

      <b-button variant="primary" @click="openModal('join-group-modal')" class="mt-auto">+ Join Group</b-button>
      <b-button variant="success" @click="openModal('create-group-modal')" class="mt-2">+ Create Group</b-button>
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

      <b-modal
      size="md"
      title="Enter Group Info"
      id="create-group-modal"
      @ok="createGroup">
        <b-form
          @submit.prevent="
            createGroup();
            $bvModal.hide('create-group-modal')
          "
        >
          <b-form-group label="Group Name" label-for="group-name-input">
            <b-form-input
              id="group-name-input"
              v-model="createGroupForm.groupname"
              autocomplete="off"
              required
            />
          </b-form-group>

          <b-form-group label="Group Description" label-for="group-desc-input" description="Optional">
            <b-form-input
              id="group-desc-input"
              v-model="createGroupForm.groupdesc"
              autocomplete="off"
            />
          </b-form-group>

          <b-form-group label="Group Image URL" label-for="group-image-input" description="Optional">
            <b-form-input
              id="group-image-input"
              v-model="createGroupForm.groupimage"
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
        <b-button :variant="'success'" @click="userAttendsEvent">Yes</b-button>
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
      <b-button variant="success" @click="openModal('create-event-modal')">
        + Create Event
      </b-button>
      <b-modal
      size="md"
      title="Enter Event Info"
      id="create-event-modal"
      @ok="createEvent">
        <b-form
          @submit.prevent="
            createEvent();
            $bvModal.hide('create-event-modal')
          "
        >
          <b-form-group label="Event Name" label-for="event-name-input">
            <b-form-input
              id="event-name-input"
              v-model="createEventForm.eventname"
              autocomplete="off"
              required
            />
          </b-form-group>

          <b-form-group label="Event Description" label-for="event-desc-input" description="Optional">
            <b-form-input
              id="event-desc-input"
              v-model="createEventForm.eventdesc"
              autocomplete="off"
            />
          </b-form-group>

          <b-form-group label="Event Duration" label-for="event-duration-input">
            <b-form-input
              id="event-duration-input"
              v-model="createEventForm.eventduration"
              autocomplete="off"
              required
            />
          </b-form-group>

          <b-form-group label="Event Start Time" label-for="event-start-time-input">
            <b-form-input
              id="event-start-time-input"
              v-model="createEventForm.eventstarttime"
              autocomplete="off"
              required
            />
          </b-form-group>
        </b-form>
      </b-modal>
      <b-button class="mt-auto" variant="danger" @click="leaveGroup()">
        Leave Group
      </b-button>
      <h3 class="text-center">
        Invite Code<br>
        {{selectedGroup.groupinvitecode}}
      </h3>

    </div>
    
  </div>
</template>

<script>
import Api from "../api"
import { getJwtToken, getUserIdFromToken } from "../auth"
import {v4 as uuidv4} from 'uuid'

export default {
  name: "Home",
  data: function () {
    return {
      // FIXME: Remove these once proper API calls have been made
      groups: [{groupid: 1, groupname: 'Group 1'}, {groupid: 2, groupname: 'Group 2'}, {groupid: 3, groupname: 'Group 17'}],
      selectedGroup: {
        groupname: '',
        groupdesc: '',
        groupinvitecode: '',
        groupadmin: '',
        groupimage: ''
      },
      groupMembers: [],
      groupEvents: [],
      selectedEvent: {},
      groupInviteCode: '',
      activeGroupInviteCode: '',
      createGroupForm: {
        groupname: '',
        groupdesc: '',
        groupinvitecode: '',
        groupadmin: '',
        groupimage: ''
      },
      createEventForm: {
        eventname: '',
        eventdesc: '',
        eventduration: '',
        eventstarttime: ''
      }
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
    openModal(modal) {
      this.$bvModal.show(modal)
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
        if (this.groups.length) {
          this.selectedGroup = this.groups[0]
        }
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
    },
    leaveGroup() {
      let userid = getUserIdFromToken(getJwtToken())
      Api.removeUserFromGroup(userid, this.selectedGroup.groupid)
      .then(() => {
        this.getUserGroups()
      })
    },
    createGroup() {
      let userid = getUserIdFromToken(getJwtToken())
      // FIXME: Generate unique invite code 
      let groupinvitecode = uuidv4().slice(0, 12)
      console.log(groupinvitecode)

      Api.createGroup(this.createGroupForm.groupname, this.createGroupForm.groupdesc, groupinvitecode, userid, this.createGroupForm.groupimage)
      .then(() => {
        this.createGroupForm = {
          groupname: '',
          groupdesc: '',
          groupinvitecode: '',
          groupadmin: '',
          groupimage: ''
        }
        this.groupInviteCode = groupinvitecode
        this.joinGroup()
      })
    },
    createEvent() {
      Api.createEvent(this.createEventForm.eventname, this.createEventForm.eventdesc, this.createEventForm.eventduration, this.createEventForm.eventstarttime, this.selectedGroup.groupid)
      .then(() => {
        this.createEventForm = {
          eventname: '',
          eventdesc: '',
          eventduration: '',
          eventstarttime: ''
        }
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