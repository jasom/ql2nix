
{ buildLispPackage, stdenv, fetchurl, lisp-project_let-plus, 
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
      systemName = "let-plus";
      
      sourceProject = "${lisp-project_let-plus}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora}";
      name = "lisp_let-plus-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
