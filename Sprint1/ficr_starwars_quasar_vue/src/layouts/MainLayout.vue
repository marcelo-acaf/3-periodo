<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="leftDrawerOpen = !leftDrawerOpen"
        />

        <q-toolbar-title>
          Quasar App
        </q-toolbar-title>

        <div>Quasar v{{ $q.version }}</div>
      </q-toolbar>
    </q-header>

    <q-drawer
      v-model="leftDrawerOpen"
      show-if-above
      bordered
      content-class="bg-grey-1"
    >
      <q-list>
        <q-item-label
          header
          class="text-grey-8"
        >
          Menu
        </q-item-label>
        <EssentialLink
          v-for="link in essentialLinks"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import EssentialLink from 'components/EssentialLink'

export default {
  name: 'MainLayout',

  components: {
    EssentialLink
  },

  data () {
    return {
      leftDrawerOpen: false,
      essentialLinks: [
        {
          title: 'Início',
          caption: 'Início',
          icon: 'home',
          link: '/'
        },
        {
          title: 'Personagens',
          caption: 'Lista de personagens Star Wars',
          icon: 'school',
          link: 'personagens'
        },
        {
          title: 'Planetas',
          caption: 'Lista de planetas Star Wars',
          icon: 'map',
          link: 'planetas'
        },
        {
          title: 'Filmes',
          caption: 'Lista de filmes Star Wars',
          icon: 'movie',
          link: 'filmes'
        }
      ]
    }
  }
}
</script>
