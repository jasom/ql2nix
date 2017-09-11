
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ansi-term, 
   lisp_alexandria, lisp_anaphora,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora  ];
      inherit stdenv;
      systemName = "cl-ansi-term";
      
      sourceProject = "${lisp-project_cl-ansi-term}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora}";
      name = "lisp_cl-ansi-term-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }