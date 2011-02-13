$(document).ready(function() {
  
  $('#new_user').submit(function() {
    var interests = $("input[@class=interest]:checked");
    var user_interests = ""
    $.each(interests, function(index, interest) {
      if (interest['id'] == "other") {
        user_interests = user_interests + $(".interest-text")[0]['value']
      } else {
        user_interests = user_interests + interest['name'] + ",";
      }
    })
    $('#user_areas_of_interest')[0]["value"] = user_interests
    return true
  });
  
  $('#user_submit').click(function() {
    var interests = $("input[@class=interest]:checked");
    var user_interests = ""
    $.each(interests, function(index, interest) {
      if (interest['id'] == "other") {
        user_interests = user_interests + $(".interest-text")[0]['value']
      } else {
        user_interests = user_interests + interest['name'] + ",";
      }
    })
    $('#user_areas_of_interest')[0]["value"] = user_interests
    return true
  });
});