<template>
    <v-container>
        <v-list subheader>
          <v-subheader>Recent search. Swipe left to delete</v-subheader>
          <v-list-tile
            v-for="(item, index) in history" :key="index"
            class="pt-2" 
            v-touch="{
                left: () => removeSearchItem(index)
            }" >
            
            <v-list-tile-content>
              <v-list-tile-title v-html="item.text"></v-list-tile-title>
              <v-list-tile-title v-html="item.translation" class="cyan--text"></v-list-tile-title>
            </v-list-tile-content>

            <v-list-tile-action>
              <v-icon color="cyan" @click="removeSearchItem(index)">close</v-icon>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>
    </v-container>
</template>

<script>
  export default {
    name: 'search-result',
    data () {
      return {
        history: this.$store.state.recentSearches,
      }
    },
    methods: {
        removeSearchItem(id){
            console.log("About to delete", id)
            this.$store.commit('removeSearch', id)
        },
    }
  }
</script>

<style>
.v-list__tile--active .v-list__tile__action:first-of-type .v-icon{
    color: #00838F;
}

.v-navigation-drawer > .v-list .v-list__tile--active .v-list__tile__title{
    color: #00838F;
}
</style>

