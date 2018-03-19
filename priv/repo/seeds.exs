# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dream.Repo.insert!(%Dream.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Dream.Repo

alias Dream.Core.Day
alias Dream.Core.Character

alias Dream.Character.Trait
alias Dream.Character.Description
alias Dream.Character.AdditionalDescription
alias Dream.Character.Journal

alias Dream.Trait.TraitCategory



Dream.Repo.delete_all(Day)
Dream.Repo.delete_all(Character)

Dream.Repo.delete_all(Trait)
Dream.Repo.delete_all(Description)
Dream.Repo.delete_all(AdditionalDescription)
Dream.Repo.delete_all(Journal)

Dream.Repo.delete_all(TraitCategory)


Dream.Repo.delete_all Dream.Coherence.User

Dream.Coherence.User.changeset(%Dream.Coherence.User{}, %{name: "Julius Reade", email: "julius.reade@gmail.com", password: "secret", password_confirmation: "secret"})
|> Dream.Repo.insert!


victim = Ecto.Changeset.change(%Character{
  secondary_id: "1234567890",
  name: "the-victim",
  display_name: "The Victim",
  featured_image: "",
  icon: "",

  # traits: [],
  # journals: [],
  # description: [],
  # additional_information: [] 

  # character_before: {},
  # character_after: {},
})

judge = Ecto.Changeset.change(%Character{
  secondary_id: "123456789023",
  name: "the-judge",
  display_name: "The Judge",
  featured_image: "",
  icon: "",
})


victim_description = Ecto.Changeset.change(%Description{
  text: "When you feel vulnerable and as if the world is out to get you. It's pretty awful.",
})


victim_trait_one = Ecto.Changeset.change(%Trait{
  name: "vulnerable",
  display_name: "Vulnerable",
  category: "negative"
})

victim_trait_two = Ecto.Changeset.change(%Trait{
  name: "insecure",
  display_name: "Insecure",
  category: "negative"
})

victim_trait_three = Ecto.Changeset.change(%Trait{
  name: "broken",
  display_name: "Broken",
  category: "negative"
})


victim_journal_one = Ecto.Changeset.change(%Journal{
  text: "there was this one time in bandcamp where the world collided with itself and it all just broke down into a haze of mess and sunken credology."
})

victim_journal_two = Ecto.Changeset.change(%Journal{
  text: "there was this one time in bandcamp where the world collided with itself and it all just broke down into a haze of mess and sunken credology. there was this one time in bandcamp where the world collided with itself and it all just broke down into a haze of mess and sunken credology. there was this one time in bandcamp where the world collided with itself and it all just broke down into a haze of mess and sunken credology. there was this one time in bandcamp where the world collided with itself and it all just broke down into a haze of mess and sunken credology"
})


victim_with_traits = Ecto.Changeset.put_assoc(victim, :traits, [victim_trait_one, victim_trait_two, victim_trait_three])
victim_with_description = Ecto.Changeset.put_assoc(victim_with_traits, :description, victim_description)
victim_with_journals = Ecto.Changeset.put_assoc(victim_with_description, :journals, [victim_journal_one, victim_journal_two])

judge_with_traits = Ecto.Changeset.put_assoc(judge, :traits, [victim_trait_one, victim_trait_two, victim_trait_three])
judge_with_description = Ecto.Changeset.put_assoc(judge_with_traits, :description, victim_description)
judge_with_journals = Ecto.Changeset.put_assoc(judge_with_description, :journals, [victim_journal_one, victim_journal_two])


Repo.insert!(victim_with_journals)


timeline_one = Ecto.Changeset.change(%Day{
  name: "the-worst",
  display_name: "The Worst"
  # characters: []]
})

timeline_two = Ecto.Changeset.change(%Day{
  name: "the-pretender-day-of-days",
  display_name: "The Pretender Is Me"
  # characters: []]
})



timeline_with_characters = Ecto.Changeset.put_assoc(timeline_one, :characters, [judge_with_journals])

Repo.insert!(timeline_with_characters)

Repo.insert!(timeline_two)