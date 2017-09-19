
{ buildLispPackage, stdenv, fetchurl, lisp-project_duologue, 
   lisp_drakma, lisp_cl-ansi-text, lisp_cl-readline, lisp_clavier, lisp_alexandria, lisp_anaphora,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_cl-ansi-text lisp_cl-readline lisp_clavier lisp_alexandria lisp_anaphora  ];
      inherit stdenv;
      systemName = "duologue";
      
      sourceProject = "${lisp-project_duologue}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_cl-ansi-text} ${lisp_cl-readline} ${lisp_clavier} ${lisp_alexandria} ${lisp_anaphora}";
      name = "lisp_duologue-20150407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
