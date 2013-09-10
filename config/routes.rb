Wordstock::Application.routes.draw do
  get 'spell' => "spell_checker#check"
end
