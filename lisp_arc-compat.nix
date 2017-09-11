
{ buildLispPackage, stdenv, fetchurl, lisp-project_arc-compat, 
   lisp_babel, lisp_bordeaux-threads, lisp_cl-fad, lisp_fiveam, lisp_ironclad, lisp_named-readtables,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_bordeaux-threads lisp_cl-fad lisp_fiveam lisp_ironclad lisp_named-readtables  ];
      inherit stdenv;
      systemName = "arc-compat";
      
      sourceProject = "${lisp-project_arc-compat}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_bordeaux-threads} ${lisp_cl-fad} ${lisp_fiveam} ${lisp_ironclad} ${lisp_named-readtables}";
      name = "lisp_arc-compat-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
