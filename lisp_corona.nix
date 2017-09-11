
{ buildLispPackage, stdenv, fetchurl, lisp-project_corona, 
   lisp_anaphora, lisp_cl-fad, lisp_cl-virtualbox, lisp_ironclad, lisp_log4cl, lisp_trivial-download, lisp_trivial-extract, lisp_trivial-types,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_cl-fad lisp_cl-virtualbox lisp_ironclad lisp_log4cl lisp_trivial-download lisp_trivial-extract lisp_trivial-types  ];
      inherit stdenv;
      systemName = "corona";
      
      sourceProject = "${lisp-project_corona}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_cl-fad} ${lisp_cl-virtualbox} ${lisp_ironclad} ${lisp_log4cl} ${lisp_trivial-download} ${lisp_trivial-extract} ${lisp_trivial-types}";
      name = "lisp_corona-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
