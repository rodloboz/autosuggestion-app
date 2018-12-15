import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const renderItem = function (item) {
    let icon;
    if (item.type === 'user') {
      icon = '<i class="fab fa-github"></i>';
    } else if (item.type === 'skill') {
      icon = '<i class="fas fa-code"></i>';
    }
    return `<div class="autocomplete-suggestion">${icon}<span>${item.name}</span></div>`
};

const autocompleteSearch = function() {
  const skills = JSON.parse(document.getElementById('search-data').dataset.skills)
  const searchInput = document.getElementById('q');

  if (skills && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
        $.getJSON('/autocomplete',
          { q: term },
          function(data) {
            return data;
        }).then((data) => {
          const matches = []
          data.skills.forEach((skill) => {
            matches.push({type: 'skill', name: skill });
          });
          data.users.forEach((user) => {
            matches.push({type: 'user', name: user });
          });
          suggest(matches)
        });
      },
      renderItem: renderItem,
    });
  }
};

export { autocompleteSearch };
