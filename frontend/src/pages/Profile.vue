<template>
  <b-container class="container">
    <p>Welcome to ur heckin profile nerd</p>
    <b-form-group label="First Name" label-for="first-name-input">
      <b-form-input
        id="first-name-input"
        v-model="userInfo.firstname"
        autocomplete="off"
      />
    </b-form-group>

    <b-form-group label="Last Name" label-for="last-name-input">
      <b-form-input
        id="last-name-input"
        v-model="userInfo.lastname"
        autocomplete="off"
      />
    </b-form-group>

    <b-form-group label="Email Address" label-for="email-address-input">
      <b-form-input
        id="email-address-input"
        v-model="userInfo.emailaddress"
        autocomplete="off"
        disabled
      />
    </b-form-group>
    <b-form-group
      label="Monday Availability"
      v-slot="{ ariaDescribedby }"
    >
      <b-form-checkbox-group
        v-model="monday"
        :options="options"
        :aria-describedby="ariaDescribedby"
        name="buttons-1"
        buttons
        button-variant="info"
      ></b-form-checkbox-group>
    </b-form-group>
    <b-form-group
      label="Tuesday Availability"
      v-slot="{ ariaDescribedby }"
    >
      <b-form-checkbox-group
        v-model="tuesday"
        :options="options"
        :aria-describedby="ariaDescribedby"
        name="buttons-1"
        buttons
        button-variant="info"
      ></b-form-checkbox-group>
    </b-form-group>
    <b-form-group
      label="Wednesday Availability"
      v-slot="{ ariaDescribedby }"
    >
      <b-form-checkbox-group
        v-model="wednesday"
        :options="options"
        :aria-describedby="ariaDescribedby"
        name="buttons-1"
        buttons
        button-variant="info"
      ></b-form-checkbox-group>
    </b-form-group>
    <b-form-group
      label="Thursday Availability"
      v-slot="{ ariaDescribedby }"
    >
      <b-form-checkbox-group
        v-model="thursday"
        :options="options"
        :aria-describedby="ariaDescribedby"
        name="buttons-1"
        buttons
        button-variant="info"
      ></b-form-checkbox-group>
    </b-form-group>
    <b-form-group
      label="Friday Availability"
      v-slot="{ ariaDescribedby }"
    >
      <b-form-checkbox-group
        v-model="friday"
        :options="options"
        :aria-describedby="ariaDescribedby"
        name="buttons-1"
        buttons
        button-variant="info"
      ></b-form-checkbox-group>
    </b-form-group>
    <b-form-group
      label="Saturday Availability"
      v-slot="{ ariaDescribedby }"
    >
      <b-form-checkbox-group
        v-model="saturday"
        :options="options"
        :aria-describedby="ariaDescribedby"
        name="buttons-1"
        buttons
        button-variant="info"
      ></b-form-checkbox-group>
    </b-form-group>
    <b-form-group
      label="Sunday Availability"
      v-slot="{ ariaDescribedby }"
    >
      <b-form-checkbox-group
        v-model="sunday"
        :options="options"
        :aria-describedby="ariaDescribedby"
        name="buttons-1"
        buttons
        button-variant="info"
      ></b-form-checkbox-group>
    </b-form-group>
    <b-button variant="primary" @click="updateSettings">
      Save
    </b-button>
  </b-container>
</template>

<script>
import Api from '../api'

export default {
  name: "Profile",
  data () {
    return {
      userInfo: {
        firstname: '',
        lastname: '',
        emailaddress: '',
        defaulttimes: {}
      },
      options: [
          { text: '6am', value: '6' },
          { text: '7am', value: '7' },
          { text: '8am', value: '8' },
          { text: '9am', value: '9' },
          { text: '10am', value: '10' },
          { text: '11am', value: '11' },
          { text: '12pm', value: '12' },
          { text: '1pm', value: '13' },
          { text: '2pm', value: '14' },
          { text: '3pm', value: '15' },
          { text: '4pm', value: '16' },
          { text: '5pm', value: '17' },
          { text: '6pm', value: '18' },
          { text: '7pm', value: '19' },
          { text: '8pm', value: '20' },
        ],
      monday: [],
      tuesday: [],
      wednesday: [],
      thursday: [],
      friday: [],
      saturday: [],
      sunday: [],
    }
  },
  created() {
    this.getProfile()
  },
  methods: {
    getProfile() {
      Api.getUserProfile().then((res) => {
        this.userInfo = res.data[0]
        let defaulttimes = res.data[0].defaulttimes
        this.monday = defaulttimes.monday || []
        this.tuesday = defaulttimes.tuesday || []
        this.wednesday = defaulttimes.wednesday || []
        this.thursday = defaulttimes.thursday || []
        this.friday = defaulttimes.friday || []
        this.saturday = defaulttimes.saturday || []
        this.sunday = defaulttimes.sunday || []
      })
    },
    updateSettings() {
      this.userInfo.defaulttimes = {
        monday: this.monday,
        tuesday: this.tuesday,
        wednesday: this.wednesday,
        thursday: this.thursday,
        friday: this.friday,
        saturday: this.saturday,
        sunday: this.sunday
      }
      Api.updateUserSettings(this.userInfo.firstname, this.userInfo.lastname, this.userInfo.defaulttimes).then(() => {
        this.getProfile()
      })
    }
  }
};
</script>

<style scoped>
.container {
  padding: 30px;
}
</style>