$(document).ready(function() {
  
  var user_interests = ""
  $('#new_user').submit(function() {
    var interests = $("input[@class=interest]:checked");
    
    $.each(interests, function(index, interest) {
      user_interests = user_interests + interest['name'] + ",";
      if (interest['id'] == "other") {
        user_interests = user_interests + $(".interest-text")[0]['value']
      }
    })
    $('#user_areas_of_interest')[0]["value"] = user_interests
    return true
  });
  
  inputField = $("<input type=text>")
    .attr("name", "ooga")
    .attr("value", "booga")
    // $(document.body).append(inputField)
});