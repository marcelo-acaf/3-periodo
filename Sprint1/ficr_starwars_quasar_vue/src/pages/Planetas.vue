<template>
  <div class="col-4">
    <div class="row">
          <q-intersection
            v-for="planeta in planetas"
            :key="planeta.name"
            class="example-item"
          >
            <q-card class="q-ma-lg">
              <q-card-section>
                <div class="text-h6">Nome: {{ planeta.name }}</div>
                <div class="text-subtitle2">População: {{ planeta.population }}</div>
                <div class="text-subtitle2">Terreno: {{ planeta.terrain }}</div>
                <div class="text-subtitle2">Clima: {{ planeta.climate }}</div>
              </q-card-section>
            </q-card>
          </q-intersection>
        </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      planetas: []
    }
  },
  created () {
    this.$axios.get('https://swapi.co/api/planets')
      .then(response => {
        this.planetas = response.data.results
      })
      .catch(e => {
        this.errors.push(e)
      })
  }
}
</script>

<style lang="sass" scoped>
.example-item
  height: 290px
  width: 290px
</style>
