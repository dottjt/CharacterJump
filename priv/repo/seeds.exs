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
alias Dream.Character.Narrative

alias Dream.Trait.TraitCategory



Dream.Repo.delete_all(Day)
Dream.Repo.delete_all(Character)

Dream.Repo.delete_all(Trait)
Dream.Repo.delete_all(Description)
Dream.Repo.delete_all(AdditionalDescription)
Dream.Repo.delete_all(Journal)
Dream.Repo.delete_all(Narrative)

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

cake = Ecto.Changeset.change(%Character{
  secondary_id: "234234",
  name: "the-cake",
  display_name: "The Cake",
  featured_image: "",
  icon: "",
})

silly = Ecto.Changeset.change(%Character{
  secondary_id: "234234",
  name: "the-silly",
  display_name: "The Silly Face Man",
  featured_image: "",
  icon: "",
})





description = Ecto.Changeset.change(%Description{
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
victim_with_description = Ecto.Changeset.put_assoc(victim_with_traits, :description, description)

judge_with_traits = Ecto.Changeset.put_assoc(judge, :traits, [victim_trait_one, victim_trait_two, victim_trait_three])
judge_with_description = Ecto.Changeset.put_assoc(judge_with_traits, :description, description)

cake_with_traits = Ecto.Changeset.put_assoc(silly, :traits, [victim_trait_one, victim_trait_two, victim_trait_three])
cake_with_description = Ecto.Changeset.put_assoc(cake_with_traits, :description, description)

silly_with_traits = Ecto.Changeset.put_assoc(silly, :traits, [victim_trait_one, victim_trait_two, victim_trait_three])
silly_with_description = Ecto.Changeset.put_assoc(silly_with_traits, :description, description)



Repo.insert!(victim_with_description)


timeline_one = Ecto.Changeset.change(%Day{
  name: "the-worst",
  display_name: "The Worst"
})

timeline_two = Ecto.Changeset.change(%Day{
  name: "the-pretender-day-of-days",
  display_name: "The Pretender Is Me"
})


timeline_one_with_characters = Ecto.Changeset.put_assoc(timeline_one, :characters, [judge_with_description, victim_with_description])
timeline_two_with_characters = Ecto.Changeset.put_assoc(timeline_one, :characters, [cake_with_description, silly_with_description])

Repo.insert!(timeline_one_with_characters)
Repo.insert!(timeline_two_with_characters)





narrative_one = Ecto.Changeset.change(%Narrative{
  text: "Not feeling good enough"
})

narrative_two = Ecto.Changeset.change(%Narrative{
  text: "Everyone is out to get me"
})

Repo.insert!(narrative_one)
Repo.insert!(narrative_two)



traits = [
  Ecto.Changeset.change(%Trait{
    name: "accessible",
    display_name: "Accessible",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "active",
    display_name: "Active",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "adaptable",
    display_name: "Adaptable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "admirable",
    display_name: "Admirable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "adventurous",
    display_name: "Adventurous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "agreeable",
    display_name: "Agreeable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "alert",
    display_name: "Alert",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "allocentric",
    display_name: "Allocentric",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "amiable",
    display_name: "Amiable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "anticipative",
    display_name: "Anticipative",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "appreciative",
    display_name: "Appreciative",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "articulate",
    display_name: "Articulate",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "aspiring",
    display_name: "Aspiring",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "athletic",
    display_name: "Athletic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "attractive",
    display_name: "Attractive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "balanced",
    display_name: "Balanced",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "benevolent",
    display_name: "Benevolent",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "brilliant",
    display_name: "Brilliant",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "calm",
    display_name: "Calm",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "capable",
    display_name: "Capable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "captivating",
    display_name: "Captivating",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "caring",
    display_name: "Caring",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "challenging",
    display_name: "Challenging",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "charismatic",
    display_name: "Charismatic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "charming",
    display_name: "Charming",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cheerful",
    display_name: "Cheerful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "clean",
    display_name: "Clean",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "clear-headed",
    display_name: "Clear-headed",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "clever",
    display_name: "Clever",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "colorful",
    display_name: "Colorful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "companionly",
    display_name: "Companionly",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "compassionate",
    display_name: "Compassionate",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "conciliatory",
    display_name: "Conciliatory",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "confident",
    display_name: "Confident",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "conscientious",
    display_name: "Conscientious",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "considerate",
    display_name: "Considerate",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "constant",
    display_name: "Constant",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "contemplative",
    display_name: "Contemplative",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cooperative",
    display_name: "Cooperative",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "courageous",
    display_name: "Courageous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "courteous",
    display_name: "Courteous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "creative",
    display_name: "Creative",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cultured",
    display_name: "Cultured",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "curious",
    display_name: "Curious",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "daring",
    display_name: "Daring",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "debonair",
    display_name: "Debonair",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "decent",
    display_name: "Decent",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "decisive",
    display_name: "Decisive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dedicated",
    display_name: "Dedicated",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "deep",
    display_name: "Deep",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dignified",
    display_name: "Dignified",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "directed",
    display_name: "Directed",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disciplined",
    display_name: "Disciplined",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "discreet",
    display_name: "Discreet",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dramatic",
    display_name: "Dramatic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dutiful",
    display_name: "Dutiful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dynamic",
    display_name: "Dynamic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "earnest",
    display_name: "Earnest",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "ebullient",
    display_name: "Ebullient",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "educated",
    display_name: "Educated",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "efficient",
    display_name: "Efficient",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "elegant",
    display_name: "Elegant",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "eloquent",
    display_name: "Eloquent",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "empathetic",
    display_name: "Empathetic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "energetic",
    display_name: "Energetic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "enthusiastic",
    display_name: "Enthusiastic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "esthetic",
    display_name: "Esthetic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "exciting",
    display_name: "Exciting",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "extraordinary",
    display_name: "Extraordinary",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fair",
    display_name: "Fair",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "faithful",
    display_name: "Faithful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "farsighted",
    display_name: "Farsighted",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "felicific",
    display_name: "Felicific",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "firm",
    display_name: "Firm",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "flexible",
    display_name: "Flexible",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "focused",
    display_name: "Focused",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "forecful",
    display_name: "Forecful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "forgiving",
    display_name: "Forgiving",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "forthright",
    display_name: "Forthright",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "freethinking",
    display_name: "Freethinking",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "friendly",
    display_name: "Friendly",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fun-loving",
    display_name: "Fun-loving",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "gallant",
    display_name: "Gallant",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "generous",
    display_name: "Generous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "gentle",
    display_name: "Gentle",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "genuine",
    display_name: "Genuine",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "good-natured",
    display_name: "Good-natured",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "gracious",
    display_name: "Gracious",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "hardworking",
    display_name: "Hardworking",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "healthy",
    display_name: "Healthy",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "hearty",
    display_name: "Hearty",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "helpful",
    display_name: "Helpful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "herioc",
    display_name: "Herioc",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "high-minded",
    display_name: "High-minded",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "honest",
    display_name: "Honest",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "honorable",
    display_name: "Honorable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "humble",
    display_name: "Humble",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "humorous",
    display_name: "Humorous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "idealistic",
    display_name: "Idealistic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "imaginative",
    display_name: "Imaginative",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "impressive",
    display_name: "Impressive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "incisive",
    display_name: "Incisive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "incorruptible",
    display_name: "Incorruptible",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "independent",
    display_name: "Independent",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "individualistic",
    display_name: "Individualistic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "innovative",
    display_name: "Innovative",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "inoffensive",
    display_name: "Inoffensive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "insightful",
    display_name: "Insightful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "insouciant",
    display_name: "Insouciant",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "intelligent",
    display_name: "Intelligent",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "intuitive",
    display_name: "Intuitive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "invulnerable",
    display_name: "Invulnerable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "kind",
    display_name: "Kind",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "knowledge",
    display_name: "Knowledge",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "leaderly",
    display_name: "Leaderly",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "leisurely",
    display_name: "Leisurely",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "liberal",
    display_name: "Liberal",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "logical",
    display_name: "Logical",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "lovable",
    display_name: "Lovable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "loyal",
    display_name: "Loyal",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "lyrical",
    display_name: "Lyrical",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "magnanimous",
    display_name: "Magnanimous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "many-sided",
    display_name: "Many-sided",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "masculine  (Manly)",
    display_name: "Masculine  (Manly)",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "mature",
    display_name: "Mature",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "methodical",
    display_name: "Methodical",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "maticulous",
    display_name: "Maticulous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "moderate",
    display_name: "Moderate",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "modest",
    display_name: "Modest",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "multi-leveled",
    display_name: "Multi-leveled",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "neat",
    display_name: "Neat",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "nonauthoritarian",
    display_name: "Nonauthoritarian",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "objective",
    display_name: "Objective",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "observant",
    display_name: "Observant",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "open",
    display_name: "Open",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "optimistic",
    display_name: "Optimistic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "orderly",
    display_name: "Orderly",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "organized",
    display_name: "Organized",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "original",
    display_name: "Original",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "painstaking",
    display_name: "Painstaking",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "passionate",
    display_name: "Passionate",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "patient",
    display_name: "Patient",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "patriotic",
    display_name: "Patriotic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "peaceful",
    display_name: "Peaceful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "perceptive",
    display_name: "Perceptive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "perfectionist",
    display_name: "Perfectionist",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "personable",
    display_name: "Personable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "persuasive",
    display_name: "Persuasive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "planful",
    display_name: "Planful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "playful",
    display_name: "Playful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "polished",
    display_name: "Polished",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "popular",
    display_name: "Popular",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "practical",
    display_name: "Practical",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "precise",
    display_name: "Precise",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "principled",
    display_name: "Principled",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "profound",
    display_name: "Profound",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "protean",
    display_name: "Protean",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "protective",
    display_name: "Protective",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "providential",
    display_name: "Providential",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "prudent",
    display_name: "Prudent",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "punctual",
    display_name: "Punctual",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "pruposeful",
    display_name: "Pruposeful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "rational",
    display_name: "Rational",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "realistic",
    display_name: "Realistic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "reflective",
    display_name: "Reflective",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "relaxed",
    display_name: "Relaxed",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "reliable",
    display_name: "Reliable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "resourceful",
    display_name: "Resourceful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "respectful",
    display_name: "Respectful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "responsible",
    display_name: "Responsible",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "responsive",
    display_name: "Responsive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "reverential",
    display_name: "Reverential",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "romantic",
    display_name: "Romantic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "rustic",
    display_name: "Rustic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sage",
    display_name: "Sage",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sane",
    display_name: "Sane",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "scholarly",
    display_name: "Scholarly",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "scrupulous",
    display_name: "Scrupulous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "secure",
    display_name: "Secure",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "selfless",
    display_name: "Selfless",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "self-critical",
    display_name: "Self-critical",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "self-defacing",
    display_name: "Self-defacing",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "self-denying",
    display_name: "Self-denying",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "self-reliant",
    display_name: "Self-reliant",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "self-sufficent",
    display_name: "Self-sufficent",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sensitive",
    display_name: "Sensitive",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sentimental",
    display_name: "Sentimental",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "seraphic",
    display_name: "Seraphic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "serious",
    display_name: "Serious",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sexy",
    display_name: "Sexy",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sharing",
    display_name: "Sharing",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "shrewd",
    display_name: "Shrewd",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "simple",
    display_name: "Simple",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "skillful",
    display_name: "Skillful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sober",
    display_name: "Sober",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sociable",
    display_name: "Sociable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "solid",
    display_name: "Solid",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sophisticated",
    display_name: "Sophisticated",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "spontaneous",
    display_name: "Spontaneous",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sporting",
    display_name: "Sporting",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "stable",
    display_name: "Stable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "steadfast",
    display_name: "Steadfast",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "steady",
    display_name: "Steady",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "stoic",
    display_name: "Stoic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "strong",
    display_name: "Strong",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "studious",
    display_name: "Studious",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "suave",
    display_name: "Suave",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "subtle",
    display_name: "Subtle",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sweet",
    display_name: "Sweet",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sympathetic",
    display_name: "Sympathetic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "systematic",
    display_name: "Systematic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "tasteful",
    display_name: "Tasteful",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "teacherly",
    display_name: "Teacherly",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "thorough",
    display_name: "Thorough",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "tidy",
    display_name: "Tidy",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "tolerant",
    display_name: "Tolerant",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "tractable",
    display_name: "Tractable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "trusting",
    display_name: "Trusting",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "uncomplaining",
    display_name: "Uncomplaining",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "understanding",
    display_name: "Understanding",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "undogmatic",
    display_name: "Undogmatic",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unfoolable",
    display_name: "Unfoolable",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "upright",
    display_name: "Upright",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "urbane",
    display_name: "Urbane",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "venturesome",
    display_name: "Venturesome",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "vivacious",
    display_name: "Vivacious",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "warm",
    display_name: "Warm",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "well-bred",
    display_name: "Well-bred",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "well-read",
    display_name: "Well-read",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "well-rounded",
    display_name: "Well-rounded",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "winning",
    display_name: "Winning",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "wise",
    display_name: "Wise",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "witty",
    display_name: "Witty",
    category: "positive"
  }),
  Ecto.Changeset.change(%Trait{
    name: "youthful",
    display_name: "Youthful",
    category: "positive"
  }),








  Ecto.Changeset.change(%Trait{
  name: "absentminded",
  display_name: "Absentminded",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "aggressive",
  display_name: "Aggressive",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "ambitious",
  display_name: "Ambitious",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "amusing",
  display_name: "Amusing",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "artful",
  display_name: "Artful",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "ascetic",
  display_name: "Ascetic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "authoritarian",
  display_name: "Authoritarian",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "big-thinking",
  display_name: "Big-thinking",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "boyish",
  display_name: "Boyish",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "breezy",
  display_name: "Breezy",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "businesslike",
  display_name: "Businesslike",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "busy",
  display_name: "Busy",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "casual",
  display_name: "Casual",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "crebral",
  display_name: "Crebral",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "chummy",
  display_name: "Chummy",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "circumspect",
  display_name: "Circumspect",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "competitive",
  display_name: "Competitive",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "complex",
  display_name: "Complex",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "confidential",
  display_name: "Confidential",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "conservative",
  display_name: "Conservative",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "contradictory",
  display_name: "Contradictory",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "crisp",
  display_name: "Crisp",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "cute",
  display_name: "Cute",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "deceptive",
  display_name: "Deceptive",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "determined",
  display_name: "Determined",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "dominating",
  display_name: "Dominating",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "dreamy",
  display_name: "Dreamy",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "driving",
  display_name: "Driving",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "droll",
  display_name: "Droll",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "dry",
  display_name: "Dry",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "earthy",
  display_name: "Earthy",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "effeminate",
  display_name: "Effeminate",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "emotional",
  display_name: "Emotional",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "enigmatic",
  display_name: "Enigmatic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "experimental",
  display_name: "Experimental",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "familial",
  display_name: "Familial",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "folksy",
  display_name: "Folksy",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "formal",
  display_name: "Formal",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "freewheeling",
  display_name: "Freewheeling",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "frugal",
  display_name: "Frugal",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "glamorous",
  display_name: "Glamorous",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "guileless",
  display_name: "Guileless",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "high-spirited",
  display_name: "High-spirited",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "huried",
  display_name: "Huried",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "hypnotic",
  display_name: "Hypnotic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "iconoclastic",
  display_name: "Iconoclastic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "idiosyncratic",
  display_name: "Idiosyncratic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "impassive",
  display_name: "Impassive",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "impersonal",
  display_name: "Impersonal",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "impressionable",
  display_name: "Impressionable",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "intense",
  display_name: "Intense",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "invisible",
  display_name: "Invisible",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "irreligious",
  display_name: "Irreligious",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "irreverent",
  display_name: "Irreverent",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "maternal",
  display_name: "Maternal",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "mellow",
  display_name: "Mellow",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "modern",
  display_name: "Modern",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "moralistic",
  display_name: "Moralistic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "mystical",
  display_name: "Mystical",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "neutral",
  display_name: "Neutral",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "noncommittal",
  display_name: "Noncommittal",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "noncompetitive",
  display_name: "Noncompetitive",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "obedient",
  display_name: "Obedient",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "old-fashined",
  display_name: "Old-fashined",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "ordinary",
  display_name: "Ordinary",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "outspoken",
  display_name: "Outspoken",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "paternalistic",
  display_name: "Paternalistic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "physical",
  display_name: "Physical",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "placid",
  display_name: "Placid",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "political",
  display_name: "Political",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "predictable",
  display_name: "Predictable",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "preoccupied",
  display_name: "Preoccupied",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "private",
  display_name: "Private",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "progressive",
  display_name: "Progressive",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "proud",
  display_name: "Proud",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "pure",
  display_name: "Pure",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "questioning",
  display_name: "Questioning",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "quiet",
  display_name: "Quiet",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "religious",
  display_name: "Religious",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "reserved",
  display_name: "Reserved",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "restrained",
  display_name: "Restrained",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "retiring",
  display_name: "Retiring",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "sarcastic",
  display_name: "Sarcastic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "self-conscious",
  display_name: "Self-conscious",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "sensual",
  display_name: "Sensual",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "skeptical",
  display_name: "Skeptical",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "smooth",
  display_name: "Smooth",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "soft",
  display_name: "Soft",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "solemn",
  display_name: "Solemn",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "solitary",
  display_name: "Solitary",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "stern",
  display_name: "Stern",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "stoiid",
  display_name: "Stoiid",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "strict",
  display_name: "Strict",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "stubborn",
  display_name: "Stubborn",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "stylish",
  display_name: "Stylish",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "subjective",
  display_name: "Subjective",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "surprising",
  display_name: "Surprising",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "soft",
  display_name: "Soft",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "tough",
  display_name: "Tough",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unaggressive",
  display_name: "Unaggressive",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unambitious",
  display_name: "Unambitious",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unceremonious",
  display_name: "Unceremonious",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unchanging",
  display_name: "Unchanging",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "undemanding",
  display_name: "Undemanding",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unfathomable",
  display_name: "Unfathomable",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unhurried",
  display_name: "Unhurried",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "uninhibited",
  display_name: "Uninhibited",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unpatriotic",
  display_name: "Unpatriotic",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unpredicatable",
  display_name: "Unpredicatable",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unreligious",
  display_name: "Unreligious",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "unsentimental",
  display_name: "Unsentimental",
  category: "neutral"
  }),
  Ecto.Changeset.change(%Trait{
  name: "whimsical",
  display_name: "Whimsical",
  category: "neutral"
  }),







  Ecto.Changeset.change(%Trait{
  name: "Abrasive",
  display_name: "Abrasive",
  category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
  name: "Abrupt",
  display_name: "Abrupt",
  category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "agonizing", 
    display_name: "Agonizing", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "aimless", 
    display_name: "Aimless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "airy", 
    display_name: "Airy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "aloof", 
    display_name: "Aloof", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "amoral", 
    display_name: "Amoral", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "angry", 
    display_name: "Angry", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "anxious", 
    display_name: "Anxious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "apathetic", 
    display_name: "Apathetic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "arbitrary", 
    display_name: "Arbitrary", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "argumentative", 
    display_name: "Argumentative", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "arrogantt", 
    display_name: "Arrogantt", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "artificial", 
    display_name: "Artificial", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "asocial", 
    display_name: "Asocial", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "assertive", 
    display_name: "Assertive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "astigmatic", 
    display_name: "Astigmatic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "barbaric", 
    display_name: "Barbaric", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "bewildered", 
    display_name: "Bewildered", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "bizarre", 
    display_name: "Bizarre", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "bland", 
    display_name: "Bland", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "blunt", 
    display_name: "Blunt", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "biosterous", 
    display_name: "Biosterous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "brittle", 
    display_name: "Brittle", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "brutal", 
    display_name: "Brutal", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "calculating", 
    display_name: "Calculating", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "callous", 
    display_name: "Callous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cantakerous", 
    display_name: "Cantakerous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "careless", 
    display_name: "Careless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cautious", 
    display_name: "Cautious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "charmless", 
    display_name: "Charmless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "childish", 
    display_name: "Childish", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "clumsy", 
    display_name: "Clumsy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "coarse", 
    display_name: "Coarse", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cold", 
    display_name: "Cold", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "colorless", 
    display_name: "Colorless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "complacent", 
    display_name: "Complacent", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "complaintive", 
    display_name: "Complaintive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "compulsive", 
    display_name: "Compulsive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "conceited", 
    display_name: "Conceited", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "condemnatory", 
    display_name: "Condemnatory", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "conformist", 
    display_name: "Conformist", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "confused", 
    display_name: "Confused", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "contemptible", 
    display_name: "Contemptible", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "conventional", 
    display_name: "Conventional", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cowardly", 
    display_name: "Cowardly", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "crafty", 
    display_name: "Crafty", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "crass", 
    display_name: "Crass", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "crazy", 
    display_name: "Crazy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "criminal", 
    display_name: "Criminal", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "critical", 
    display_name: "Critical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "crude", 
    display_name: "Crude", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cruel", 
    display_name: "Cruel", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "cynical", 
    display_name: "Cynical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "decadent", 
    display_name: "Decadent", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "deceitful", 
    display_name: "Deceitful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "delicate", 
    display_name: "Delicate", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "demanding", 
    display_name: "Demanding", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dependent", 
    display_name: "Dependent", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "desperate", 
    display_name: "Desperate", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "destructive", 
    display_name: "Destructive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "devious", 
    display_name: "Devious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "difficult", 
    display_name: "Difficult", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dirty", 
    display_name: "Dirty", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disconcerting", 
    display_name: "Disconcerting", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "discontented", 
    display_name: "Discontented", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "discouraging", 
    display_name: "Discouraging", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "discourteous", 
    display_name: "Discourteous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dishonest", 
    display_name: "Dishonest", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disloyal", 
    display_name: "Disloyal", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disobedient", 
    display_name: "Disobedient", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disorderly", 
    display_name: "Disorderly", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disorganized", 
    display_name: "Disorganized", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disputatious", 
    display_name: "Disputatious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disrespectful", 
    display_name: "Disrespectful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disruptive", 
    display_name: "Disruptive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dissolute", 
    display_name: "Dissolute", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dissonant", 
    display_name: "Dissonant", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "distractible", 
    display_name: "Distractible", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "disturbing", 
    display_name: "Disturbing", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dogmatic", 
    display_name: "Dogmatic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "domineering", 
    display_name: "Domineering", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "dull", 
    display_name: "Dull", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "easily Discouraged", 
    display_name: "Easily Discouraged", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "egocentric", 
    display_name: "Egocentric", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "enervated", 
    display_name: "Enervated", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "envious", 
    display_name: "Envious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "erratic", 
    display_name: "Erratic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "escapist", 
    display_name: "Escapist", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "excitable", 
    display_name: "Excitable", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "expedient", 
    display_name: "Expedient", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "extravagant", 
    display_name: "Extravagant", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "extreme", 
    display_name: "Extreme", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "faithless", 
    display_name: "Faithless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "false", 
    display_name: "False", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fanatical", 
    display_name: "Fanatical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fanciful", 
    display_name: "Fanciful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fatalistic", 
    display_name: "Fatalistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fawning", 
    display_name: "Fawning", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fearful", 
    display_name: "Fearful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fickle", 
    display_name: "Fickle", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fiery", 
    display_name: "Fiery", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fixed", 
    display_name: "Fixed", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "flamboyant", 
    display_name: "Flamboyant", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "foolish", 
    display_name: "Foolish", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "forgetful", 
    display_name: "Forgetful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "fraudulent", 
    display_name: "Fraudulent", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "frightening", 
    display_name: "Frightening", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "frivolous", 
    display_name: "Frivolous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "gloomy", 
    display_name: "Gloomy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "graceless", 
    display_name: "Graceless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "grand", 
    display_name: "Grand", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "greedy", 
    display_name: "Greedy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "grim", 
    display_name: "Grim", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "gullible", 
    display_name: "Gullible", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "hateful", 
    display_name: "Hateful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "haughty", 
    display_name: "Haughty", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "hedonistic", 
    display_name: "Hedonistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "hesitant", 
    display_name: "Hesitant", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "hidebound", 
    display_name: "Hidebound", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "high-handed", 
    display_name: "High-handed", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "hostile", 
    display_name: "Hostile", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "ignorant", 
    display_name: "Ignorant", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "imitative", 
    display_name: "Imitative", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "impatient", 
    display_name: "Impatient", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "impractical", 
    display_name: "Impractical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "imprudent", 
    display_name: "Imprudent", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "impulsive", 
    display_name: "Impulsive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "inconsiderate", 
    display_name: "Inconsiderate", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "incurious", 
    display_name: "Incurious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "indecisive", 
    display_name: "Indecisive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "indulgent", 
    display_name: "Indulgent", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "inert", 
    display_name: "Inert", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "inhibited", 
    display_name: "Inhibited", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "insecure", 
    display_name: "Insecure", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "insensitive", 
    display_name: "Insensitive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "insincere", 
    display_name: "Insincere", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "insulting", 
    display_name: "Insulting", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "intolerant", 
    display_name: "Intolerant", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "irascible", 
    display_name: "Irascible", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "irrational", 
    display_name: "Irrational", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "irresponsible", 
    display_name: "Irresponsible", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "irritable", 
    display_name: "Irritable", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "lazy", 
    display_name: "Lazy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "libidinous", 
    display_name: "Libidinous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "loquacious", 
    display_name: "Loquacious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "malicious", 
    display_name: "Malicious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "mannered", 
    display_name: "Mannered", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "mannerless", 
    display_name: "Mannerless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "mawkish", 
    display_name: "Mawkish", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "mealymouthed", 
    display_name: "Mealymouthed", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "mechanical", 
    display_name: "Mechanical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "meddlesome", 
    display_name: "Meddlesome", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "melancholic", 
    display_name: "Melancholic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "meretricious", 
    display_name: "Meretricious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "messy", 
    display_name: "Messy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "miserable", 
    display_name: "Miserable", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "miserly", 
    display_name: "Miserly", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "misguided", 
    display_name: "Misguided", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "mistaken", 
    display_name: "Mistaken", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "money-minded", 
    display_name: "Money-minded", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "monstrous", 
    display_name: "Monstrous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "moody", 
    display_name: "Moody", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "morbid", 
    display_name: "Morbid", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "muddle-headed", 
    display_name: "Muddle-headed", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "naive", 
    display_name: "Naive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "narcissistic", 
    display_name: "Narcissistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "narrow", 
    display_name: "Narrow", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "narrow-minded", 
    display_name: "Narrow-minded", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "natty", 
    display_name: "Natty", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "negativistic", 
    display_name: "Negativistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "neglectful", 
    display_name: "Neglectful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "neurotic", 
    display_name: "Neurotic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "nihilistic", 
    display_name: "Nihilistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "obnoxious", 
    display_name: "Obnoxious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "obsessive", 
    display_name: "Obsessive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "obvious", 
    display_name: "Obvious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "odd", 
    display_name: "Odd", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "offhand", 
    display_name: "Offhand", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "one-dimensional", 
    display_name: "One-dimensional", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "one-sided", 
    display_name: "One-sided", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "opinionated", 
    display_name: "Opinionated", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "opportunistic", 
    display_name: "Opportunistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "oppressed", 
    display_name: "Oppressed", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "outrageous", 
    display_name: "Outrageous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "overimaginative", 
    display_name: "Overimaginative", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "paranoid", 
    display_name: "Paranoid", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "passive", 
    display_name: "Passive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "pedantic", 
    display_name: "Pedantic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "perverse", 
    display_name: "Perverse", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "petty", 
    display_name: "Petty", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "pharissical", 
    display_name: "Pharissical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "phlegmatic", 
    display_name: "Phlegmatic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "plodding", 
    display_name: "Plodding", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "pompous", 
    display_name: "Pompous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "possessive", 
    display_name: "Possessive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "power-hungry", 
    display_name: "Power-hungry", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "predatory", 
    display_name: "Predatory", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "prejudiced", 
    display_name: "Prejudiced", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "presumptuous", 
    display_name: "Presumptuous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "pretentious", 
    display_name: "Pretentious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "prim", 
    display_name: "Prim", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "procrastinating", 
    display_name: "Procrastinating", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "profligate", 
    display_name: "Profligate", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "provocative", 
    display_name: "Provocative", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "pugnacious", 
    display_name: "Pugnacious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "puritanical", 
    display_name: "Puritanical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "quirky", 
    display_name: "Quirky", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "reactionary", 
    display_name: "Reactionary", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "reactive", 
    display_name: "Reactive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "regimental", 
    display_name: "Regimental", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "regretful", 
    display_name: "Regretful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "repentant", 
    display_name: "Repentant", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "repressed", 
    display_name: "Repressed", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "resentful", 
    display_name: "Resentful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "ridiculous", 
    display_name: "Ridiculous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "rigid", 
    display_name: "Rigid", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "ritualistic", 
    display_name: "Ritualistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "rowdy", 
    display_name: "Rowdy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "ruined", 
    display_name: "Ruined", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sadistic", 
    display_name: "Sadistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sanctimonious", 
    display_name: "Sanctimonious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "scheming", 
    display_name: "Scheming", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "scornful", 
    display_name: "Scornful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "secretive", 
    display_name: "Secretive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sedentary", 
    display_name: "Sedentary", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "selfish", 
    display_name: "Selfish", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "self-indulgent", 
    display_name: "Self-indulgent", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "shallow", 
    display_name: "Shallow", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "shortsighted", 
    display_name: "Shortsighted", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "shy", 
    display_name: "Shy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "silly", 
    display_name: "Silly", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "single-minded", 
    display_name: "Single-minded", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sloppy", 
    display_name: "Sloppy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "slow", 
    display_name: "Slow", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sly", 
    display_name: "Sly", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "small-thinking", 
    display_name: "Small-thinking", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "softheaded", 
    display_name: "Softheaded", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "sordid", 
    display_name: "Sordid", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "steely", 
    display_name: "Steely", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "stiff", 
    display_name: "Stiff", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "strong-willed", 
    display_name: "Strong-willed", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "stupid", 
    display_name: "Stupid", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "submissive", 
    display_name: "Submissive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "superficial", 
    display_name: "Superficial", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "superstitious", 
    display_name: "Superstitious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "suspicious", 
    display_name: "Suspicious", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "tactless", 
    display_name: "Tactless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "tasteless", 
    display_name: "Tasteless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "tense", 
    display_name: "Tense", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "thievish", 
    display_name: "Thievish", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "thoughtless", 
    display_name: "Thoughtless", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "timid", 
    display_name: "Timid", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "transparent", 
    display_name: "Transparent", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "treacherous", 
    display_name: "Treacherous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "trendy", 
    display_name: "Trendy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "troublesome", 
    display_name: "Troublesome", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unappreciative", 
    display_name: "Unappreciative", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "uncaring", 
    display_name: "Uncaring", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "uncharitable", 
    display_name: "Uncharitable", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unconvincing", 
    display_name: "Unconvincing", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "uncooperative", 
    display_name: "Uncooperative", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "uncreative", 
    display_name: "Uncreative", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "uncritical", 
    display_name: "Uncritical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unctuous", 
    display_name: "Unctuous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "undisciplined", 
    display_name: "Undisciplined", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unfriendly", 
    display_name: "Unfriendly", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "ungrateful", 
    display_name: "Ungrateful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unhealthy", 
    display_name: "Unhealthy", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unimaginative", 
    display_name: "Unimaginative", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unimpressive", 
    display_name: "Unimpressive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unlovable", 
    display_name: "Unlovable", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unpolished", 
    display_name: "Unpolished", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unprincipled", 
    display_name: "Unprincipled", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unrealistic", 
    display_name: "Unrealistic", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unreflective", 
    display_name: "Unreflective", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unreliable", 
    display_name: "Unreliable", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unrestrained", 
    display_name: "Unrestrained", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unself-critical", 
    display_name: "Unself-critical", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "unstable", 
    display_name: "Unstable", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "vacuous", 
    display_name: "Vacuous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "vague", 
    display_name: "Vague", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "venal", 
    display_name: "Venal", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "venomous", 
    display_name: "Venomous", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "vindictive", 
    display_name: "Vindictive", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "vulnerable", 
    display_name: "Vulnerable", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "weak", 
    display_name: "Weak", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "weak-willed", 
    display_name: "Weak-willed", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "well-meaning", 
    display_name: "Well-meaning", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "willful", 
    display_name: "Willful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "wishful", 
    display_name: "Wishful", 
    category: "negative"
  }),
  Ecto.Changeset.change(%Trait{
    name: "zany", 
    display_name: "Zany", 
    category: "negative"
  })
]


Enum.map(traits, fn trait -> 
  Repo.insert!(trait)
end)


