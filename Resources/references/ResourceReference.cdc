pub contract ResourceStuff {
  pub resource Pet {
    pub(set) var name: String

    init(_name: String) {
      self.name = _name
    }
  }

  pub fun createPet(name: String): @Pet {
    return <- create Pet(_name: name)
  }

  pub fun changePetName(pet: &Pet) {
    pet.name = "Alice"
  }

  init() {

  }
}