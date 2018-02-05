module ApplicationHelper
  def link_to_add_new_task(name, f, association, **args)
    # create a new object that takes the form builder.  Get the object of
    # that form builder and send the association
    new_object = f.object.send(association).klass.new
    # get unique obj id so every new form task will have its own unique id
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |ff|
      render(association.to_s.singularize, f: ff)
    end
    link_to(name, '#', class: 'add_fields ' + args[:class], data: { id: id, fields: fields.gsub("\n", "") })
  end
end
