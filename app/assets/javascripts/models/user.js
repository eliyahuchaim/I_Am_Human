function createUsers() {
  let id = 0

  return class {
    constructor(username) {
      this.username = username
      this.id = ++id
      store.users.push(this)
    }
  }
}

let User = createUsers()
