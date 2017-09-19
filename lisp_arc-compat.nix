
{ buildLispPackage, stdenv, fetchurl, lisp-project_arc-compat, 
   lisp_babel, lisp_cl-fad, lisp_ironclad, lisp_bordeaux-threads, lisp_named-readtables, lisp_fiveam,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-fad lisp_ironclad lisp_bordeaux-threads lisp_named-readtables lisp_fiveam  ];
      inherit stdenv;
      systemName = "arc-compat";
      
      sourceProject = "${lisp-project_arc-compat}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-fad} ${lisp_ironclad} ${lisp_bordeaux-threads} ${lisp_named-readtables} ${lisp_fiveam}";
      name = "lisp_arc-compat-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
