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
    asdf_path= ./asdf.lisp;
    nix_asdf= ./nix-asdf.lisp;
  }
)
