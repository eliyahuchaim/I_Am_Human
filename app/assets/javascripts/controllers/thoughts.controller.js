function createThoughtsController(){
  return class {

    static formListener(){
      $('.create_thought').submit(() => {
        event.preventDefault()
        this.createFromForm()
      })

    }

    static formHTML(){
    let html = `
      <h3>Create a Thought</h3>
      <form class="create_thought" action="index.html" method="post">
        <input type="text" name="thought[title]" placeholder="title" id="title">
        <input type="text" name="thought[content]" placeholder="content" id="content">
        <input type="text" name="thought[username]" placeholder="username" id="username">
        <input type="submit" value="submit">
      </form>
      `
      // debugger
      render(html, ".form_here")
      ThoughtsController.formListener()
    }

    static createFromForm(){
      let title = $('#title').val()
      let content = $('#content').val()
      let user = User.findOrCreate($('#username').val())
      let newThought = new Thought(title, content, user.id)
      let allUsersThoughts = user.thoughts()
      ThoughtsController.usersThoughtsHTML(allUsersThoughts)

    }

    static thoughtsHTML(thought){
      return `
      <h3>${thought.title}</h3>
      <p>${thought.content}</p>
      <button type="delete" class="destroy_thought">Delete this thought</button>
      <button type="edit" class="edit_thought">Edit this thought</button>
      `
    }

    static usersThoughtsHTML(allUsersThoughts){
          let html = ""
          allUsersThoughts.forEach((thought) => {
          html += ThoughtsController.thoughtsHTML(thought)
          })
        render(html, ".thoughts_here")
    }

  }
}

let ThoughtsController = createThoughtsController()
