<template>
  <div class="col-4">
    <div class="row">
          <q-intersection
            v-for="personagem in personagens"
            :key="personagem.name"
            class="example-item"
          >
            <q-card class="q-ma-lg">
              <q-card-section>
                <div class="text-h6">Nome: {{ personagem.name }}</div>
                <div class="text-subtitle2">Ano Nascimento: {{ personagem.birth_year }}</div>
                <div class="text-subtitle2">Peso: {{ personagem.mass }}</div>
                <div class="text-subtitle2">Altura: {{ personagem.height }}</div>
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
      personagens: []
    }
  },
  created () {
    this.$axios.get('https://swapi.co/api/people/')
      .then(response => {
        this.personagens = response.data.results
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
