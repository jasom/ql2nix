
{ buildLispPackage, stdenv, fetchurl, lisp-project_unicly, 
   lisp_split-sequence, lisp_ironclad,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_ironclad  ];
      inherit stdenv;
      systemName = "unicly";
      
      sourceProject = "${lisp-project_unicly}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_ironclad}";
      name = "lisp_unicly-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
