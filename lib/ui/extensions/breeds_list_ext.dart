import '../../core/design_system/components/regular_dropdown_button.dart';
import '../../domain/entities/breed.dart';

extension BreedsListExt on List<Breed> {
  List<DropdownItem> toDropdownList() {
    return map(
      (breed) => DropdownItem(id: breed.id, name: breed.name),
    ).toList();
  }
}
