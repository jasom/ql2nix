
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-read-macro-tokens, 
   lisp_defmacro-enhance,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_defmacro-enhance  ];
      inherit stdenv;
      systemName = "cl-read-macro-tokens";
      
      sourceProject = "${lisp-project_cl-read-macro-tokens}";
      patches = [];
      lisp_dependencies = "${lisp_defmacro-enhance}";
      name = "lisp_cl-read-macro-tokens-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
