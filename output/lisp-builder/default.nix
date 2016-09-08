lisp:

{ stdenv, buildInputs ? [], ... } @ attrs:

stdenv.mkDerivation (
  {
    
  }
  //
  attrs
  //
  {
    name = "lisp-" + attrs.name;
    builder = ./builder.sh;
  }
)
