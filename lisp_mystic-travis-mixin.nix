
{ buildLispPackage, stdenv, fetchurl, lisp-project_mystic, 
   lisp_local-time, lisp_anaphora, lisp_split-sequence, lisp_cl-mustache,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_anaphora lisp_split-sequence lisp_cl-mustache  ];
      inherit stdenv;
      systemName = "mystic-travis-mixin";
      
      sourceProject = "${lisp-project_mystic}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_anaphora} ${lisp_split-sequence} ${lisp_cl-mustache}";
      name = "lisp_mystic-travis-mixin-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
