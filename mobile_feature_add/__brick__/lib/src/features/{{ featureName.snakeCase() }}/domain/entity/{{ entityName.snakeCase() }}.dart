// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Object that the UI needs.
class {{ entityName.pascalCase() }} {
  final int? id;

  const {{ entityName.pascalCase() }}({
    this.id
  });

  {{ entityName.pascalCase() }} copyWith({
    int? id
  }) {
    return {{ entityName.pascalCase() }}(
      id: id ?? this.id
    );
  }
}
