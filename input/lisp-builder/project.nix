lisp:

{ stdenv, buildInputs ? [], ... } @ attrs:

stdenv.mkDerivation (
  {
    
  }
  //
  attrs
  //
  {
    name = "lisp-project-" + attrs.name;
    builder = ./project-builder.sh;
  }
)