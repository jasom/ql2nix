lisp:

{ stdenv, buildInputs ? [], ... } @ attrs:

stdenv.mkDerivation (
  {
    
  }
  //
  attrs
  //
  {
    name = attrs.name;
    builder = ./project-builder.sh;
  }
)
