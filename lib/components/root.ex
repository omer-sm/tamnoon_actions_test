defmodule TamnoonActionsTest.Components.Root do
  @behaviour Tamnoon.Component

  @impl true
  def heex do
    ~s"""
    <!DOCTYPE html>
    <html lang="en">

      <head>
        <meta name="description" content="Webpage description goes here" />
        <meta charset="utf-8">
        <title>Tamnoon App</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="tamnoon/tamnoon_dom.js"></script>
        <script src="tamnoon/tamnoon_driver.js"></script>
        <link rel="stylesheet" href="style.css">
        <link rel="icon" type="image/x-icon" href="/tamnoon/tamnoon_icon.ico">
      </head>

      <body>
        <div id="container">
          <p id="my-text">This is my text</p>
          <button onclick=@activate_test>Press to activate my test!</button>
          <strong class="show-on-test" hidden>I am now visible because you pressed</strong>
          <ul id="my-list" class="show-on-test" hidden>
            <li>I am a list and I am the best,</li>
            <li>Out of all, I am the best dressed!</li>
            <li>I like to stand tall and <a href="#" onclick=@activate_list_test>puff my chest,</a></li>
            <li>It makes me stand out from the rest!</li>
          </ul>
        </div>
      </body>
    </html>
    """
  end
end
