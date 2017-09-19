
{ buildLispPackage, stdenv, fetchurl, lisp-project_percent-encoding, 
   lisp_babel, lisp_anaphora,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_anaphora  ];
      inherit stdenv;
      systemName = "percent-encoding";
      
      sourceProject = "${lisp-project_percent-encoding}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_anaphora}";
      name = "lisp_percent-encoding-20121013-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
