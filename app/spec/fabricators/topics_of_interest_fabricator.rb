Fabricator(:topics_of_interest) do
  topic_name { Faker::Team.sport }
  short_desc { Faker::Hipster.paragraph(2, false, 4) }
end
