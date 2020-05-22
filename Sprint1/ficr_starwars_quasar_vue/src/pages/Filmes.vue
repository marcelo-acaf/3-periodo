<template>
  <div class="col-4">
    <div class="row">
          <q-intersection
            v-for="filme in filmes"
            :key="filme.name"
            class="example-item"
          >
            <q-card class="q-ma-lg">
              <q-card-section>
                <div class="text-h6">Nome: {{ filme.title }}</div>
                <div class="text-subtitle2">Diretor: {{ filme.director }}</div>
                <div class="text-subtitle2">Produtor: {{ filme.producer }}</div>
                <div class="text-subtitle2">Data estréia: {{ filme.release_date }}</div>
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
      filmes: []
    }
  },
  created () {
    this.$axios.get('https://swapi.co/api/films')
      .then(response => {
        this.filmes = response.data.results
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
