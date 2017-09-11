
{ buildLispPackage, stdenv, fetchurl, lisp-project_inquisitor, 
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
      systemName = "inquisitor";
      
      sourceProject = "${lisp-project_inquisitor}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora}";
      name = "lisp_inquisitor-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
