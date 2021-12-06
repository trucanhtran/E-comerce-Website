$('#id_select_date').change(function() {
  const selectDateValue = $("#id_select_date option:selected").text();
  $('#id_label_date').text(selectDateValue);
})
