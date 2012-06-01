jQuery ->
  cdata_matcher = /\/\/<!\[CDATA\[\s*|\s*\/\/\]\]>/g

  $('form a.add_child').live 'click', ->
    association = $(this).attr 'data-association'
    child_expr  = new RegExp 'new_' + association, 'g'
    new_id      = new Date().getTime()

    template = $('#' + association + '_fields_template').html().replace cdata_matcher, ''
    template = template.replace child_expr, new_id

    parent      = $(this).attr 'data-parent'
    collection  = $(this).attr 'data-collection'

    if parent and collection
      collection  = $(this).parents( collection )
      association = find_association_parent association, parent, collection
      console.log(association)
      template    = template.replace association.expr, "[#{association.name}][#{association.id}]"

    $(this).before template
    return false

  $('form a.remove_child').live 'click', ->
    data_group    = $(this).attr('data-collapse')
    data_group  ||= '.fields'

    $(this).prev('input[type=hidden]').val '1'
    $(this).parents(data_group).first().hide()

    return false

find_association_parent = (association, parent, collection)->
  parent_expr = /[a-z]+\[([a-z_]+_attributes)\]\[(\d+)\](.*)+/g
  parent_sel  = $( collection ).find "[data-parent-of=#{ association }]"
  parent_name = parent_sel.find('input').first().attr 'name'
  assoc_match = parent_expr.exec( parent_name )

  parent_name = assoc_match[1]
  parent_id   = assoc_match[2]

  { name: parent_name, id: parent_id, expr: new RegExp "\\[#{parent_name}\\]\\[\\d+\\]", 'g' }

