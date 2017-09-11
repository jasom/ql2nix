
{ buildLispPackage, stdenv, fetchurl, lisp-project_lassie, 
   lisp_fsvd,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fsvd  ];
      inherit stdenv;
      systemName = "lassie";
      
      sourceProject = "${lisp-project_lassie}";
      patches = [];
      lisp_dependencies = "${lisp_fsvd}";
      name = "lisp_lassie-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
