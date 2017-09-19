
{ buildLispPackage, stdenv, fetchurl, lisp-project_corona, 
   lisp_anaphora, lisp_log4cl, lisp_ironclad, lisp_trivial-extract, lisp_trivial-types, lisp_trivial-download, lisp_cl-virtualbox,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_log4cl lisp_ironclad lisp_trivial-extract lisp_trivial-types lisp_trivial-download lisp_cl-virtualbox  ];
      inherit stdenv;
      systemName = "corona";
      
      sourceProject = "${lisp-project_corona}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_log4cl} ${lisp_ironclad} ${lisp_trivial-extract} ${lisp_trivial-types} ${lisp_trivial-download} ${lisp_cl-virtualbox}";
      name = "lisp_corona-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
