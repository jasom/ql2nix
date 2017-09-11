
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-fluidinfo, 
   lisp_bordeaux-threads, lisp_cl-json, lisp_drakma, lisp_flexi-streams, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cl-json lisp_drakma lisp_flexi-streams lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-fluiddb";
      
      sourceProject = "${lisp-project_cl-fluidinfo}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cl-json} ${lisp_drakma} ${lisp_flexi-streams} ${lisp_split-sequence}";
      name = "lisp_cl-fluiddb-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
