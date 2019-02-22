<template>
    <nav>
        <v-toolbar app dark class="cyan">
            <v-toolbar-side-icon @click="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title class="headline text-uppercase">
                <span class="">How do I Say</span>
            </v-toolbar-title>
            <v-spacer></v-spacer>
            </v-toolbar>

            <v-navigation-drawer v-model="drawer" app temporary>
                <v-list class="pt-0" dense>
                    <v-list-tile
                    v-for="item in items"
                    :key="item.title"
                    route
                    :to="item.route"
                    >
                    <v-list-tile-action>
                        <v-icon>{{ item.icon }}</v-icon>
                    </v-list-tile-action>

                    <v-list-tile-content>
                        <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                    </v-list-tile-content>
                    </v-list-tile>
                </v-list>
        </v-navigation-drawer>
    </nav>
</template>

<script>
export default {
    name: 'navbar',
    data(){
        return {
            drawer: false,
            items: [
                { title: 'Translate', icon: 'translate', route: '/' },
                { title: 'About', icon: 'info', route: '/about' }
            ]
        }
    }
}
</script>
