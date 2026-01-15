import java.util.Random;

Random rand = new Random();

String[] first = {"Elea", "Benoit", "Alex", "Jade", "Corentin", "Lain", "Elouan", "Lucille"};

String[] adjectives = {
  "légendaire", "inégalable", "invisible", "lent", "bruyant", "timide",
  "audacieux", "désastreux", "génial", "incompris", "indispensable"
};

String[] nouns = {
  "talent", "charisme", "génie", "désastre", "chef-d'œuvre", "mystère",
  "légende", "cauchemar", "trésor", "énigme", "miracle", "catastrophe"
};

String[] adverbs = {
  "incroyablement", "presque", "à peine", "trop", "étonnamment",
  "malheureusement", "visiblement"
};

String[] verbs = {
  "brille", "éblouit", "détruit", "confond", "fascine", "dépasse",
  "démolit", "enchante", "terrifie", "désespère"
};

String[] fin = {
  "Bien à toi,", "Peu sincèrement,", "Amicalement,", "Désespérément,"
};

// Fonctions utilitaires
String choice(String[] words) {
  return words[rand.nextInt(words.length)];
}

String maybe(String[] words) {
  if (rand.nextBoolean()) {
    return " " + choice(words);
  }
  return "";
}

String generateRoast() {
  return choice(first) + ", tu es" +
         maybe(adverbs) +
         " " + choice(adjectives) +
         " comme un" +
         " " + choice(nouns) +
         ", et ça " + choice(verbs) +
         " tout le monde ! " +
         choice(fin)  + " "
         + choice(first);
}

void setup() {
  noLoop();
  println(generateRoast());
}
