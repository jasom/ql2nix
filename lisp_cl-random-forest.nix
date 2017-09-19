
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-random-forest, 
   lisp_lparallel, lisp_alexandria, lisp_cl-online-learning,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lparallel lisp_alexandria lisp_cl-online-learning  ];
      inherit stdenv;
      systemName = "cl-random-forest";
      
      sourceProject = "${lisp-project_cl-random-forest}";
      patches = [];
      lisp_dependencies = "${lisp_lparallel} ${lisp_alexandria} ${lisp_cl-online-learning}";
      name = "lisp_cl-random-forest-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
