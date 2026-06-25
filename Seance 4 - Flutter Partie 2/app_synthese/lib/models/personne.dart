// Exemple 1 du support (info.md) : héritage + polymorphisme.
class Personne {
  String nom;
  int age;

  Personne(this.nom, this.age);

  void sePresenter() {
    print("Bonjour, je m'appelle $nom et j'ai $age ans.");
  }
}

class Salarie extends Personne {
  double salaire;

  Salarie(String nom, int age, this.salaire) : super(nom, age);

  @override
  void sePresenter() {
    print(
        "Bonjour, Je suis un Salarié, je m'appelle $nom, j'ai $age ans et mon salaire est de $salaire €.");
  }

  void augmentation(double montant) {
    salaire += montant;
    print("Nouveau salaire pour $nom : $salaire €.");
  }
}
