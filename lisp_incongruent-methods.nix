
{ buildLispPackage, stdenv, fetchurl, lisp-project_incongruent-methods, 
   lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop  ];
      inherit stdenv;
      systemName = "incongruent-methods";
      
      sourceProject = "${lisp-project_incongruent-methods}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop}";
      name = "lisp_incongruent-methods-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
