enum Step {
  breed,
  name,
  details,
  birthday,
  weight;

  bool get isBreed => this == Step.breed;

  bool get isName => this == Step.name;

  bool get isDetails => this == Step.details;

  bool get isBirthday => this == Step.birthday;

  bool get isWeight => this == Step.weight;

  bool get isFirst => this == Step.breed;

  bool get isLast => this == Step.weight;
}
