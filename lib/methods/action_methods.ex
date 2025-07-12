defmodule TamnoonActionsTest.Methods.ActionMethods do
  import Tamnoon.MethodManager

  defmethod :activate_test do
    text_node =
      Tamnoon.DOM.Node.new!(%{selector_type: :id, selector_value: "my-text"})

    new_text_node =
      Tamnoon.DOM.Node.new!(%{
        selector_type: :from_string,
        selector_value: "<p id=\"my-text\">This is my new text</p>"
      })

    replace_text_action =
      Tamnoon.DOM.Actions.ReplaceNode.new!(%{target: text_node, replacement: new_text_node})

    show_action =
      Tamnoon.DOM.Actions.ForEach.new!(%{
        target:
          Tamnoon.DOM.NodeCollection.new!(%{
            selector_type: :query,
            selector_value: ".show-on-test"
          }),
        callback:
          Tamnoon.DOM.Actions.ToggleAttribute.new!(%{
            target:
              Tamnoon.DOM.Node.new!(%{
                selector_type: :iteration_placeholder,
                selector_value: nil
              }),
            attribute: "hidden",
            force: false
          })
      })

    {%{}, state, [replace_text_action, show_action]}
  end

  defmethod :activate_list_test do
    make_bold_action = Tamnoon.DOM.Actions.ForEach.new!(%{
      target: Tamnoon.DOM.NodeCollection.new!(%{
        selector_type: :children,
        selector_value: Tamnoon.DOM.Node.new!(%{
          selector_type: :id,
          selector_value: "my-list"
        })
      }),
      callback: Tamnoon.DOM.Actions.SetAttribute.new!(%{
        target: Tamnoon.DOM.Node.new!(%{
          selector_type: :iteration_placeholder,
          selector_value: nil
        }),
        attribute: "style",
        value: "font-weight: bold;"
      })
    })

    add_image_action = Tamnoon.DOM.Actions.SetInnerHTML.new!(%{
      target: Tamnoon.DOM.Node.new!(%{
        selector_type: :id,
        selector_value: "my-text"
      }),
      value: "<img src=\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmOwWi2BDg9lVsd7umH41hIneYjjnvK-4Ziw&s\">"
    })

    {%{}, state, [make_bold_action, add_image_action]}
  end
end
