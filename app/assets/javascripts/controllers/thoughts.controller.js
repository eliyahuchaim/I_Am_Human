function createThoughtController(){
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
      ThoughtController.formListener()
    }

    static createFromForm(){
      let title = $('#title').val()
      let content = $('#content').val()
      let username = User.findOrCreate($('#username').val())
      debugger
      newThought = new Thought(title, content, username.id)

    }


  }
}

let ThoughtController = createThoughtController()
